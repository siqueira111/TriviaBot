import {
  CacheType,
  ChatInputCommandInteraction,
  Events,
  Interaction,
  REST,
  Routes,
} from "discord.js";
import { registerInterface } from "./types";

export async function registerSlashCommand({
  client,
  command,
}: registerInterface) {
  (await client.object).once(Events.ClientReady, async () => {
    try {
      const rest = new REST({ version: "10" }).setToken(client.token);

      await rest.put(Routes.applicationCommands(client.clientId), {
        body: [command.data.toJSON()],
      });

      console.log(
        `[INFO] Slash command "${command.data.name}" registered successfully.`
      );

      (await client.object).on(
        Events.InteractionCreate,
        async (interaction: Interaction<CacheType>) => {
          if (!interaction.isChatInputCommand()) return;
      
          const chatInputInteraction = interaction as ChatInputCommandInteraction;
      
          if (chatInputInteraction.commandName === command.data.name) {
            try {
              await command.execute(chatInputInteraction);
            } catch (err) {
              console.error(
                `[ERROR] Failed to execute command ${command.data.name}`,
                err
              );
            }
          }
        }
      );
      
    } catch (error) {
      console.error("[ERROR] Failed to register slash command:", error);
    }
  });
}
