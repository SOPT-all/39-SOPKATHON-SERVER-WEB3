package org.sopt.web3.global.config;

import static org.hamcrest.Matchers.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import org.junit.jupiter.api.Test;
import org.sopt.web3.global.code.SuccessCode;
import org.sopt.web3.global.response.BaseResponse;
import org.sopt.web3.support.MySqlTestConfiguration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.boot.webmvc.test.autoconfigure.AutoConfigureMockMvc;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Import;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;

@SpringBootTest(properties = "server.forward-headers-strategy=framework")
@AutoConfigureMockMvc
@ActiveProfiles("test")
@Import({MySqlTestConfiguration.class, SwaggerConfigTest.TestConfig.class})
class SwaggerConfigTest {

	@Autowired
	private MockMvc mockMvc;

	@Test
	void 유아_추천_API_명세를_노출한다() throws Exception {
		String endpoint = "$.paths['/preschool/recommendations'].post";
		mockMvc.perform(get("/v3/api-docs"))
			.andExpect(status().isOk())
			.andExpect(jsonPath(endpoint + ".responses['200']").exists())
			.andExpect(jsonPath(endpoint + ".responses['422']").exists())
			.andExpect(jsonPath(endpoint + ".responses['503']").exists())
			.andExpect(jsonPath("$.components.schemas.RecommendationRequest.properties.age.type").value("integer"))
			.andExpect(jsonPath("$.components.schemas.RecommendationRequest.properties.placeName.type").value("string"))
			.andExpect(jsonPath("$.components.schemas.RecommendationRequest.properties.waitingMinutes.type").value("integer"))
			.andExpect(jsonPath("$.components.schemas.RecommendationResponse.properties.questions").exists());
	}

	@Test
	void OpenAPI_문서에_기본_정보가_포함된다() throws Exception {
		mockMvc.perform(get("/v3/api-docs"))
			.andExpect(status().isOk())
			.andExpect(jsonPath("$.info.title").value("Sopkathon API"))
			.andExpect(jsonPath("$.info.description").value("솝커톤 서버 API 명세"))
			.andExpect(jsonPath("$.info.version").value("v1"));
	}

	@Test
	void Swagger_UI와_문서_설정에_접근할_수_있다() throws Exception {
		mockMvc.perform(get("/swagger-ui/index.html"))
			.andExpect(status().isOk())
			.andExpect(content().string(containsString("Swagger UI")));
		mockMvc.perform(get("/v3/api-docs/swagger-config"))
			.andExpect(status().isOk())
			.andExpect(jsonPath("$.url").value("/v3/api-docs"))
			.andExpect(jsonPath("$.tagsSorter").value("alpha"));
	}

	@Test
	void 프록시_헤더의_HTTPS_주소로_서버_URL을_생성한다() throws Exception {
		mockMvc.perform(get("/v3/api-docs")
				.header("X-Forwarded-Proto", "https")
				.header("X-Forwarded-Host", "api.sopkathon.example"))
			.andExpect(status().isOk())
			.andExpect(jsonPath("$.servers[0].url").value("https://api.sopkathon.example"));
	}

	@Test
	void API_인터페이스의_문서와_공통_응답_스키마를_반영한다() throws Exception {
		mockMvc.perform(get("/v3/api-docs"))
			.andExpect(status().isOk())
			.andExpect(jsonPath("$.paths['/test/swagger'].get.summary").value("문서화 검증"))
			.andExpect(jsonPath("$.paths['/test/swagger'].get.responses['200']").exists())
			.andExpect(jsonPath("$.paths['/test/swagger'].get.responses['400'].description")
				.value("요청 값이 올바르지 않습니다."))
			.andExpect(jsonPath("$.paths['/test/swagger'].get.responses['500'].description")
				.value("서버 내부 오류입니다."))
			.andExpect(jsonPath("$.components.schemas.BaseResponse.properties.success.type").value("boolean"))
			.andExpect(jsonPath("$.components.schemas.BaseResponse.properties.code.type").value("string"))
			.andExpect(jsonPath("$.components.schemas.BaseResponse.properties.message.type").value("string"))
			.andExpect(jsonPath("$.components.schemas.BaseResponse.properties.data").exists());
	}

	@TestConfiguration
	static class TestConfig {

		@Bean
		TestController testController() {
			return new TestController();
		}
	}

	@Tag(name = "Test", description = "테스트 전용 API")
	interface TestApi {

		@Operation(summary = "문서화 검증")
		@ApiResponses({
			@ApiResponse(responseCode = "200", description = "문서 조회 성공"),
			@ApiResponse(responseCode = "400", description = "요청 값이 올바르지 않습니다.",
				content = @Content(schema = @Schema(implementation = BaseResponse.class))),
			@ApiResponse(responseCode = "500", description = "서버 내부 오류입니다.",
				content = @Content(schema = @Schema(implementation = BaseResponse.class)))
		})
		@GetMapping("/test/swagger")
		ResponseEntity<BaseResponse<String>> getDocument();
	}

	@RestController
	static class TestController implements TestApi {

		@Override
		public ResponseEntity<BaseResponse<String>> getDocument() {
			return BaseResponse.success(TestSuccessCode.DOCUMENT_FETCHED, "ok");
		}
	}

	enum TestSuccessCode implements SuccessCode {

		DOCUMENT_FETCHED;

		@Override
		public HttpStatus getHttpStatus() {
			return HttpStatus.OK;
		}

		@Override
		public String getMessage() {
			return "문서 조회 성공";
		}
	}
}
