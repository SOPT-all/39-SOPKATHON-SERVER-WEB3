package org.sopt.web3.school.service;

import java.util.List;

import org.sopt.web3.global.exception.BusinessException;
import org.sopt.web3.school.code.SchoolGameErrorCode;
import org.sopt.web3.school.dto.StartRoundResponse;
import org.sopt.web3.school.dto.StartRoundResponse.Choice;
import org.sopt.web3.school.dto.StartRoundResponse.Question;
import org.sopt.web3.school.repository.SchoolRoundRepository;
import org.sopt.web3.school.repository.SchoolRoundRepository.QuestionRow;
import org.sopt.web3.school.repository.TopicRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SchoolRoundService {

	private static final long USER_ID = 1L;
	private static final int QUESTION_COUNT = 3;
	private static final int CHOICE_COUNT = 2;

	private final TopicRepository topicRepository;
	private final SchoolRoundRepository roundRepository;

	@Transactional
	public StartRoundResponse start(long gameId, int age) {
		if (!topicRepository.existsById(gameId)) {
			throw new BusinessException(SchoolGameErrorCode.GAME_NOT_FOUND);
		}

		List<QuestionRow> candidates = roundRepository.findUnansweredQuestions(gameId, age, USER_ID, QUESTION_COUNT);
		if (candidates.size() < QUESTION_COUNT) {
			throw new BusinessException(SchoolGameErrorCode.INSUFFICIENT_QUESTIONS);
		}

		List<Question> questions = candidates.stream().map(this::toQuestion).toList();
		long roundId = roundRepository.createRound(USER_ID, gameId, age, questions.size());
		for (int index = 0; index < questions.size(); index++) {
			roundRepository.assignQuestion(roundId, questions.get(index).questionId(), index + 1);
		}
		return new StartRoundResponse(roundId, questions);
	}

	private Question toQuestion(QuestionRow question) {
		List<Choice> choices = roundRepository.findChoices(question.id());
		if (choices.size() != CHOICE_COUNT) {
			throw new IllegalStateException("문제의 선택지 수가 올바르지 않습니다. questionId=" + question.id());
		}
		return new Question(question.id(), question.content(), choices);
	}
}
