CREATE TABLE topic (
    id BIGINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(500),
    rules VARCHAR(500) NOT NULL,
    example VARCHAR(500) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO topic (id, name, rules, example)
VALUES
    (1, '문장 완성하기', '빈칸에 어울리는 표현을 골라요.', '짝꿍과 책을 읽어요.'),
    (2, '반대말 탐정', '뜻이 반대인 낱말을 찾아요.', '길다 ↔ 짧다'),
    (3, '이럴 땐 뭐라고?', '학교에서 이럴 때 어떤 말을 할지 골라요.', '친구가 도와줬어요. “고마워!”');
