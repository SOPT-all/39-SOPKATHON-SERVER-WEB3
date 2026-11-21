package org.sopt.web3.school.repository;

import java.util.Optional;

import org.sopt.web3.school.domain.ActivityQuestion;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ActivityQuestionRepository extends JpaRepository<ActivityQuestion, Long> {

	Optional<ActivityQuestion> findByActivityIdAndQuestionId(Long activityId, Long questionId);
}
