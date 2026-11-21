package org.sopt.web3.school.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "activity")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Activity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "auth_id", nullable = false)
	private Long authId;

	@Column(name = "topic_id")
	private Long topicId;

	@Column(nullable = false)
	private int age;

	@Column(name = "waiting_minutes")
	private Integer waitingMinutes;

	@Column(nullable = false, length = 20)
	private String status;

	@Column(name = "current_question_number", nullable = false)
	private int currentQuestionNumber;

	@Column(name = "total_question_count", nullable = false)
	private int totalQuestionCount;

}
