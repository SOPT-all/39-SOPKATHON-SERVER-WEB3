package org.sopt.web3.preschool.dto;

import java.util.List;

public record RecommendationResponse(String placeName, List<Question> questions) {
	public record Question(String text, String imageUrl) {
	}
}
