package org.sopt.web3.school;

import static org.assertj.core.api.Assertions.*;

import org.flywaydb.core.Flyway;
import org.junit.jupiter.api.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.testcontainers.mysql.MySQLContainer;

class SchoolCapacityMigrationTest {

	@Test
	void 기존_문제와_풀이_기록을_유지하고_각_조합에_60문제를_추가한다() {
		try (MySQLContainer mysql = new MySQLContainer("mysql:8.4")) {
			mysql.start();
			Flyway.configure().dataSource(mysql.getJdbcUrl(), mysql.getUsername(), mysql.getPassword())
				.target("4").load().migrate();
			JdbcTemplate jdbc = new JdbcTemplate(
				new DriverManagerDataSource(mysql.getJdbcUrl(), mysql.getUsername(), mysql.getPassword()));
			jdbc.update("""
				INSERT INTO question (id, topic_id, target_age, content, correct_answer_text)
				VALUES (10000, 1, 8, '기존에 직접 등록한 문제', '기존 정답')
				""");
			jdbc.update("""
				INSERT INTO choice (id, question_id, choice_order, content, is_correct, feedback)
				VALUES (20000, 10000, 1, '기존 정답', TRUE, '기존 설명'),
				       (20001, 10000, 2, '기존 오답', FALSE, '기존 오답 설명')
				""");
			jdbc.update("""
				INSERT INTO activity (id, auth_id, topic_id, age, status, current_question_number, total_question_count)
				VALUES (9000, 1, 1, 8, 'IN_PROGRESS', 1, 3)
				""");
			jdbc.update("""
				INSERT INTO activity_question (id, activity_id, question_id, question_number)
				VALUES (9000, 9000, 10000, 1)
				""");
			jdbc.update("""
				INSERT INTO answer (id, activity_question_id, choice_id, is_correct)
				VALUES (9000, 9000, 20001, FALSE)
				""");
			var before = jdbc.queryForList("""
				SELECT topic_id, target_age, COUNT(*) AS count FROM question
				GROUP BY topic_id, target_age ORDER BY topic_id, target_age
				""");

			Flyway flyway = Flyway.configure()
				.dataSource(mysql.getJdbcUrl(), mysql.getUsername(), mysql.getPassword()).load();
			assertThat(flyway.migrate().migrationsExecuted).isEqualTo(1);
			assertThat(jdbc.queryForObject("SELECT COUNT(*) FROM question", Integer.class)).isEqualTo(590);
			assertThat(jdbc.queryForObject("SELECT COUNT(*) FROM choice", Integer.class)).isEqualTo(1180);
			for (var group : before) {
				int count = jdbc.queryForObject(
					"SELECT COUNT(*) FROM question WHERE topic_id = ? AND target_age = ?",
					Integer.class, group.get("topic_id"), group.get("target_age"));
				assertThat(count).isEqualTo(((Number)group.get("count")).intValue() + 60);
			}
			assertThat(jdbc.queryForObject(
				"SELECT content FROM question WHERE id = 10000", String.class)).isEqualTo("기존에 직접 등록한 문제");
			assertThat(jdbc.queryForObject(
				"SELECT feedback FROM choice WHERE id = 20001", String.class)).isEqualTo("기존 오답 설명");
			assertThat(jdbc.queryForObject(
				"SELECT COUNT(*) FROM activity WHERE id = 9000 AND auth_id = 1", Integer.class)).isEqualTo(1);
			assertThat(jdbc.queryForObject("""
				SELECT COUNT(*) FROM answer ans
				JOIN activity_question aq ON aq.id = ans.activity_question_id
				WHERE ans.id = 9000 AND aq.activity_id = 9000 AND aq.question_id = 10000
				  AND ans.choice_id = 20001 AND ans.is_correct = FALSE
				""", Integer.class)).isEqualTo(1);
			assertThat(jdbc.queryForList("""
				SELECT q.id FROM question q LEFT JOIN choice c ON c.question_id = q.id
				GROUP BY q.id HAVING COUNT(c.id) <> 2 OR SUM(c.is_correct) <> 1
				""")).isEmpty();
			assertThat(flyway.migrate().migrationsExecuted).isZero();
			assertThat(jdbc.queryForObject("SELECT COUNT(*) FROM question", Integer.class)).isEqualTo(590);
		}
	}
}
