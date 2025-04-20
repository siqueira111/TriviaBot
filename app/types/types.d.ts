import type {
	ChatInputCommandInteraction,
	SlashCommandBuilder,
} from "discord.js";

export interface commandInterface {
	data: SlashCommandBuilder;
	execute: (interaction: ChatInputCommandInteraction) => Promise<void>;
}

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
	eventsPlayed: number;
	currentEvent: PlayerEventDataInterface;
}

export enum QuestionEnum {
	MultipleChoice = "MultipleChoice",
	Boolean = "Boolean",
	CTF = "CaptureTheFlag",
}

interface QuestionInterface {
	questionId: number;
	question: Text;
	questionType: QuestionEnum;
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
export type QuestionType = QuestionInterface;
export type EventType = EventInterface;
