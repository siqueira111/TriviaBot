import {
	type ChatInputCommandInteraction,
	SlashCommandBuilder,
} from "discord.js";
import type { commandInterface } from "@/types/types";

async function statsExecute(
	interaction: ChatInputCommandInteraction,
): Promise<void> {
	await interaction.reply(interaction.user.id);
}

const stats: commandInterface = {
	data: new SlashCommandBuilder()
		.setName("stats")
		.setDescription("Shows the stats of a player"),
	execute: statsExecute,
};

export default stats;
