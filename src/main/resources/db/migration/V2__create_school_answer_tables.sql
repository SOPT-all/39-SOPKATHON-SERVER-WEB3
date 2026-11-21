CREATE TABLE auth (
    id BIGINT NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO auth (id) VALUES (1);

CREATE TABLE question (
    id BIGINT NOT NULL AUTO_INCREMENT,
    topic_id BIGINT,
    content TEXT NOT NULL,
    correct_answer_text TEXT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_question_topic FOREIGN KEY (topic_id) REFERENCES topic (id)
);

CREATE TABLE choice (
    id BIGINT NOT NULL AUTO_INCREMENT,
    question_id BIGINT NOT NULL,
    choice_order INT NOT NULL,
    content VARCHAR(500) NOT NULL,
    is_correct BOOLEAN NOT NULL,
    feedback TEXT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_choice_question FOREIGN KEY (question_id) REFERENCES question (id)
);

CREATE TABLE activity (
    id BIGINT NOT NULL AUTO_INCREMENT,
    auth_id BIGINT NOT NULL,
    topic_id BIGINT,
    age INT NOT NULL,
    waiting_minutes INT,
    status VARCHAR(20) NOT NULL,
    current_question_number INT NOT NULL,
    total_question_count INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_activity_auth FOREIGN KEY (auth_id) REFERENCES auth (id),
    CONSTRAINT fk_activity_topic FOREIGN KEY (topic_id) REFERENCES topic (id)
);

CREATE TABLE activity_question (
    id BIGINT NOT NULL AUTO_INCREMENT,
    activity_id BIGINT NOT NULL,
    question_id BIGINT NOT NULL,
    question_number INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_activity_question_activity FOREIGN KEY (activity_id) REFERENCES activity (id),
    CONSTRAINT fk_activity_question_question FOREIGN KEY (question_id) REFERENCES question (id)
);

CREATE TABLE answer (
    id BIGINT NOT NULL AUTO_INCREMENT,
    activity_question_id BIGINT NOT NULL,
    choice_id BIGINT NOT NULL,
    is_correct BOOLEAN NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_answer_activity_question FOREIGN KEY (activity_question_id) REFERENCES activity_question (id),
    CONSTRAINT fk_answer_choice FOREIGN KEY (choice_id) REFERENCES choice (id)
);
