import {
	type ChatInputCommandInteraction,
	SlashCommandBuilder,
} from "discord.js";
import type { commandInterface } from "@/types/types";
import {
	createPlayerData,
	getPlayer,
} from "@/core/services/TriviaPlayer/PlayerService";
import { TriviaPlayer } from "@/core/entities/TriviaPlayer";

async function playExecute(
	interaction: ChatInputCommandInteraction,
): Promise<void> {
	const player: TriviaPlayer = {
		Id: 0,
		DiscordId: interaction.user.id,
		Name: interaction.user.globalName,
	};

	let playerData = await getPlayer(player);
	if (!playerData) {
		const newPlayer = new TriviaPlayer();
		newPlayer.DiscordId = interaction.user.id;
		newPlayer.Name = interaction.user.globalName;
		playerData = await createPlayerData(newPlayer);
		await interaction.reply("New Player!");
	} else {
		await interaction.reply("Old Player!");
	}
}

const play: commandInterface = {
	data: new SlashCommandBuilder()
		.setName("play")
		.setDescription("Starts playing the event"),
	execute: playExecute,
};

export default play;
