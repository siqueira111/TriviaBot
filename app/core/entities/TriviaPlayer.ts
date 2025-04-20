import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

@Entity()
export class TriviaEvent {
	@PrimaryGeneratedColumn()
	Id!: number;

	@Column()
	DiscordId!: number;

	@Column()
	Name!: string;
}
