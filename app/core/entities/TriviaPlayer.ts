import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

@Entity()
export class TriviaPlayer {
	@PrimaryGeneratedColumn()
	Id!: number;

	@Column("bigint")
	DiscordId!: string;

	@Column()
	Name!: string | null;
}
