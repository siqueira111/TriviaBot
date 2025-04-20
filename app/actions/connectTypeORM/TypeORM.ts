import { DataSource } from "typeorm";
import { TriviaEvent } from "../../core/entities/TriviaEvent";
import type { connectionInterface } from "./types";

const RETRY_DELAY = 3000 as const;
const MAX_ATTEMPTS = 10 as const;

export async function connectTypeORM(connectionData: connectionInterface) {
	console.log("Initializing TypeORM....");
	const AppDataSource = new DataSource({
		type: "mariadb",
		host: connectionData.host,
		port: connectionData.port,
		username: connectionData.username,
		password: connectionData.password,
		database: connectionData.database,
		entities: [TriviaEvent],
		migrations: ["core/migrations/**/*.ts"],
		synchronize: false,
	});

	let attempts = 0;

	while (attempts < MAX_ATTEMPTS) {
		try {
			await AppDataSource.initialize();
			console.log("Connection by TypeORM with MariaDB established ;)");
			break;
		} catch (err) {
			attempts++;

			if (attempts >= MAX_ATTEMPTS) {
				console.error("Connection by TypeORM with MariDB failed ;(", err);
				break;
			}

			console.error(
				`Attempt ${attempts} failed. Retrying in ${RETRY_DELAY / 1000} seconds...`,
			);

			await new Promise((resolve) => setTimeout(resolve, RETRY_DELAY));
		}
	}
}
