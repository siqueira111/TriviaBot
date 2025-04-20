import {
	Entity,
	PrimaryGeneratedColumn,
	Column,
	ManyToMany,
	ManyToOne,
	Timestamp,
} from "typeorm";
import { TriviaPlayer } from "./TriviaPlayer";

@Entity()
export class TriviaEvent {
	@PrimaryGeneratedColumn()
	Id!: number;

	@ManyToOne(
		() => TriviaPlayer,
		(player) => player.Id,
	)
	winnerId!: number;

	@Column()
	Duration!: string;

	@Column()
	StartDate!: Date;

	@Column()
	EndDate!: Date;

	@Column()
	Description!: string;
}
