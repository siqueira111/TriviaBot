const mariadb = require("mariadb");
import { connectionInterface } from "./types";

export type connectionType = connectionInterface;

export async function connectMariaDB(connectionInfo: connectionType) {
  const retryDelay = 1000;
  const maxAttempts = 3;
  let attempts = 0;
  let connection;
  
  while (attempts < maxAttempts) {
    try {
      const connection = await mariadb.createConnection({
        host: connectionInfo.host,
        user: connectionInfo.user,
        password: connectionInfo.pass,
        database: connectionInfo.db,
        port: connectionInfo.port,
      });

      console.log("Connection with MariaDB established ;)");
      break;
    } catch (err) {
      console.error(`Attempt ${attempts} failed. Retrying in ${retryDelay / 1000} seconds...`);
      if (attempts >= maxAttempts) {
        console.error("Connection with MariDB failed ;(", err);
        break;
      }
      await new Promise(resolve => setTimeout(resolve, retryDelay));
    }
  }

  return connection;
}
