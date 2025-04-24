import { TriviaAttributes } from "@/core/entities/TriviaAttributes";
import { AppDataSource } from "@/index";

export async function getAttributes() {
	const attributes = (await AppDataSource)
		.getRepository(TriviaAttributes)
		.find();
	return await attributes;
}
