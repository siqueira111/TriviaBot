import { connectDiscord } from "./actions/connectDiscord/connectDiscord";
import { registerSlashCommand } from "./actions/registerSlashCommand/registerSlashCommand";
import { connectTypeORM } from "./actions/connectTypeORM/TypeORM";
import ping from "./commands/(player)/ping/ping";
import leaderboard from "./commands/(player)/leaderboard/leaderboard";
import stats from "./commands/(player)/stats/stats";
import play from "./commands/(player)/play/play";
import type { DataSource } from "typeorm";
// import { ReadFacts, ReadMultipleChoices } from "./actions/json/JsonProducers";
// import { facts } from "./facts.json";
// import { multiple } from "./multipleChoice.json";

const db_host = process.env.DB_HOST as string;
const db_port = Number.parseInt(process.env.DB_PORT as string);
const db_user = process.env.DB_USER as string;
const db_password = process.env.DB_PASSWORD as string;
const db_name = process.env.DB_NAME as string;

const ds_token = process.env.DS_TOKEN as string;
const ds_client = process.env.DS_CLIENT_ID as string;
const ds_channelId = process.env.DS_EVENT_CHANNEL_ID as string;

export let AppDataSource: Promise<DataSource>;

async function initialize() {
  console.log("Initializing application....");
  if (ds_token === "") {
    throw new Error("This app requires a discord token to be set");
  }
  if (ds_client === "") {
    throw new Error("This app requires a bot client id to be set");
  }

  AppDataSource = connectTypeORM({
    host: db_host,
    port: db_port,
    username: db_user,
    password: db_password,
    database: db_name,
  });

  const ds_conn = await connectDiscord({
    token: ds_token,
    client: ds_client,
    channelId: ds_channelId,
  });

  // ReadFacts(facts);
  // ReadMultipleChoices(multiple);

  await registerSlashCommand({
    client: { token: ds_token, clientId: ds_client, object: ds_conn },
    commands: [ping, play, leaderboard, stats],
  });
}

initialize();
