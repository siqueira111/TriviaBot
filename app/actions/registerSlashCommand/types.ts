import { Client } from "discord.js";
import { commandInterface } from "../../types/types";

interface clientInterface {
  object: Promise<Client>
  token: string,
  clientId: string,
};

export interface registerInterface {
  client: clientInterface;
  command: commandInterface;
}