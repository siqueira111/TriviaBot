import {
	type ChatInputCommandInteraction,
	SlashCommandBuilder,
} from "discord.js";
import type { commandInterface } from "@/types/types";

async function playExecute(
	interaction: ChatInputCommandInteraction,
): Promise<void> {
	await interaction.reply("Play!");
}

const play: commandInterface = {
	data: new SlashCommandBuilder()
		.setName("play")
		.setDescription("Start the event for a player!"),
	execute: playExecute,
};

export default play;
