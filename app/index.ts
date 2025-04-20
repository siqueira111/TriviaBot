import dotenv from "dotenv";
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
  port: 3306,
});

