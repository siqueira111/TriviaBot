import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

export enum AttributeEnum {
	Event = 0,
	Player = 1,
}

@Entity()
export class TriviaEvent {
	@PrimaryGeneratedColumn()
	Id!: string;

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
