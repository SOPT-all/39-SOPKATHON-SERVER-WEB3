# 아키텍처

## 기술 스택

- Java 21, Spring Boot 4.1.2, Gradle Wrapper
- Spring MVC, Bean Validation, Spring Data JPA, MySQL 8.4, Flyway
- springdoc-openapi, Swagger UI, JUnit, MockMvc, Testcontainers
- Docker Compose, AWS EC2, Nginx, Certbot, GitHub Actions, Docker Hub

## 애플리케이션

도메인별 패키지에서 Controller → Service → Repository 흐름을 사용한다. 공통 응답과 예외 처리 코드는 `org.sopt.web3.global`에 위치한다. API 응답 규칙은 [API 계약](api-contract.md)을 따른다.

## 배포와 DB

운영 구성은 EC2에서 Nginx, Spring Boot, MySQL, Certbot을 Docker Compose로 실행한다. 배포 구조는 [아키텍처 그림](images/architecture.svg)을 참고한다.

Flyway가 스키마를 관리하고 JPA는 `ddl-auto: validate`로 매핑을 검증한다. 스키마 변경 및 실행·배포 절차는 [README](../README.md)를 따른다. CI/CD와 DB 구성에 관한 결정 기록은 [ADR](adr/)을 참고한다.
