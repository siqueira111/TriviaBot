import { TriviaPlayer } from "@/core/entities/TriviaPlayer";
import { AppDataSource } from "@/index";

export async function getPlayer(player: TriviaPlayer) {
	const playerData = (await AppDataSource)
		.getRepository(TriviaPlayer)
		.findOneBy({ DiscordId: player.DiscordId });
	return await playerData;
}

export async function createPlayerData(player: TriviaPlayer) {
	const playerRepository = (await AppDataSource).getRepository(TriviaPlayer);
	return await playerRepository.save(player);
}
