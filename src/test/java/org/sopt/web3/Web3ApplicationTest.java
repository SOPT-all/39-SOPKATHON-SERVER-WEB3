package org.sopt.web3;

import static org.assertj.core.api.Assertions.*;

import org.flywaydb.core.Flyway;
import org.junit.jupiter.api.Test;
import org.sopt.web3.support.MySqlTestConfiguration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Import;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest
@Import(MySqlTestConfiguration.class)
@ActiveProfiles("test")
class Web3ApplicationTest {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private Flyway flyway;

	@Test
	void MySQL_연결과_Flyway_마이그레이션이_정상_동작한다() {
		assertThat(jdbcTemplate.queryForObject("SELECT VERSION()", String.class)).startsWith("8.4.");
		assertThat(jdbcTemplate.queryForObject(
			"SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = DATABASE() AND table_name = ?",
			Integer.class, "migration_probe")).isEqualTo(1);
		assertThat(flyway.validateWithResult().validationSuccessful).isTrue();
	}

	@Test
	@Transactional
	void 마이그레이션으로_생성한_테이블에_데이터를_저장하고_조회한다() {
		jdbcTemplate.update("INSERT INTO migration_probe (id, marker) VALUES (?, ?)", 1L, "connected");
		assertThat(jdbcTemplate.queryForObject("SELECT marker FROM migration_probe WHERE id = ?", String.class, 1L))
			.isEqualTo("connected");
	}

	@Test
	void 이미_적용한_마이그레이션은_다시_실행하지_않는다() {
		assertThat(flyway.migrate().migrationsExecuted).isZero();
	}
}
