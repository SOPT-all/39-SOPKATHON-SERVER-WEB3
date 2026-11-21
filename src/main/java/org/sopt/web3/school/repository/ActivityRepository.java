package org.sopt.web3.school.repository;

import java.util.Optional;

import org.sopt.web3.school.domain.Activity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Lock;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import jakarta.persistence.LockModeType;

public interface ActivityRepository extends JpaRepository<Activity, Long> {

	Optional<Activity> findByIdAndAuthId(Long id, Long authId);

	@Lock(LockModeType.PESSIMISTIC_WRITE)
	@Query("select activity from Activity activity where activity.id = :id and activity.authId = :authId")
	Optional<Activity> findOwnedByIdForUpdate(@Param("id") Long id, @Param("authId") Long authId);
}
