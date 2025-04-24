import { TriviaQuestionsOption } from "@/core/entities/TriviaQuestionsOption";
import { AppDataSource } from "@/index";

// export async function getPlayer(player: TriviaPlayer) {
// 	const playerData = (await AppDataSource)
// 		.getRepository(TriviaPlayer)
// 		.findOneBy({ DiscordId: player.DiscordId });
// 	return await playerData;
// }

export async function createOptionData(Option: TriviaQuestionsOption) {
	const optionRepository = (await AppDataSource).getRepository(
		TriviaQuestionsOption,
	);
	return await optionRepository.save(Option);
}
