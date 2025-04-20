import {
	type ChatInputCommandInteraction,
	SlashCommandBuilder,
} from "discord.js";
import type { commandInterface } from "@/types/types";

async function pingExecute(
	interaction: ChatInputCommandInteraction,
): Promise<void> {
	await interaction.reply("Pong!");
}

const ping: commandInterface = {
	data: new SlashCommandBuilder()
		.setName("ping")
		.setDescription("Replies with Pong!"),
	execute: pingExecute,
};

export default ping;
