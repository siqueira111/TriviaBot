import { Entity, PrimaryGeneratedColumn, Column, ManyToOne } from "typeorm";
import { TriviaEvent } from "./TriviaEvent";

export enum QuestionEnum {
	CTF = 0,
	Boolean = 1,
	MultipleChoice = 2,
}

@Entity()
export class TriviaQuestions {
	@PrimaryGeneratedColumn()
	Id!: number;

	@ManyToOne(
		() => TriviaEvent,
		(event) => event.Id,
	)
	event!: TriviaEvent;

	@Column()
	Content!: string;

	@Column({
		type: "enum",
		enum: QuestionEnum,
	})
	Type!: QuestionEnum;
}
