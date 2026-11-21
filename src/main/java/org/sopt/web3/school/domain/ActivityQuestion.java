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
@Table(name = "activity_question")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class ActivityQuestion {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "activity_id", nullable = false)
	private Long activityId;

	@Column(name = "question_id", nullable = false)
	private Long questionId;

	@Column(name = "question_number", nullable = false)
	private int questionNumber;

}
