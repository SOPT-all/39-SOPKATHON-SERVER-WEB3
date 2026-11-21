DELETE FROM answer;
DELETE FROM activity_question;
DELETE FROM activity;
DELETE FROM choice;
DELETE FROM question;
DELETE FROM auth WHERE id <> 1;

INSERT INTO auth (id) VALUES (2);
INSERT INTO question (id, topic_id, content, correct_answer_text) VALUES
    (501, 1, '친구가 공을 ___.', '친구가 공을 던져요.'),
    (502, 1, '비가 오면 우산을 ___.', '비가 오면 우산을 써요.'),
    (503, 1, '친구와 책을 ___.', '친구와 책을 읽어요.'),
    (504, 1, '다음 회차 문제', '다음 회차 정답');
INSERT INTO choice (id, question_id, choice_order, content, is_correct, feedback) VALUES
    (1001, 501, 1, '던져요', TRUE, '공은 던질 수 있어요.'),
    (1002, 501, 2, '마셔요', FALSE, '물은 마시고, 공은 던져요.'),
    (1003, 502, 1, '써요', TRUE, '비가 올 때는 우산을 써요.'),
    (1004, 502, 2, '먹어요', FALSE, '우산은 비를 막는 물건이에요.'),
    (1005, 503, 1, '읽어요', TRUE, '책은 읽어요.'),
    (1006, 503, 2, '마셔요', FALSE, '책은 마실 수 없어요.');
INSERT INTO activity
    (id, auth_id, topic_id, age, status, current_question_number, total_question_count) VALUES
    (101, 1, 1, 9, 'IN_PROGRESS', 1, 3),
    (102, 1, 1, 9, 'IN_PROGRESS', 1, 3),
    (201, 2, 1, 9, 'IN_PROGRESS', 1, 3);
INSERT INTO activity_question (id, activity_id, question_id, question_number) VALUES
    (2001, 101, 501, 1), (2002, 101, 502, 2), (2003, 101, 503, 3),
    (2004, 102, 501, 1), (2005, 201, 501, 1);
