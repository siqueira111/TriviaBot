import dotenv from "dotenv";
import { connectDiscord } from "./actions/connectDiscord/connectDiscord";
import {
  connectMariaDB,
  connectionType,
} from "./actions/connectMariadb/connectMariaDB";

dotenv.config();

const db_conn = connectMariaDB({
  db: process.env.DB_NAME as string,
  host: process.env.DB_HOST as string,
  user: process.env.DB_USER as string,
  pass: process.env.DB_PASSWORD as string,
  port: parseInt(process.env.DB_PORT as string),
});

const ds_conn = connectDiscord({
  token: process.env.DS_TOKEN as string,
  client: parseInt(process.env.DS_CLIENT as string),
  channelId: parseInt(process.env.DS_CHANNEL_ID as string),
});
