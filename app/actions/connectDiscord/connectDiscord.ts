const { Client, Events, GatewayIntentBits } = require("discord.js");
import { connectionInterface } from "./types";

export type connectionType = connectionInterface;

export async function connectDiscord(connectionInfo: connectionInterface) {
  const client = new Client({ intents: [GatewayIntentBits.Guilds] });

  client.once(Events.ClientReady, (readyClient: { user: { tag: any } }) => {
    console.log(`Ready! Logged in as ${readyClient.user.tag}`);
  });

  client.login(connectionInfo.token);
  return client;
}
