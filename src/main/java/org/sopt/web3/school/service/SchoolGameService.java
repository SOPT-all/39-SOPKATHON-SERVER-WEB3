package org.sopt.web3.school.service;

import java.util.List;

import org.sopt.web3.school.dto.GameListResponse;
import org.sopt.web3.school.repository.TopicRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SchoolGameService {

	private final TopicRepository topicRepository;

	@Transactional(readOnly = true)
	public GameListResponse getGames() {
		List<GameListResponse.Game> games = topicRepository.findAllByOrderByIdAsc().stream()
			.map(topic -> new GameListResponse.Game(topic.getId(), topic.getName(), topic.getRules(), topic.getExample()))
			.toList();
		return new GameListResponse(games);
	}
}
