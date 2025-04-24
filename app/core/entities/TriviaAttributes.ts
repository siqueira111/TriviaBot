import { Entity, PrimaryGeneratedColumn, Column, PrimaryColumn } from "typeorm";

export enum AttributeEnum {
	Event = "Event",
	Player = "Player",
}

@Entity()
export class TriviaAttributes {
	@PrimaryColumn()
	Attribute!: string;

	@Column()
	Description!: string;

	@Column({
		type: "enum",
		enum: AttributeEnum,
	})
	Type!: AttributeEnum;

	@Column()
	Status!: boolean;
}
