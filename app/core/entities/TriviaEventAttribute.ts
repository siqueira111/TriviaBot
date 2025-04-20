import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

@Entity()
export class TriviaEvent {
	@PrimaryGeneratedColumn()
	event!: number;

	@Column()
	attribute!: string;

	@Column()
	Value!: string;
}
