import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

@Entity()
export class TriviaEvent {
	@PrimaryGeneratedColumn()
	player!: number;

	@Column()
	attribute!: number;

	@Column()
	Value!: string;
}
