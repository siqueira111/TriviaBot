import {
	Entity,
	PrimaryGeneratedColumn,
	Column,
	ManyToOne,
	ManyToMany,
} from "typeorm";
import { TriviaEvent } from "./TriviaEvent";
import { TriviaAttributes } from "./TriviaAttributes";

@Entity()
export class TriviaEventAttribute {
	@PrimaryGeneratedColumn()
	Id!: number;

	@ManyToOne(
		() => TriviaEvent,
		(event) => event.Id,
	)
	event!: TriviaEvent;

	@ManyToOne(
		() => TriviaAttributes,
		(attribute) => attribute.Attribute,
	)
	attribute!: TriviaAttributes;

	@Column()
	Value!: string;
}
