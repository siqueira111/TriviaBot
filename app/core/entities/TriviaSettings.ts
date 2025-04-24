import { Entity, Column, PrimaryColumn } from "typeorm";

@Entity()
export class TriviaSettings {
	@PrimaryColumn()
	Setting!: string;

	@Column()
	Value!: string;

	@Column()
	Status!: boolean;
}
