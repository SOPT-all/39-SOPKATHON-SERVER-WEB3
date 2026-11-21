package org.sopt.web3.school.dto;

import java.util.List;

public record StartRoundResponse(long roundId, List<Question> questions) {

	public record Question(long questionId, String text, List<Choice> choices) {
	}

	public record Choice(long choiceId, String text) {
	}
}
