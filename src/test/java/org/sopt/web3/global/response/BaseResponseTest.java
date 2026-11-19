package org.sopt.web3.global.response;

import static org.assertj.core.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.sopt.web3.global.code.GlobalErrorCode;
import org.sopt.web3.global.code.SuccessCode;
import org.springframework.http.HttpStatus;

class BaseResponseTest {

	@Test
	void 성공_상태와_응답_코드가_일치하고_데이터를_유지한다() {
		SuccessCode code = new SuccessCode() {
			public HttpStatus getHttpStatus() {
				return HttpStatus.CREATED;
			}

			public String getMessage() {
				return "리소스 생성 성공";
			}
		};
		var response = BaseResponse.success(code, "created");
		assertThat(response.getStatusCode()).isEqualTo(HttpStatus.CREATED);
		assertThat(response.getBody()).isEqualTo(new BaseResponse<>(true, "201", "리소스 생성 성공", "created"));
		assertThat(BaseResponse.success(code).getBody().data()).isNull();
	}

	@Test
	void 실패_응답은_정의된_상태와_메시지를_반환한다() {
		var response = BaseResponse.fail(GlobalErrorCode.NOT_FOUND);
		assertThat(response.getStatusCode()).isEqualTo(HttpStatus.NOT_FOUND);
		assertThat(response.getBody()).isEqualTo(
			new BaseResponse<>(false, "404", "요청한 리소스가 존재하지 않습니다.", null));
	}
}
