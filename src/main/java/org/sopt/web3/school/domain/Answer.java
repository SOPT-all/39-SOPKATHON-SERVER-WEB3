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
@Table(name = "answer")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Answer {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "activity_question_id", nullable = false)
	private Long activityQuestionId;

	@Column(name = "choice_id", nullable = false)
	private Long choiceId;

	@Column(name = "is_correct", nullable = false)
	private boolean correct;


	public Answer(Long activityQuestionId, Long choiceId, boolean correct) {
		this.activityQuestionId = activityQuestionId;
		this.choiceId = choiceId;
		this.correct = correct;
	}
}
