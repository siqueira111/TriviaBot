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
import type { produceInterface, questHandlerInterface } from "./types";
import { AppDataSource } from "@/index";

async function generateRandomSequence(maxQuestion = 25) {
  function shuffleArray(array: TriviaQuestions[]) {
    for (let i = array.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [array[i], array[j]] = [array[j], array[i]];
    }
  }

  // read all the questions, shuffle it by id, and then return the ids in an array

  const booleanQuestions = await (await AppDataSource)
    .getRepository(TriviaQuestions)
    .findBy({ Type: QuestionEnum.Boolean });

  shuffleArray(booleanQuestions);

  /*
export async function getPlayer(player: TriviaPlayer) {
  const playerData = (await AppDataSource)
    .getRepository(TriviaPlayer)
    .findOneBy({ DiscordId: player.DiscordId });
  return await playerData;
}
*/

  return booleanQuestions;
}

async function questionHandler({
  interaction,
  fact,
  options,
  EditLast,
  collector,
}: questHandlerInterface) {
  let response = true;

  if (fact.Type === QuestionEnum.Boolean) {
    response = (interaction.customId === "true") === fact.IsTrue;
    await EditLast(response ? "Correct!" : "Incorrect! You suck!");
  }

  if (fact.Type === QuestionEnum.MultipleChoice) {
  }

  collector?.stop();
  return response;
}

async function produceQuestion({ interaction, fact }: produceInterface) {
  const comps = [
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

  interaction.editReply({
    embeds: [
      new EmbedBuilder()
        .setTitle("Play Game")
        .setDescription(
          `No way this is true, right? you will not be able to answer it ;3\n\`${fact.Content}\``
        )
        .setColor("7ad1a1")
        .setFooter({ text: `Question $ {questionCounter}` }),
    ],
    components: comps,
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

  let Fact = new TriviaQuestions();

  Fact.Content = "Do you know that flamm knows?";
  Fact.IsTrue = true;
  Fact.Type = QuestionEnum.Boolean;
  Fact.event = null;

  const Questions = await generateRandomSequence();

  for (const question of Questions) {
    console.log({ question });

    const collector = interaction.channel?.createMessageComponentCollector({
      componentType: ComponentType.Button,
      filter,
      time: 15000,
    });

    await produceQuestion({
      interaction: interaction,
      fact: question,
      EditLast: EditLast,
      collector: collector,
      Send: Send,
    });

    const answered = await new Promise((resolve) => {
      collector?.on("collect", async (userInteraction: ButtonInteraction) => {
        const correctAnswer = await questionHandler({
          interaction: userInteraction,
          fact: question,
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
  }
}

const play: commandInterface = {
  data: new SlashCommandBuilder()
    .setName("play")
    .setDescription("Starts playing the event"),
  execute: playExecute,
};

export default play;
