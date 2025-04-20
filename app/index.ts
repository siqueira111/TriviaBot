import dotenv from "dotenv";
import { connectDiscord } from "./actions/connectDiscord/connectDiscord";
import {
  connectMariaDB,
  connectionType,
} from "./actions/connectMariadb/connectMariaDB";
import { registerSlashCommand } from "./actions/registerSlashCommand/registerSlashCommand";
import ping from "./commands/(player)/ping/ping";

dotenv.config();

const db_conn = connectMariaDB({
  db: process.env.DB_NAME as string,
  host: process.env.DB_HOST as string,
  user: process.env.DB_USER as string,
  pass: process.env.DB_PASSWORD as string,
  port: parseInt(process.env.DB_PORT as string),
});

const token = process.env.DS_TOKEN as string;
const client = process.env.DS_CLIENT_ID as string;
const channelId = process.env.DS_EVENT_CHANNEL_ID as string;

async function initialize() {
  const ds_conn = await connectDiscord({
    token,
    client,
    channelId,
  });

  await registerSlashCommand({
    client: { token: token, clientId: client, object: ds_conn },
    command: ping,
  });
}

initialize().catch((err) => console.error("Failed to initialize bot:", err));
