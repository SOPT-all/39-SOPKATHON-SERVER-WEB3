package org.sopt.web3.school.dto;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;

public record RoundResultResponse(int answeredCount, int correctCount, List<Review> reviews) {

	@JsonInclude(JsonInclude.Include.NON_NULL)
	public record Review(long questionId, boolean correct, String correctAnswer,
		SelectedChoice selectedChoice, String feedback) {
	}

	public record SelectedChoice(long choiceId, String text) {
	}
}
