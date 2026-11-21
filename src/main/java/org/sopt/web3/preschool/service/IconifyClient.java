package org.sopt.web3.preschool.service;

import java.time.Duration;
import java.util.List;
import java.util.Optional;

import org.sopt.web3.global.exception.BusinessException;
import org.sopt.web3.preschool.code.PreschoolErrorCode;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClient;

@Component
public class IconifyClient {
	private static final String ICON_PREFIX = "tabler:";
	private final RestClient client;

	@Autowired
	public IconifyClient(RestClient.Builder builder) {
		SimpleClientHttpRequestFactory factory = new SimpleClientHttpRequestFactory();
		factory.setConnectTimeout(Duration.ofSeconds(3));
		factory.setReadTimeout(Duration.ofSeconds(5));
		this.client = builder.baseUrl("https://api.iconify.design").requestFactory(factory).build();
	}

	public IconifyClient(RestClient client) {
		this.client = client;
	}

	public Optional<String> findImage(List<String> keywords) {
		for (String keyword : keywords) {
			if (keyword == null || !keyword.matches("[a-z0-9]+(?:-[a-z0-9]+)*") || keyword.length() > 60) {
				continue;
			}
			SearchResponse response;
			try {
				response = client.get().uri(builder -> builder.path("/search")
					.queryParam("query", keyword).queryParam("prefix", "tabler").build())
					.retrieve().body(SearchResponse.class);
			} catch (Exception exception) {
				throw new BusinessException(PreschoolErrorCode.SERVICE_UNAVAILABLE, exception);
			}
			if (response == null || response.icons() == null) {
				throw new BusinessException(PreschoolErrorCode.SERVICE_UNAVAILABLE);
			}
			List<String> candidates = response.icons().stream()
				.filter(name -> name != null && name.matches("tabler:[a-z0-9]+(?:-[a-z0-9]+)*"))
				.toList();
			Optional<String> selected = candidates.stream().filter(name -> name.equals(ICON_PREFIX + keyword))
				.findFirst().or(() -> candidates.stream().findFirst());
			if (selected.isPresent()) {
				return Optional.of("https://api.iconify.design/tabler/" + selected.get().substring(ICON_PREFIX.length())
					+ ".svg?color=%23A1CEFE");
			}
		}
		return Optional.empty();
	}

	public record SearchResponse(List<String> icons) {
	}
}
