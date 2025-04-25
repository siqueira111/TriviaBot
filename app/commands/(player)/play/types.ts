import {
  ButtonInteraction,
  ChatInputCommandInteraction,
  InteractionCollector,
} from "discord.js";
import { TriviaQuestionsOption } from "@/core/entities/TriviaQuestionsOption";
import { TriviaQuestions } from "@/core/entities/TriviaQuestions";

export interface questHandlerInterface {
  interaction: ButtonInteraction;
  fact: TriviaQuestions;
  options?: TriviaQuestionsOption;
  EditLast: (content: string) => Promise<any>;
  Send?: (content: string) => Promise<any>;
  collector?: InteractionCollector<ButtonInteraction>;
}

export interface produceInterface {
  interaction: ChatInputCommandInteraction;
  fact: TriviaQuestions;
  options?: TriviaQuestionsOption;
  EditLast: (content: string) => Promise<any>;
  Send?: (content: string) => Promise<any>;
  collector?: InteractionCollector<ButtonInteraction>;
}
