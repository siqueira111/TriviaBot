interface PlayerInterface {
  userId: number;
  rank: number;
  name: string;
}

interface PlayerEventDataInterface {
  accuracy: number;
  wonCount: number;
  loseCount: number;
  totalRounds: number;
}

interface PlayerStatsInterface {
  player: PlayerInterface;
  eventsWon: number;
  currentEvent: PlayerEventDataInterface;
  eventHistory?: PlayerEventDataInterface[];
}

interface QuestionOptionsInterface {
  optionId: number;
  content: Text;
}

enum QuestionEnumInterface {
  MultipleChoice = "MultipleChoice",
  Boolean = "Boolean",
}

interface QuestionInterface {
  questionId: number;
  question: Text;
  questionType: QuestionEnumInterface;
  correctAnswer: number;
}

interface EventInterface {
  totalPlayers: number;
  winner: PlayerInterface;
  duration: number;
  questions: QuestionInterface[];
  eventDate: Date;
}

export type PlayerType = PlayerInterface;
export type PlayerStatsType = PlayerStatsInterface;
export type PlayerEventType = PlayerEventDataInterface;
export type OptionType = QuestionOptionsInterface;
export type OptionEnum = QuestionEnumInterface;
export type QuestionType = QuestionInterface;
export type EventType = EventInterface;
