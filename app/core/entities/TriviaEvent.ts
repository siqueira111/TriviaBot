import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

@Entity()
export class TriviaEvent {
	@PrimaryGeneratedColumn()
	Id!: number;

	@Column()
	Duration!: string;

	@Column()
	StartDate!: Date;

	@Column()
	EndDate!: Date;

	@Column()
	Description!: string;
}
