import {
	type ChatInputCommandInteraction,
	SlashCommandBuilder,
} from "discord.js";
import type { commandInterface } from "@/types/types";

async function leaderboardExecute(
	interaction: ChatInputCommandInteraction,
): Promise<void> {
	await interaction.reply("Leaderboard!");
}

const leaderboard: commandInterface = {
	data: new SlashCommandBuilder()
		.setName("leaderboard")
		.setDescription("Displays the leaderboard"),
	execute: leaderboardExecute,
};

export default leaderboard;
