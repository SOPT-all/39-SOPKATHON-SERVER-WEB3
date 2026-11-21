package org.sopt.web3.school.repository;

import java.util.List;

import org.sopt.web3.school.domain.Topic;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TopicRepository extends JpaRepository<Topic, Long> {

	List<Topic> findAllByOrderByIdAsc();
}
