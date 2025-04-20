import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

@Entity()
export class TriviaPlayer {
	@PrimaryGeneratedColumn()
	Id!: number;

	@Column()
	DiscordId!: number;

	@Column()
	Name!: string;
}
