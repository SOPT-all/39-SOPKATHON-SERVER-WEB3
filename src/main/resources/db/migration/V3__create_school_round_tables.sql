ALTER TABLE question
    ADD COLUMN target_age INT NULL,
    ADD INDEX idx_question_topic_age (topic_id, target_age, id);
