import { Entity, PrimaryGeneratedColumn, Column, ManyToOne } from "typeorm";
import { TriviaQuestions } from "./TriviaQuestions";

@Entity()
export class TriviaQuestionsOption {
  @PrimaryGeneratedColumn()
  Id!: number;

  @ManyToOne(() => TriviaQuestions, (question) => question.Id)
  question!: TriviaQuestions;

  @Column()
  Content!: string;

  @Column()
  IsCorrect!: boolean;
}
