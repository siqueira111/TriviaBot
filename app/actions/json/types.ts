interface FactsInterface {
	id: number;
	fact: string;
	true: number;
}

interface MultipleChoiceInterface {
	question: string;
	options: string[];
	answer: number;
}

export type FactsType = FactsInterface;
export type MultipleChoiceType = MultipleChoiceInterface;
