import { TriviaQuestions } from "@/core/entities/TriviaQuestions";
import type { FactsType, MultipleChoiceType } from "./types";
import { QuestionEnum } from "@/enums/enums";
import { createQuestionData } from "@/core/services/TriviaQuestions/QuestionsService";
import { AppDataSource } from "@/index";
import { TriviaQuestionsOption } from "@/core/entities/TriviaQuestionsOption";
import { createOptionData } from "@/core/services/TriviaQuestionsOption/QuestionsOptionService";

export async function ReadFacts(facts: FactsType[]) {
  facts.map((fact) => {
    const newFact = new TriviaQuestions();
    newFact.IsTrue = fact.true === 1;
    newFact.Content = fact.fact;
    newFact.Type = QuestionEnum.Boolean;
    createQuestionData(newFact);
  });
}

export async function ReadMultipleChoices(questions: MultipleChoiceType[]) {
  questions.map((question) => {
    const quest = new TriviaQuestions();
    quest.Type = QuestionEnum.MultipleChoice;
    quest.IsTrue = true;
    quest.Content = question.question;
    createQuestionData(quest);
    question.options.map((option) => {
      const opt = new TriviaQuestionsOption();
      opt.Content = option;
      opt.IsCorrect = option === question.options[question.answer];
      opt.question = quest;
      createOptionData(opt);
    });
  });
}
