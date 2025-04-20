import mariadb from "mariadb"
import { connectionInterface } from "./types";

export type connectionType = connectionInterface;

export async function connectMariaDB(connectionInfo: connectionType) {
  const retryDelay = 1000;
  const maxAttempts = 3;
  let attempts = 0;
  let connection;
  
  while (attempts < maxAttempts) {
    try {
      connection = await mariadb.createConnection({
        host: connectionInfo.host,
        user: connectionInfo.user,
        password: connectionInfo.pass,
        database: connectionInfo.db,
        port: 3306,
      });

      console.log("Connection with MariaDB established ;)");
      break;
    } catch (err) {
      attempts++

      if (attempts >= maxAttempts) {
        console.error("Connection with MariDB failed ;(", err);
        break;
      } else console.error(`Attempt ${attempts} failed. Retrying in ${retryDelay / 1000} seconds...`);

      await new Promise(resolve => setTimeout(resolve, retryDelay));
    }
  }

  return connection;
}
