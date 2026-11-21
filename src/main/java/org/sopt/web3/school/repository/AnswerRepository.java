package org.sopt.web3.school.repository;

import java.util.Optional;

import org.sopt.web3.school.domain.Answer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AnswerRepository extends JpaRepository<Answer, Long> {

	Optional<Answer> findByActivityQuestionId(Long activityQuestionId);
}
