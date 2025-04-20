import mariadb from "mariadb"
import { connectionInterface } from "./types";

const RETRY_DELAY = 3000 as const;
const MAX_ATTEMPTS = 10 as const;

export async function connectMariaDB(connectionInfo: connectionInterface) {
  let connection,
    attempts = 0;
  
  while (attempts < MAX_ATTEMPTS && !connection) {
    try {
      connection = await mariadb.createConnection({
        host: connectionInfo.host,
        user: connectionInfo.user,
        password: connectionInfo.pass,
        database: connectionInfo.db,
        port: 3306,
      });

      console.log("Connection with MariaDB established ;)");
    } catch (err) {
      attempts++

      if (attempts >= MAX_ATTEMPTS) {
        console.error("Connection with MariDB failed ;(", err);
        break;
      } else console.error(`Attempt ${attempts} failed. Retrying in ${RETRY_DELAY / 1000} seconds...`);

      await new Promise(resolve => setTimeout(resolve, RETRY_DELAY));
    }
  }

  return connection;
}
