import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

export enum AttributeEnum {
	Event = 0,
	Player = 1,
}

@Entity()
export class TriviaAttributes {
	@PrimaryGeneratedColumn()
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
