package org.sopt.web3.preschool.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.sopt.web3.global.exception.BusinessException;
import org.sopt.web3.preschool.code.PreschoolErrorCode;
import org.sopt.web3.preschool.dto.GeneratedQuestions;
import org.sopt.web3.preschool.dto.RecommendationRequest;
import org.sopt.web3.preschool.dto.RecommendationResponse;
import org.springframework.stereotype.Service;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RecommendationService {
	private final QuestionGenerator generator;
	private final IconifyClient iconifyClient;

	public RecommendationResponse recommend(RecommendationRequest request) {
		GeneratedQuestions generated = generator.generate(request, 3, List.of());
		if (generated != null && !generated.canGenerate()) {
			throw new BusinessException(PreschoolErrorCode.CANNOT_GENERATE);
		}
		validate(generated, 3);
		List<GeneratedQuestions.Question> originals = generated.questions();
		List<RecommendationResponse.Question> questions = new ArrayList<>();
		for (GeneratedQuestions.Question question : originals) {
			Optional<String> image = iconifyClient.findImage(question.iconKeywords());
			if (image.isEmpty()) {
				List<String> excluded = new ArrayList<>(originals.stream().map(GeneratedQuestions.Question::text).toList());
				excluded.addAll(questions.stream().map(RecommendationResponse.Question::text).toList());
				GeneratedQuestions retry = generator.generate(request, 1, excluded);
				validate(retry, 1);
				question = retry.questions().getFirst();
				image = iconifyClient.findImage(question.iconKeywords());
			}
			if (image.isEmpty()) {
				throw new BusinessException(PreschoolErrorCode.SERVICE_UNAVAILABLE);
			}
			questions.add(new RecommendationResponse.Question(question.text(), image.get()));
		}
		return new RecommendationResponse(request.placeName(), List.copyOf(questions));
	}

	private void validate(GeneratedQuestions result, int count) {
		if (result == null || !result.canGenerate() || result.questions() == null || result.questions().size() != count
			|| result.questions().stream().anyMatch(question -> question == null || question.text() == null
				|| question.text().isBlank() || question.iconKeywords() == null || question.iconKeywords().isEmpty()
				|| question.iconKeywords().size() > 3 || question.iconKeywords().stream()
					.anyMatch(keyword -> keyword == null || keyword.isBlank()))) {
			throw new BusinessException(PreschoolErrorCode.SERVICE_UNAVAILABLE);
		}
	}
}
