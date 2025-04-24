import {
	Entity,
	PrimaryGeneratedColumn,
	Column,
	ManyToOne,
	Index,
} from "typeorm";
import { TriviaEvent } from "./TriviaEvent";
import { QuestionEnum } from "@/enums/enums";

@Entity()
export class TriviaQuestions {
	@PrimaryGeneratedColumn()
	Id!: number;

	@ManyToOne(
		() => TriviaEvent,
		(event) => event.Id,
		{ nullable: true },
	)
	@Index()
	event?: TriviaEvent | null;

	@Column()
	Content!: string;

	@Column({
		type: "enum",
		enum: QuestionEnum,
	})
	Type!: QuestionEnum;

	@Column()
	IsTrue!: boolean;
}
