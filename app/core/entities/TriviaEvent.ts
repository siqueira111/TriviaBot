import {
	Entity,
	PrimaryGeneratedColumn,
	Column,
	ManyToMany,
	ManyToOne,
	Timestamp,
	OneToMany,
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
	winnerId!: TriviaPlayer;

	@Column()
	Duration!: string;

	@Column()
	StartDate!: Date;

	@Column()
	EndDate!: Date;

	@Column()
	Description!: string;
}
