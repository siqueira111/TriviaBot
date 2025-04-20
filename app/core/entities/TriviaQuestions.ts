import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

export enum QuestionEnum {
	CTF = 0,
	Boolean = 1,
	MultipleChoice = 2,
}

@Entity()
export class TriviaEvent {
	@PrimaryGeneratedColumn()
	Id!: number;

	@Column()
	event!: string;

	@Column()
	Content!: string;

	@Column({
		type: "enum",
		enum: QuestionEnum,
	})
	Type!: QuestionEnum;
}
