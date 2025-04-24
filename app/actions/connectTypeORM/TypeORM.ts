import { DataSource } from "typeorm";
import type { connectionInterface } from "./types";
import { TriviaAttributes } from "@/core/entities/TriviaAttributes";
import { TriviaEvent } from "@/core/entities/TriviaEvent";
import { TriviaEventAttribute } from "@/core/entities/TriviaEventAttribute";
import { TriviaPlayer } from "@/core/entities/TriviaPlayer";
import { TriviaPlayerAttribute } from "@/core/entities/TriviaPlayerAttribute";
import { TriviaQuestions } from "@/core/entities/TriviaQuestions";
import { TriviaQuestionsOption } from "@/core/entities/TriviaQuestionsOption";

const RETRY_DELAY = 3000 as const;
const MAX_ATTEMPTS = 2 as const;
const TriviaEntities = [
	TriviaAttributes,
	TriviaEvent,
	TriviaEventAttribute,
	TriviaPlayer,
	TriviaPlayerAttribute,
	TriviaQuestions,
	TriviaQuestionsOption,
];

export async function connectTypeORM(connectionData: connectionInterface) {
	console.log("Initializing TypeORM....");
	const AppDataSource = new DataSource({
		type: "mariadb",
		host: connectionData.host,
		port: connectionData.port,
		username: connectionData.username,
		password: connectionData.password,
		database: connectionData.database,
		entities: TriviaEntities,
		migrations: ["core/migrations/**/*.ts"],
		synchronize: false,
		migrationsRun: true,
	});

	let attempts = 0;

	while (attempts < MAX_ATTEMPTS) {
		await new Promise((resolve) => setTimeout(resolve, RETRY_DELAY));
		try {
			await AppDataSource.initialize();
			console.log("Connection by TypeORM with MariaDB established ;)");
			break;
		} catch (err) {
			attempts++;

			if (attempts >= MAX_ATTEMPTS) {
				console.error("Connection by TypeORM with MariaDB failed ;(", err);
				break;
			}

			console.error(
				`Attempt ${attempts} failed. Retrying in ${RETRY_DELAY / 1000} seconds...`,
			);
		}
	}
	return AppDataSource;
}
