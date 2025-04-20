import {
	type CacheType,
	type ChatInputCommandInteraction,
	Events,
	type Interaction,
	REST,
	Routes,
} from "discord.js";
import type { registerInterface } from "./types";

export async function registerSlashCommand({
	client,
	command,
	commands,
}: registerInterface) {
	if (!command && !commands) {
		throw "Must have a command or commands object!";
	}

	(await client.object).once(Events.ClientReady, async () => {
		try {
			const rest = new REST({ version: "10" }).setToken(client.token);

			if (command) {
				await rest.put(Routes.applicationCommands(client.clientId), {
					body: [command.data.toJSON()],
				});
				console.log(
					`[INFO] Slash command "${command.data.name}" registered successfully.`,
				);
			}

			if (commands) {
				await rest.put(Routes.applicationCommands(client.clientId), {
					body: commands.map((cmd) => cmd.data.toJSON()),
				});
				for (const cmd of commands) {
					console.log(
						`[INFO] Slash command "${cmd.data.name}" registered successfully.`,
					);
				}
			}

			console.log(
				`[INFO] Slash command "${command?.data.name}" registered successfully.`,
			);

			(await client.object).on(
				Events.InteractionCreate,
				async (interaction: Interaction<CacheType>) => {
					if (!interaction.isChatInputCommand()) return;

					const chatInputInteraction =
						interaction as ChatInputCommandInteraction;

					if (
						command &&
						chatInputInteraction.commandName === command.data.name
					) {
						try {
							await command.execute(chatInputInteraction);
						} catch (err) {
							console.error(
								`[ERROR] Failed to execute command ${command.data.name}`,
								err,
							);
						}
					}

					if (commands) {
						for (const cmd of commands) {
							if (chatInputInteraction.commandName === cmd.data.name) {
								try {
									await cmd.execute(chatInputInteraction);
								} catch (err) {
									console.error(
										`[ERROR] Failed to execute command ${cmd.data.name}`,
										err,
									);
								}
							}
						}
					}
				},
			);
		} catch (error) {
			console.error("[ERROR] Failed to register slash command:", error);
		}
	});
}
