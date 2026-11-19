package org.sopt.web3.health.controller;

import org.sopt.web3.global.response.BaseResponse;
import org.sopt.web3.health.code.HealthSuccessCode;
import org.sopt.web3.health.dto.response.HealthResponse;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HealthController {

	@GetMapping("/health")
	public ResponseEntity<BaseResponse<HealthResponse>> getHealth() {
		return BaseResponse.success(HealthSuccessCode.HEALTH_FETCHED, new HealthResponse("UP"));
	}
}
