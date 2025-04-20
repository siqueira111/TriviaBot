import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

@Entity()
export class TriviaEvent {
	@PrimaryGeneratedColumn()
	Id!: number;

	@Column()
	question!: number;

	@Column()
	Content!: string;

	@Column()
	IsCorrect!: boolean;
}
