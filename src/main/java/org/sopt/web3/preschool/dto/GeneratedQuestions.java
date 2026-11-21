package org.sopt.web3.preschool.dto;

import java.util.List;

public record GeneratedQuestions(boolean canGenerate, List<Question> questions) {
	public record Question(String text, List<String> iconKeywords) {
	}
}
