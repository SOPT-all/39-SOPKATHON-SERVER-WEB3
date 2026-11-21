package org.sopt.web3.school.repository;

import java.util.Optional;

import org.sopt.web3.school.domain.Choice;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ChoiceRepository extends JpaRepository<Choice, Long> {

	Optional<Choice> findByIdAndQuestionId(Long id, Long questionId);
}
