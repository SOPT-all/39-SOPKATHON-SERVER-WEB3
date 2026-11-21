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
@Table(name = "choice")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Choice {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "question_id", nullable = false)
	private Long questionId;

	@Column(name = "choice_order", nullable = false)
	private int choiceOrder;

	@Column(nullable = false, length = 500)
	private String content;

	@Column(name = "is_correct", nullable = false)
	private boolean correct;

	@Column(nullable = false, columnDefinition = "TEXT")
	private String feedback;

}
