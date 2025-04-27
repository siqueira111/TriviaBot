const {
  SlashCommandBuilder,
  EmbedBuilder,
  ActionRowBuilder,
  ButtonBuilder,
  ButtonStyle,
  MessageFlags,
} = require("discord.js");

import type { commandInterface } from "@/types/types";
import {
  createPlayerData,
  getPlayer,
} from "@/core/services/TriviaPlayer/PlayerService";
import { TriviaPlayer } from "@/core/entities/TriviaPlayer";
import {
  type ButtonInteraction,
  type ChatInputCommandInteraction,
  ComponentType,
} from "discord.js";
import { TriviaQuestionsOption } from "@/core/entities/TriviaQuestionsOption";
import { TriviaQuestions } from "@/core/entities/TriviaQuestions";
import { QuestionEnum } from "@/enums/enums";
import type {
  produceInterface,
  questHandlerInterface,
  questionOptionsPair,
} from "./types";
import { AppDataSource } from "@/index";

async function generateRandomSequence(maxQuestion = 25) {
  function shuffleArray(array: questionOptionsPair[]) {
    for (let i = array.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [array[i], array[j]] = [array[j], array[i]];
    }
  }

  const facts = await (await AppDataSource)
    .getRepository(TriviaQuestions)
    .findBy({ Type: QuestionEnum.Boolean });
  const booleanQuestions: questionOptionsPair[] = [
    ...facts.map((fact) => ({
      question: fact,
      options: null,
    })),
  ];

  const options = await (await AppDataSource)
    .getRepository(TriviaQuestionsOption)
    .find({ relations: { question: {} } });
  console.log(options);
  const multipleChoice = await (await AppDataSource)
    .getRepository(TriviaQuestions)
    .findBy({ Type: QuestionEnum.MultipleChoice });
  const multipleChoiceQuestions: questionOptionsPair[] = await Promise.all([
    ...multipleChoice.map(async (quest) => ({
      question: quest,
      options: options.filter((opt) => opt.question.Id === quest?.Id),
    })),
  ]);

  const allQuestions = [...booleanQuestions, ...multipleChoiceQuestions];
  // const allQuestions = [...multipleChoiceQuestions];
  // const allQuestions = [...booleanQuestions];
  shuffleArray(allQuestions);

  return allQuestions;
}

async function questionHandler({
  interaction,
  fact,
  options,
  EditLast,
  collector,
}: questHandlerInterface) {
  let response = true;

  switch (fact?.Type) {
    case QuestionEnum.Boolean:
      response = (interaction.customId === "true") === fact.IsTrue;
      await EditLast(response ? "Correct!" : "Incorrect! You suck!");
      break;

    case QuestionEnum.MultipleChoice:
      if (!options) {
        throw new Error("Options aren't loaded!");
      }
      response = options[parseInt(interaction.customId)].IsCorrect;
      await EditLast(response ? "Correct!" : "Incorrect! You suck!");
      break;

    case QuestionEnum.CTF:
      break;
  }

  collector?.stop();
  return response;
}

async function produceQuestion(
  { interaction, fact, options }: produceInterface,
  questionCounter = 0
) {
  console.log({ options });
  const booleanComponent = [
    new ActionRowBuilder().addComponents(
      new ButtonBuilder()
        .setCustomId("true")
        .setStyle(ButtonStyle.Success)
        .setLabel("True"),
      new ButtonBuilder()
        .setCustomId("false")
        .setStyle(ButtonStyle.Danger)
        .setLabel("False")
    ),
  ];

  const multipleChoiceComponent = [
    new ActionRowBuilder().addComponents(
      ...(options ?? []).map((option, index) =>
        new ButtonBuilder()
          .setCustomId(String(index))
          .setStyle(ButtonStyle.Primary)
          .setLabel(option.Content)
      )
    ),
  ];

  const components =
    fact?.Type == QuestionEnum.Boolean
      ? booleanComponent
      : multipleChoiceComponent;

  interaction.editReply({
    embeds: [
      new EmbedBuilder()
        .setTitle("Play Game")
        .setDescription(
          `No way this is true, right? you will not be able to answer it ;3\n\n\`${fact?.Content}\``
        )
        .setColor("7ad1a1")
        .setFooter({ text: `Questions answered: ${questionCounter}` }),
    ],

    components: components,
    flags: [MessageFlags.Ephemeral],
  });
}

async function playExecute(
  interaction: ChatInputCommandInteraction
): Promise<void> {
  const Send = interaction.reply.bind(interaction);
  const EditLast = interaction.editReply.bind(interaction);
  const filter = (i: { deferUpdate: () => void; user: { id: string } }) => {
    i.deferUpdate();
    return i.user.id === interaction.user.id;
  };

  const player: TriviaPlayer = {
    Id: 0,
    DiscordId: interaction.user.id,
    Name: interaction.user.globalName,
  };

  let playerData = await getPlayer(player);
  if (!playerData) {
    const newPlayer = new TriviaPlayer();
    newPlayer.DiscordId = interaction.user.id;
    newPlayer.Name = interaction.user.globalName;
    playerData = await createPlayerData(newPlayer);
  }

  await Send("Welcome to the game, Lets play!");

  const Questions = await generateRandomSequence();

  console.log(`There are a total of ${Questions.length} questions!`);

  let questionCounter = 0;
  for (const question of Questions) {
    console.log({ question });

    const collector = interaction.channel?.createMessageComponentCollector({
      componentType: ComponentType.Button,
      filter,
      time: 15000,
    });

    await produceQuestion(
      {
        interaction: interaction,
        fact: question.question,
        options: question.options?.filter(
          (opt) => opt.question.Id === question.question?.Id
        ),
        EditLast: EditLast,
        collector: collector,
        Send: Send,
      },
      questionCounter
    );

    const answered = await new Promise((resolve) => {
      collector?.on("collect", async (userInteraction: ButtonInteraction) => {
        const correctAnswer = await questionHandler({
          interaction: userInteraction,
          fact: question.question,
          options: question.options?.filter(
            (opt) => opt.question.Id === question.question?.Id
          ),
          collector: collector,
          EditLast: EditLast,
        });

        if (!correctAnswer) {
          await EditLast({ content: "Bruh, U suck....", components: [] });
          collector?.stop();
        }

        resolve(correctAnswer);
      });
    });

    if (!answered) {
      break;
    }
    questionCounter++;
  }
}

const play: commandInterface = {
  data: new SlashCommandBuilder()
    .setName("play")
    .setDescription("Starts playing the event"),
  execute: playExecute,
};

export default play;
