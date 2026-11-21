package org.sopt.web3.school.service;

import java.util.List;

import org.sopt.web3.global.code.GlobalErrorCode;
import org.sopt.web3.global.exception.BusinessException;
import org.sopt.web3.school.code.SchoolGameErrorCode;
import org.sopt.web3.school.domain.Activity;
import org.sopt.web3.school.dto.RoundResultResponse;
import org.sopt.web3.school.dto.RoundResultResponse.Review;
import org.sopt.web3.school.dto.RoundResultResponse.SelectedChoice;
import org.sopt.web3.school.repository.ActivityRepository;
import org.sopt.web3.school.repository.SchoolRoundRepository;
import org.sopt.web3.school.repository.SchoolRoundRepository.ReviewRow;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SchoolRoundResultService {

	private static final long USER_ID = 1L;

	private final ActivityRepository activityRepository;
	private final SchoolRoundRepository roundRepository;

	@Transactional(readOnly = true)
	public RoundResultResponse getResult(long roundId) {
		Activity activity = activityRepository.findByIdAndAuthId(roundId, USER_ID)
			.orElseThrow(() -> new BusinessException(GlobalErrorCode.NOT_FOUND));
		List<ReviewRow> answers = roundRepository.findReviews(roundId);
		if (answers.size() != activity.getTotalQuestionCount()) {
			throw new BusinessException(SchoolGameErrorCode.ROUND_NOT_COMPLETED);
		}

		List<Review> reviews = answers.stream().map(this::toReview).toList();
		int correctCount = (int)reviews.stream().filter(Review::correct).count();
		return new RoundResultResponse(reviews.size(), correctCount, reviews);
	}

	private Review toReview(ReviewRow answer) {
		if (answer.correct()) {
			return new Review(answer.questionId(), true, answer.correctAnswer(), null, null);
		}
		return new Review(answer.questionId(), false, answer.correctAnswer(),
			new SelectedChoice(answer.choiceId(), answer.choiceText()), answer.feedback());
	}
}
