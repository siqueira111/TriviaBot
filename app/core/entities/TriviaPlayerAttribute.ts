import {
	Entity,
	Column,
	ManyToMany,
	ManyToOne,
	PrimaryGeneratedColumn,
} from "typeorm";
import { TriviaAttributes } from "./TriviaAttributes";
import { TriviaPlayer } from "./TriviaPlayer";

@Entity()
export class TriviaPlayerAttribute {
	@PrimaryGeneratedColumn()
	Id!: number;

	@ManyToOne(
		() => TriviaPlayer,
		(player) => player.Id,
	)
	player!: TriviaPlayer;

	@ManyToOne(
		() => TriviaAttributes,
		(attribute) => attribute.Attribute,
	)
	attribute!: TriviaAttributes;

	@Column()
	Value!: string;
}
