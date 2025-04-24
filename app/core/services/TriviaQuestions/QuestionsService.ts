import { TriviaPlayer } from "@/core/entities/TriviaPlayer";
import { TriviaQuestions } from "@/core/entities/TriviaQuestions";
import { AppDataSource } from "@/index";

export async function getPlayer(player: TriviaPlayer) {
	const playerData = (await AppDataSource)
		.getRepository(TriviaPlayer)
		.findOneBy({ DiscordId: player.DiscordId });
	return await playerData;
}

export async function createQuestionData(question: TriviaQuestions) {
	const questionRepository = (await AppDataSource).getRepository(
		TriviaQuestions,
	);
	return await questionRepository.save(question);
}
