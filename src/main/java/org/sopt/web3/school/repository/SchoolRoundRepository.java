package org.sopt.web3.school.repository;

import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.List;
import java.util.Objects;

import org.sopt.web3.school.dto.StartRoundResponse.Choice;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class SchoolRoundRepository {

	private final JdbcTemplate jdbcTemplate;

	public List<QuestionRow> findUnansweredQuestions(long gameId, int age, long userId, int choiceCount, int limit) {
		return jdbcTemplate.query("""
			SELECT q.id, q.content
			FROM question q
			WHERE q.topic_id = ? AND q.target_age = ?
			  AND (SELECT COUNT(*) FROM choice c WHERE c.question_id = q.id) = ?
			  AND NOT EXISTS (
			    SELECT 1
			    FROM activity_question aq
			    JOIN activity a ON a.id = aq.activity_id
			    JOIN answer ans ON ans.activity_question_id = aq.id
			    WHERE aq.question_id = q.id AND a.auth_id = ?
			  )
			ORDER BY q.id
			LIMIT ?
			""", (rs, rowNum) -> new QuestionRow(rs.getLong("id"), rs.getString("content")),
			gameId, age, choiceCount, userId, limit);
	}

	public List<Choice> findChoices(long questionId) {
		return jdbcTemplate.query("""
			SELECT id, content FROM choice
			WHERE question_id = ?
			ORDER BY choice_order, id
			""", (rs, rowNum) -> new Choice(rs.getLong("id"), rs.getString("content")), questionId);
	}

	public long createRound(long userId, long gameId, int age, int questionCount) {
		KeyHolder keys = new GeneratedKeyHolder();
		jdbcTemplate.update(connection -> {
			PreparedStatement statement = connection.prepareStatement("""
				INSERT INTO activity (auth_id, topic_id, age, status, current_question_number, total_question_count)
				VALUES (?, ?, ?, 'IN_PROGRESS', 1, ?)
				""", Statement.RETURN_GENERATED_KEYS);
			statement.setLong(1, userId);
			statement.setLong(2, gameId);
			statement.setInt(3, age);
			statement.setInt(4, questionCount);
			return statement;
		}, keys);
		return Objects.requireNonNull(keys.getKey()).longValue();
	}

	public void assignQuestion(long roundId, long questionId, int questionNumber) {
		jdbcTemplate.update("""
			INSERT INTO activity_question (activity_id, question_id, question_number) VALUES (?, ?, ?)
			""", roundId, questionId, questionNumber);
	}

	public record QuestionRow(long id, String content) {
	}
}
