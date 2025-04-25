import type {
  ButtonInteraction,
  ChatInputCommandInteraction,
  InteractionCollector,
} from "discord.js";
import type { TriviaQuestionsOption } from "@/core/entities/TriviaQuestionsOption";
import type { TriviaQuestions } from "@/core/entities/TriviaQuestions";

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
