package org.sopt.web3.school.repository;

import org.sopt.web3.school.domain.Question;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QuestionRepository extends JpaRepository<Question, Long> {
}
