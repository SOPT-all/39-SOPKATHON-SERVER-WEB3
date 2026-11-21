package org.sopt.web3.school.service;

import org.sopt.web3.global.code.GlobalErrorCode;
import org.sopt.web3.global.exception.BusinessException;
import org.sopt.web3.school.domain.ActivityQuestion;
import org.sopt.web3.school.domain.Answer;
import org.sopt.web3.school.domain.Choice;
import org.sopt.web3.school.domain.Question;
import org.sopt.web3.school.dto.AnswerSubmitRequest;
import org.sopt.web3.school.dto.AnswerSubmitResponse;
import org.sopt.web3.school.repository.ActivityQuestionRepository;
import org.sopt.web3.school.repository.ActivityRepository;
import org.sopt.web3.school.repository.AnswerRepository;
import org.sopt.web3.school.repository.ChoiceRepository;
import org.sopt.web3.school.repository.QuestionRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SchoolAnswerService {

	private static final long FIXED_AUTH_ID = 1L;

	private final ActivityRepository activityRepository;
	private final ActivityQuestionRepository activityQuestionRepository;
	private final QuestionRepository questionRepository;
	private final ChoiceRepository choiceRepository;
	private final AnswerRepository answerRepository;

	@Transactional
	public AnswerSubmitResponse submitAnswer(Long roundId, AnswerSubmitRequest request) {
		// 회차 행의 잠금을 먼저 획득해 중복 확인과 저장을 하나의 트랜잭션으로 직렬화한다.
		activityRepository.findOwnedByIdForUpdate(roundId, FIXED_AUTH_ID)
			.orElseThrow(() -> new BusinessException(GlobalErrorCode.NOT_FOUND));
		ActivityQuestion activityQuestion = activityQuestionRepository
			.findByActivityIdAndQuestionId(roundId, request.questionId())
			.orElseThrow(() -> new BusinessException(GlobalErrorCode.INVALID_INPUT_VALUE));
		Choice requestedChoice = choiceRepository.findByIdAndQuestionId(request.choiceId(), request.questionId())
			.orElseThrow(() -> new BusinessException(GlobalErrorCode.INVALID_INPUT_VALUE));
		Question question = questionRepository.findById(activityQuestion.getQuestionId())
			.orElseThrow(() -> new BusinessException(GlobalErrorCode.INTERNAL_SERVER_ERROR));

		Answer savedAnswer = answerRepository.findByActivityQuestionId(activityQuestion.getId())
			.orElseGet(() -> answerRepository.save(
				new Answer(activityQuestion.getId(), requestedChoice.getId(), requestedChoice.isCorrect())));
		Choice savedChoice = savedAnswer.getChoiceId().equals(requestedChoice.getId()) ? requestedChoice
			: choiceRepository.findByIdAndQuestionId(savedAnswer.getChoiceId(), question.getId())
				.orElseThrow(() -> new BusinessException(GlobalErrorCode.INTERNAL_SERVER_ERROR));

		return new AnswerSubmitResponse(savedAnswer.isCorrect(),
			new AnswerSubmitResponse.SelectedChoice(savedChoice.getId(), savedChoice.getContent()),
			question.getCorrectAnswerText(), savedChoice.getFeedback());
	}
}
