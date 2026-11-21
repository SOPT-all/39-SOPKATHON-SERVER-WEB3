-- 놀이 3종과 나이 8~10세의 각 조합에 60문제씩 추가한다.
-- 8~10세가 함께 풀 수 있는 놀이별 60개 콘텐츠를 각 나이의 독립된 출제 목록에 등록한다.
-- 기존 문제, 회차, 답변은 변경하지 않고 AUTO_INCREMENT로 새 ID를 할당한다.
START TRANSACTION;

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '손을 씻고 수건으로 물기를 ( ).', '손을 씻고 수건으로 물기를 닦아요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '닦아요', TRUE, '수건은 젖은 곳의 물기를 닦는 데 써요.'),
    (@school_capacity_question_id, 2, '먹어요', FALSE, '다시 생각해 볼까요? 수건은 젖은 곳의 물기를 닦는 데 써요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '손을 씻고 수건으로 물기를 ( ).', '손을 씻고 수건으로 물기를 닦아요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '먹어요', FALSE, '다시 생각해 볼까요? 수건은 젖은 곳의 물기를 닦는 데 써요.'),
    (@school_capacity_question_id, 2, '닦아요', TRUE, '수건은 젖은 곳의 물기를 닦는 데 써요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '손을 씻고 수건으로 물기를 ( ).', '손을 씻고 수건으로 물기를 닦아요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '닦아요', TRUE, '수건은 젖은 곳의 물기를 닦는 데 써요.'),
    (@school_capacity_question_id, 2, '먹어요', FALSE, '다시 생각해 볼까요? 수건은 젖은 곳의 물기를 닦는 데 써요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '신발을 벗어 신발장에 가지런히 ( ).', '신발을 벗어 신발장에 가지런히 놓아요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '마셔요', FALSE, '다시 생각해 볼까요? 신발장에는 신발을 놓아 정리해요.'),
    (@school_capacity_question_id, 2, '놓아요', TRUE, '신발장에는 신발을 놓아 정리해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '신발을 벗어 신발장에 가지런히 ( ).', '신발을 벗어 신발장에 가지런히 놓아요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '놓아요', TRUE, '신발장에는 신발을 놓아 정리해요.'),
    (@school_capacity_question_id, 2, '마셔요', FALSE, '다시 생각해 볼까요? 신발장에는 신발을 놓아 정리해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '신발을 벗어 신발장에 가지런히 ( ).', '신발을 벗어 신발장에 가지런히 놓아요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '마셔요', FALSE, '다시 생각해 볼까요? 신발장에는 신발을 놓아 정리해요.'),
    (@school_capacity_question_id, 2, '놓아요', TRUE, '신발장에는 신발을 놓아 정리해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '책의 다음 내용이 궁금해서 책장을 ( ).', '책의 다음 내용이 궁금해서 책장을 넘겨요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '넘겨요', TRUE, '다음 쪽을 읽으려면 책장을 넘겨요.'),
    (@school_capacity_question_id, 2, '씹어요', FALSE, '다시 생각해 볼까요? 다음 쪽을 읽으려면 책장을 넘겨요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '책의 다음 내용이 궁금해서 책장을 ( ).', '책의 다음 내용이 궁금해서 책장을 넘겨요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '씹어요', FALSE, '다시 생각해 볼까요? 다음 쪽을 읽으려면 책장을 넘겨요.'),
    (@school_capacity_question_id, 2, '넘겨요', TRUE, '다음 쪽을 읽으려면 책장을 넘겨요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '책의 다음 내용이 궁금해서 책장을 ( ).', '책의 다음 내용이 궁금해서 책장을 넘겨요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '넘겨요', TRUE, '다음 쪽을 읽으려면 책장을 넘겨요.'),
    (@school_capacity_question_id, 2, '씹어요', FALSE, '다시 생각해 볼까요? 다음 쪽을 읽으려면 책장을 넘겨요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '틀린 글자를 지우개로 ( ).', '틀린 글자를 지우개로 지워요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '신어요', FALSE, '다시 생각해 볼까요? 지우개는 연필로 쓴 글자를 지우는 도구예요.'),
    (@school_capacity_question_id, 2, '지워요', TRUE, '지우개는 연필로 쓴 글자를 지우는 도구예요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '틀린 글자를 지우개로 ( ).', '틀린 글자를 지우개로 지워요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '지워요', TRUE, '지우개는 연필로 쓴 글자를 지우는 도구예요.'),
    (@school_capacity_question_id, 2, '신어요', FALSE, '다시 생각해 볼까요? 지우개는 연필로 쓴 글자를 지우는 도구예요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '틀린 글자를 지우개로 ( ).', '틀린 글자를 지우개로 지워요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '신어요', FALSE, '다시 생각해 볼까요? 지우개는 연필로 쓴 글자를 지우는 도구예요.'),
    (@school_capacity_question_id, 2, '지워요', TRUE, '지우개는 연필로 쓴 글자를 지우는 도구예요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '그림에 색연필로 색을 ( ).', '그림에 색연필로 색을 칠해요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '칠해요', TRUE, '색연필로 그림에 색을 칠할 수 있어요.'),
    (@school_capacity_question_id, 2, '들어요', FALSE, '다시 생각해 볼까요? 색연필로 그림에 색을 칠할 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '그림에 색연필로 색을 ( ).', '그림에 색연필로 색을 칠해요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '들어요', FALSE, '다시 생각해 볼까요? 색연필로 그림에 색을 칠할 수 있어요.'),
    (@school_capacity_question_id, 2, '칠해요', TRUE, '색연필로 그림에 색을 칠할 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '그림에 색연필로 색을 ( ).', '그림에 색연필로 색을 칠해요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '칠해요', TRUE, '색연필로 그림에 색을 칠할 수 있어요.'),
    (@school_capacity_question_id, 2, '들어요', FALSE, '다시 생각해 볼까요? 색연필로 그림에 색을 칠할 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '점심을 먹기 전에 손을 깨끗이 ( ).', '점심을 먹기 전에 손을 깨끗이 씻어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '접어요', FALSE, '다시 생각해 볼까요? 밥을 먹기 전에는 물과 비누로 손을 씻어요.'),
    (@school_capacity_question_id, 2, '씻어요', TRUE, '밥을 먹기 전에는 물과 비누로 손을 씻어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '점심을 먹기 전에 손을 깨끗이 ( ).', '점심을 먹기 전에 손을 깨끗이 씻어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '씻어요', TRUE, '밥을 먹기 전에는 물과 비누로 손을 씻어요.'),
    (@school_capacity_question_id, 2, '접어요', FALSE, '다시 생각해 볼까요? 밥을 먹기 전에는 물과 비누로 손을 씻어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '점심을 먹기 전에 손을 깨끗이 ( ).', '점심을 먹기 전에 손을 깨끗이 씻어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '접어요', FALSE, '다시 생각해 볼까요? 밥을 먹기 전에는 물과 비누로 손을 씻어요.'),
    (@school_capacity_question_id, 2, '씻어요', TRUE, '밥을 먹기 전에는 물과 비누로 손을 씻어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '길을 건너기 전에 신호등을 ( ).', '길을 건너기 전에 신호등을 확인해요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '확인해요', TRUE, '길을 건너기 전에는 신호와 주변을 확인해요.'),
    (@school_capacity_question_id, 2, '삼켜요', FALSE, '다시 생각해 볼까요? 길을 건너기 전에는 신호와 주변을 확인해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '길을 건너기 전에 신호등을 ( ).', '길을 건너기 전에 신호등을 확인해요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '삼켜요', FALSE, '다시 생각해 볼까요? 길을 건너기 전에는 신호와 주변을 확인해요.'),
    (@school_capacity_question_id, 2, '확인해요', TRUE, '길을 건너기 전에는 신호와 주변을 확인해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '길을 건너기 전에 신호등을 ( ).', '길을 건너기 전에 신호등을 확인해요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '확인해요', TRUE, '길을 건너기 전에는 신호와 주변을 확인해요.'),
    (@school_capacity_question_id, 2, '삼켜요', FALSE, '다시 생각해 볼까요? 길을 건너기 전에는 신호와 주변을 확인해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '횡단보도에서는 초록불에 길을 ( ).', '횡단보도에서는 초록불에 길을 건너요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '끓여요', FALSE, '다시 생각해 볼까요? 횡단보도에서는 초록불에 주변을 살피고 건너요.'),
    (@school_capacity_question_id, 2, '건너요', TRUE, '횡단보도에서는 초록불에 주변을 살피고 건너요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '횡단보도에서는 초록불에 길을 ( ).', '횡단보도에서는 초록불에 길을 건너요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '건너요', TRUE, '횡단보도에서는 초록불에 주변을 살피고 건너요.'),
    (@school_capacity_question_id, 2, '끓여요', FALSE, '다시 생각해 볼까요? 횡단보도에서는 초록불에 주변을 살피고 건너요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '횡단보도에서는 초록불에 길을 ( ).', '횡단보도에서는 초록불에 길을 건너요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '끓여요', FALSE, '다시 생각해 볼까요? 횡단보도에서는 초록불에 주변을 살피고 건너요.'),
    (@school_capacity_question_id, 2, '건너요', TRUE, '횡단보도에서는 초록불에 주변을 살피고 건너요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '친구의 이야기를 끝까지 ( ).', '친구의 이야기를 끝까지 들어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '들어요', TRUE, '이야기는 귀를 기울여 들어요.'),
    (@school_capacity_question_id, 2, '신어요', FALSE, '다시 생각해 볼까요? 이야기는 귀를 기울여 들어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '친구의 이야기를 끝까지 ( ).', '친구의 이야기를 끝까지 들어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '신어요', FALSE, '다시 생각해 볼까요? 이야기는 귀를 기울여 들어요.'),
    (@school_capacity_question_id, 2, '들어요', TRUE, '이야기는 귀를 기울여 들어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '친구의 이야기를 끝까지 ( ).', '친구의 이야기를 끝까지 들어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '들어요', TRUE, '이야기는 귀를 기울여 들어요.'),
    (@school_capacity_question_id, 2, '신어요', FALSE, '다시 생각해 볼까요? 이야기는 귀를 기울여 들어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '다 읽은 책을 책꽂이에 ( ).', '다 읽은 책을 책꽂이에 꽂아요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '마셔요', FALSE, '다시 생각해 볼까요? 책꽂이에는 책을 꽂아 정리해요.'),
    (@school_capacity_question_id, 2, '꽂아요', TRUE, '책꽂이에는 책을 꽂아 정리해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '다 읽은 책을 책꽂이에 ( ).', '다 읽은 책을 책꽂이에 꽂아요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '꽂아요', TRUE, '책꽂이에는 책을 꽂아 정리해요.'),
    (@school_capacity_question_id, 2, '마셔요', FALSE, '다시 생각해 볼까요? 책꽂이에는 책을 꽂아 정리해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '다 읽은 책을 책꽂이에 ( ).', '다 읽은 책을 책꽂이에 꽂아요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '마셔요', FALSE, '다시 생각해 볼까요? 책꽂이에는 책을 꽂아 정리해요.'),
    (@school_capacity_question_id, 2, '꽂아요', TRUE, '책꽂이에는 책을 꽂아 정리해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '사용한 휴지를 쓰레기통에 ( ).', '사용한 휴지를 쓰레기통에 버려요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '버려요', TRUE, '사용한 휴지는 알맞은 쓰레기통에 버려요.'),
    (@school_capacity_question_id, 2, '입어요', FALSE, '다시 생각해 볼까요? 사용한 휴지는 알맞은 쓰레기통에 버려요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '사용한 휴지를 쓰레기통에 ( ).', '사용한 휴지를 쓰레기통에 버려요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '입어요', FALSE, '다시 생각해 볼까요? 사용한 휴지는 알맞은 쓰레기통에 버려요.'),
    (@school_capacity_question_id, 2, '버려요', TRUE, '사용한 휴지는 알맞은 쓰레기통에 버려요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '사용한 휴지를 쓰레기통에 ( ).', '사용한 휴지를 쓰레기통에 버려요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '버려요', TRUE, '사용한 휴지는 알맞은 쓰레기통에 버려요.'),
    (@school_capacity_question_id, 2, '입어요', FALSE, '다시 생각해 볼까요? 사용한 휴지는 알맞은 쓰레기통에 버려요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '의자에 바른 자세로 ( ).', '의자에 바른 자세로 앉아요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '마셔요', FALSE, '다시 생각해 볼까요? 의자는 앉아서 사용하는 물건이에요.'),
    (@school_capacity_question_id, 2, '앉아요', TRUE, '의자는 앉아서 사용하는 물건이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '의자에 바른 자세로 ( ).', '의자에 바른 자세로 앉아요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '앉아요', TRUE, '의자는 앉아서 사용하는 물건이에요.'),
    (@school_capacity_question_id, 2, '마셔요', FALSE, '다시 생각해 볼까요? 의자는 앉아서 사용하는 물건이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '의자에 바른 자세로 ( ).', '의자에 바른 자세로 앉아요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '마셔요', FALSE, '다시 생각해 볼까요? 의자는 앉아서 사용하는 물건이에요.'),
    (@school_capacity_question_id, 2, '앉아요', TRUE, '의자는 앉아서 사용하는 물건이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '연필이 짧아져서 새 연필을 ( ).', '연필이 짧아져서 새 연필을 꺼내요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '꺼내요', TRUE, '필통에서 필요한 연필을 꺼내 사용할 수 있어요.'),
    (@school_capacity_question_id, 2, '삶아요', FALSE, '다시 생각해 볼까요? 필통에서 필요한 연필을 꺼내 사용할 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '연필이 짧아져서 새 연필을 ( ).', '연필이 짧아져서 새 연필을 꺼내요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '삶아요', FALSE, '다시 생각해 볼까요? 필통에서 필요한 연필을 꺼내 사용할 수 있어요.'),
    (@school_capacity_question_id, 2, '꺼내요', TRUE, '필통에서 필요한 연필을 꺼내 사용할 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '연필이 짧아져서 새 연필을 ( ).', '연필이 짧아져서 새 연필을 꺼내요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '꺼내요', TRUE, '필통에서 필요한 연필을 꺼내 사용할 수 있어요.'),
    (@school_capacity_question_id, 2, '삶아요', FALSE, '다시 생각해 볼까요? 필통에서 필요한 연필을 꺼내 사용할 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '교실 바닥의 먼지를 빗자루로 ( ).', '교실 바닥의 먼지를 빗자루로 쓸어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '마셔요', FALSE, '다시 생각해 볼까요? 빗자루로 바닥의 먼지를 쓸어요.'),
    (@school_capacity_question_id, 2, '쓸어요', TRUE, '빗자루로 바닥의 먼지를 쓸어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '교실 바닥의 먼지를 빗자루로 ( ).', '교실 바닥의 먼지를 빗자루로 쓸어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '쓸어요', TRUE, '빗자루로 바닥의 먼지를 쓸어요.'),
    (@school_capacity_question_id, 2, '마셔요', FALSE, '다시 생각해 볼까요? 빗자루로 바닥의 먼지를 쓸어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '교실 바닥의 먼지를 빗자루로 ( ).', '교실 바닥의 먼지를 빗자루로 쓸어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '마셔요', FALSE, '다시 생각해 볼까요? 빗자루로 바닥의 먼지를 쓸어요.'),
    (@school_capacity_question_id, 2, '쓸어요', TRUE, '빗자루로 바닥의 먼지를 쓸어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '화분의 흙이 말라서 물을 ( ).', '화분의 흙이 말라서 물을 줘요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '줘요', TRUE, '화분의 흙이 마르면 알맞은 양의 물을 줘요.'),
    (@school_capacity_question_id, 2, '읽어요', FALSE, '다시 생각해 볼까요? 화분의 흙이 마르면 알맞은 양의 물을 줘요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '화분의 흙이 말라서 물을 ( ).', '화분의 흙이 말라서 물을 줘요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '읽어요', FALSE, '다시 생각해 볼까요? 화분의 흙이 마르면 알맞은 양의 물을 줘요.'),
    (@school_capacity_question_id, 2, '줘요', TRUE, '화분의 흙이 마르면 알맞은 양의 물을 줘요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '화분의 흙이 말라서 물을 ( ).', '화분의 흙이 말라서 물을 줘요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '줘요', TRUE, '화분의 흙이 마르면 알맞은 양의 물을 줘요.'),
    (@school_capacity_question_id, 2, '읽어요', FALSE, '다시 생각해 볼까요? 화분의 흙이 마르면 알맞은 양의 물을 줘요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '종이에 그린 모양을 가위로 ( ).', '종이에 그린 모양을 가위로 오려요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '들어요', FALSE, '다시 생각해 볼까요? 가위는 종이를 원하는 모양으로 오릴 때 써요.'),
    (@school_capacity_question_id, 2, '오려요', TRUE, '가위는 종이를 원하는 모양으로 오릴 때 써요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '종이에 그린 모양을 가위로 ( ).', '종이에 그린 모양을 가위로 오려요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '오려요', TRUE, '가위는 종이를 원하는 모양으로 오릴 때 써요.'),
    (@school_capacity_question_id, 2, '들어요', FALSE, '다시 생각해 볼까요? 가위는 종이를 원하는 모양으로 오릴 때 써요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '종이에 그린 모양을 가위로 ( ).', '종이에 그린 모양을 가위로 오려요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '들어요', FALSE, '다시 생각해 볼까요? 가위는 종이를 원하는 모양으로 오릴 때 써요.'),
    (@school_capacity_question_id, 2, '오려요', TRUE, '가위는 종이를 원하는 모양으로 오릴 때 써요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '잘라 낸 종이를 풀로 ( ).', '잘라 낸 종이를 풀로 붙여요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '붙여요', TRUE, '풀은 종이와 종이를 붙일 때 사용하는 도구예요.'),
    (@school_capacity_question_id, 2, '마셔요', FALSE, '다시 생각해 볼까요? 풀은 종이와 종이를 붙일 때 사용하는 도구예요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '잘라 낸 종이를 풀로 ( ).', '잘라 낸 종이를 풀로 붙여요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '마셔요', FALSE, '다시 생각해 볼까요? 풀은 종이와 종이를 붙일 때 사용하는 도구예요.'),
    (@school_capacity_question_id, 2, '붙여요', TRUE, '풀은 종이와 종이를 붙일 때 사용하는 도구예요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '잘라 낸 종이를 풀로 ( ).', '잘라 낸 종이를 풀로 붙여요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '붙여요', TRUE, '풀은 종이와 종이를 붙일 때 사용하는 도구예요.'),
    (@school_capacity_question_id, 2, '마셔요', FALSE, '다시 생각해 볼까요? 풀은 종이와 종이를 붙일 때 사용하는 도구예요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '체육 시간에 공을 발로 ( ).', '체육 시간에 공을 발로 차요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '읽어요', FALSE, '다시 생각해 볼까요? 공을 발로 움직이는 행동을 공을 찬다고 해요.'),
    (@school_capacity_question_id, 2, '차요', TRUE, '공을 발로 움직이는 행동을 공을 찬다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '체육 시간에 공을 발로 ( ).', '체육 시간에 공을 발로 차요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '차요', TRUE, '공을 발로 움직이는 행동을 공을 찬다고 해요.'),
    (@school_capacity_question_id, 2, '읽어요', FALSE, '다시 생각해 볼까요? 공을 발로 움직이는 행동을 공을 찬다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '체육 시간에 공을 발로 ( ).', '체육 시간에 공을 발로 차요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '읽어요', FALSE, '다시 생각해 볼까요? 공을 발로 움직이는 행동을 공을 찬다고 해요.'),
    (@school_capacity_question_id, 2, '차요', TRUE, '공을 발로 움직이는 행동을 공을 찬다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '야구공을 장갑으로 ( ).', '야구공을 장갑으로 잡아요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '잡아요', TRUE, '야구 장갑으로 날아오는 공을 잡을 수 있어요.'),
    (@school_capacity_question_id, 2, '마셔요', FALSE, '다시 생각해 볼까요? 야구 장갑으로 날아오는 공을 잡을 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '야구공을 장갑으로 ( ).', '야구공을 장갑으로 잡아요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '마셔요', FALSE, '다시 생각해 볼까요? 야구 장갑으로 날아오는 공을 잡을 수 있어요.'),
    (@school_capacity_question_id, 2, '잡아요', TRUE, '야구 장갑으로 날아오는 공을 잡을 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '야구공을 장갑으로 ( ).', '야구공을 장갑으로 잡아요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '잡아요', TRUE, '야구 장갑으로 날아오는 공을 잡을 수 있어요.'),
    (@school_capacity_question_id, 2, '마셔요', FALSE, '다시 생각해 볼까요? 야구 장갑으로 날아오는 공을 잡을 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '피아노 건반을 눌러 노래를 ( ).', '피아노 건반을 눌러 노래를 연주해요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '접어요', FALSE, '다시 생각해 볼까요? 악기를 다루어 음악을 들려주는 것을 연주한다고 해요.'),
    (@school_capacity_question_id, 2, '연주해요', TRUE, '악기를 다루어 음악을 들려주는 것을 연주한다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '피아노 건반을 눌러 노래를 ( ).', '피아노 건반을 눌러 노래를 연주해요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '연주해요', TRUE, '악기를 다루어 음악을 들려주는 것을 연주한다고 해요.'),
    (@school_capacity_question_id, 2, '접어요', FALSE, '다시 생각해 볼까요? 악기를 다루어 음악을 들려주는 것을 연주한다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '피아노 건반을 눌러 노래를 ( ).', '피아노 건반을 눌러 노래를 연주해요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '접어요', FALSE, '다시 생각해 볼까요? 악기를 다루어 음악을 들려주는 것을 연주한다고 해요.'),
    (@school_capacity_question_id, 2, '연주해요', TRUE, '악기를 다루어 음악을 들려주는 것을 연주한다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '음악에 맞추어 손뼉을 ( ).', '음악에 맞추어 손뼉을 쳐요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '쳐요', TRUE, '두 손바닥을 마주치는 행동을 손뼉을 친다고 해요.'),
    (@school_capacity_question_id, 2, '읽어요', FALSE, '다시 생각해 볼까요? 두 손바닥을 마주치는 행동을 손뼉을 친다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '음악에 맞추어 손뼉을 ( ).', '음악에 맞추어 손뼉을 쳐요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '읽어요', FALSE, '다시 생각해 볼까요? 두 손바닥을 마주치는 행동을 손뼉을 친다고 해요.'),
    (@school_capacity_question_id, 2, '쳐요', TRUE, '두 손바닥을 마주치는 행동을 손뼉을 친다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '음악에 맞추어 손뼉을 ( ).', '음악에 맞추어 손뼉을 쳐요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '쳐요', TRUE, '두 손바닥을 마주치는 행동을 손뼉을 친다고 해요.'),
    (@school_capacity_question_id, 2, '읽어요', FALSE, '다시 생각해 볼까요? 두 손바닥을 마주치는 행동을 손뼉을 친다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '궁금한 것이 있어서 선생님께 ( ).', '궁금한 것이 있어서 선생님께 질문해요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '신어요', FALSE, '다시 생각해 볼까요? 모르는 것이 있을 때 질문해서 알아볼 수 있어요.'),
    (@school_capacity_question_id, 2, '질문해요', TRUE, '모르는 것이 있을 때 질문해서 알아볼 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '궁금한 것이 있어서 선생님께 ( ).', '궁금한 것이 있어서 선생님께 질문해요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '질문해요', TRUE, '모르는 것이 있을 때 질문해서 알아볼 수 있어요.'),
    (@school_capacity_question_id, 2, '신어요', FALSE, '다시 생각해 볼까요? 모르는 것이 있을 때 질문해서 알아볼 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '궁금한 것이 있어서 선생님께 ( ).', '궁금한 것이 있어서 선생님께 질문해요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '신어요', FALSE, '다시 생각해 볼까요? 모르는 것이 있을 때 질문해서 알아볼 수 있어요.'),
    (@school_capacity_question_id, 2, '질문해요', TRUE, '모르는 것이 있을 때 질문해서 알아볼 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '수업이 시작되기 전에 교과서를 ( ).', '수업이 시작되기 전에 교과서를 펴요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '펴요', TRUE, '읽을 내용을 볼 수 있도록 교과서를 펴요.'),
    (@school_capacity_question_id, 2, '마셔요', FALSE, '다시 생각해 볼까요? 읽을 내용을 볼 수 있도록 교과서를 펴요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '수업이 시작되기 전에 교과서를 ( ).', '수업이 시작되기 전에 교과서를 펴요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '마셔요', FALSE, '다시 생각해 볼까요? 읽을 내용을 볼 수 있도록 교과서를 펴요.'),
    (@school_capacity_question_id, 2, '펴요', TRUE, '읽을 내용을 볼 수 있도록 교과서를 펴요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '수업이 시작되기 전에 교과서를 ( ).', '수업이 시작되기 전에 교과서를 펴요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '펴요', TRUE, '읽을 내용을 볼 수 있도록 교과서를 펴요.'),
    (@school_capacity_question_id, 2, '마셔요', FALSE, '다시 생각해 볼까요? 읽을 내용을 볼 수 있도록 교과서를 펴요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '숙제를 마친 뒤 가방을 ( ).', '숙제를 마친 뒤 가방을 챙겨요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '끓여요', FALSE, '다시 생각해 볼까요? 필요한 물건을 가방에 넣어 챙겨요.'),
    (@school_capacity_question_id, 2, '챙겨요', TRUE, '필요한 물건을 가방에 넣어 챙겨요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '숙제를 마친 뒤 가방을 ( ).', '숙제를 마친 뒤 가방을 챙겨요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '챙겨요', TRUE, '필요한 물건을 가방에 넣어 챙겨요.'),
    (@school_capacity_question_id, 2, '끓여요', FALSE, '다시 생각해 볼까요? 필요한 물건을 가방에 넣어 챙겨요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '숙제를 마친 뒤 가방을 ( ).', '숙제를 마친 뒤 가방을 챙겨요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '끓여요', FALSE, '다시 생각해 볼까요? 필요한 물건을 가방에 넣어 챙겨요.'),
    (@school_capacity_question_id, 2, '챙겨요', TRUE, '필요한 물건을 가방에 넣어 챙겨요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '양말은 발에 ( ).', '양말은 발에 신어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '신어요', TRUE, '양말과 신발처럼 발에 사용하는 물건은 신는다고 해요.'),
    (@school_capacity_question_id, 2, '먹어요', FALSE, '다시 생각해 볼까요? 양말과 신발처럼 발에 사용하는 물건은 신는다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '양말은 발에 ( ).', '양말은 발에 신어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '먹어요', FALSE, '다시 생각해 볼까요? 양말과 신발처럼 발에 사용하는 물건은 신는다고 해요.'),
    (@school_capacity_question_id, 2, '신어요', TRUE, '양말과 신발처럼 발에 사용하는 물건은 신는다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '양말은 발에 ( ).', '양말은 발에 신어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '신어요', TRUE, '양말과 신발처럼 발에 사용하는 물건은 신는다고 해요.'),
    (@school_capacity_question_id, 2, '먹어요', FALSE, '다시 생각해 볼까요? 양말과 신발처럼 발에 사용하는 물건은 신는다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '목도리는 목에 ( ).', '목도리는 목에 둘러요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '읽어요', FALSE, '다시 생각해 볼까요? 목도리는 목 주변에 둘러 따뜻하게 해요.'),
    (@school_capacity_question_id, 2, '둘러요', TRUE, '목도리는 목 주변에 둘러 따뜻하게 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '목도리는 목에 ( ).', '목도리는 목에 둘러요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '둘러요', TRUE, '목도리는 목 주변에 둘러 따뜻하게 해요.'),
    (@school_capacity_question_id, 2, '읽어요', FALSE, '다시 생각해 볼까요? 목도리는 목 주변에 둘러 따뜻하게 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '목도리는 목에 ( ).', '목도리는 목에 둘러요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '읽어요', FALSE, '다시 생각해 볼까요? 목도리는 목 주변에 둘러 따뜻하게 해요.'),
    (@school_capacity_question_id, 2, '둘러요', TRUE, '목도리는 목 주변에 둘러 따뜻하게 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '장갑은 손에 ( ).', '장갑은 손에 껴요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '껴요', TRUE, '장갑을 손에 넣는 행동은 장갑을 낀다고 해요.'),
    (@school_capacity_question_id, 2, '먹어요', FALSE, '다시 생각해 볼까요? 장갑을 손에 넣는 행동은 장갑을 낀다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '장갑은 손에 ( ).', '장갑은 손에 껴요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '먹어요', FALSE, '다시 생각해 볼까요? 장갑을 손에 넣는 행동은 장갑을 낀다고 해요.'),
    (@school_capacity_question_id, 2, '껴요', TRUE, '장갑을 손에 넣는 행동은 장갑을 낀다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '장갑은 손에 ( ).', '장갑은 손에 껴요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '껴요', TRUE, '장갑을 손에 넣는 행동은 장갑을 낀다고 해요.'),
    (@school_capacity_question_id, 2, '먹어요', FALSE, '다시 생각해 볼까요? 장갑을 손에 넣는 행동은 장갑을 낀다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '모자는 머리에 ( ).', '모자는 머리에 써요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '마셔요', FALSE, '다시 생각해 볼까요? 머리에 모자를 올리는 행동은 모자를 쓴다고 해요.'),
    (@school_capacity_question_id, 2, '써요', TRUE, '머리에 모자를 올리는 행동은 모자를 쓴다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '모자는 머리에 ( ).', '모자는 머리에 써요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '써요', TRUE, '머리에 모자를 올리는 행동은 모자를 쓴다고 해요.'),
    (@school_capacity_question_id, 2, '마셔요', FALSE, '다시 생각해 볼까요? 머리에 모자를 올리는 행동은 모자를 쓴다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '모자는 머리에 ( ).', '모자는 머리에 써요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '마셔요', FALSE, '다시 생각해 볼까요? 머리에 모자를 올리는 행동은 모자를 쓴다고 해요.'),
    (@school_capacity_question_id, 2, '써요', TRUE, '머리에 모자를 올리는 행동은 모자를 쓴다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '식탁 위에 숟가락과 젓가락을 ( ).', '식탁 위에 숟가락과 젓가락을 놓아요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '놓아요', TRUE, '식사에 쓸 도구를 식탁 위에 놓아요.'),
    (@school_capacity_question_id, 2, '입어요', FALSE, '다시 생각해 볼까요? 식사에 쓸 도구를 식탁 위에 놓아요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '식탁 위에 숟가락과 젓가락을 ( ).', '식탁 위에 숟가락과 젓가락을 놓아요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '입어요', FALSE, '다시 생각해 볼까요? 식사에 쓸 도구를 식탁 위에 놓아요.'),
    (@school_capacity_question_id, 2, '놓아요', TRUE, '식사에 쓸 도구를 식탁 위에 놓아요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '식탁 위에 숟가락과 젓가락을 ( ).', '식탁 위에 숟가락과 젓가락을 놓아요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '놓아요', TRUE, '식사에 쓸 도구를 식탁 위에 놓아요.'),
    (@school_capacity_question_id, 2, '입어요', FALSE, '다시 생각해 볼까요? 식사에 쓸 도구를 식탁 위에 놓아요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '냉장고에 넣어 둔 우유를 컵에 ( ).', '냉장고에 넣어 둔 우유를 컵에 따라요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '접어요', FALSE, '다시 생각해 볼까요? 우유 같은 액체는 컵에 따를 수 있어요.'),
    (@school_capacity_question_id, 2, '따라요', TRUE, '우유 같은 액체는 컵에 따를 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '냉장고에 넣어 둔 우유를 컵에 ( ).', '냉장고에 넣어 둔 우유를 컵에 따라요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '따라요', TRUE, '우유 같은 액체는 컵에 따를 수 있어요.'),
    (@school_capacity_question_id, 2, '접어요', FALSE, '다시 생각해 볼까요? 우유 같은 액체는 컵에 따를 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '냉장고에 넣어 둔 우유를 컵에 ( ).', '냉장고에 넣어 둔 우유를 컵에 따라요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '접어요', FALSE, '다시 생각해 볼까요? 우유 같은 액체는 컵에 따를 수 있어요.'),
    (@school_capacity_question_id, 2, '따라요', TRUE, '우유 같은 액체는 컵에 따를 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '잘 익은 바나나의 껍질을 ( ).', '잘 익은 바나나의 껍질을 벗겨요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '벗겨요', TRUE, '바나나를 먹기 전에는 껍질을 벗겨요.'),
    (@school_capacity_question_id, 2, '읽어요', FALSE, '다시 생각해 볼까요? 바나나를 먹기 전에는 껍질을 벗겨요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '잘 익은 바나나의 껍질을 ( ).', '잘 익은 바나나의 껍질을 벗겨요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '읽어요', FALSE, '다시 생각해 볼까요? 바나나를 먹기 전에는 껍질을 벗겨요.'),
    (@school_capacity_question_id, 2, '벗겨요', TRUE, '바나나를 먹기 전에는 껍질을 벗겨요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '잘 익은 바나나의 껍질을 ( ).', '잘 익은 바나나의 껍질을 벗겨요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '벗겨요', TRUE, '바나나를 먹기 전에는 껍질을 벗겨요.'),
    (@school_capacity_question_id, 2, '읽어요', FALSE, '다시 생각해 볼까요? 바나나를 먹기 전에는 껍질을 벗겨요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '사과를 먹기 전에 깨끗이 ( ).', '사과를 먹기 전에 깨끗이 씻어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '신어요', FALSE, '다시 생각해 볼까요? 과일 표면의 먼지를 없애기 위해 깨끗이 씻어요.'),
    (@school_capacity_question_id, 2, '씻어요', TRUE, '과일 표면의 먼지를 없애기 위해 깨끗이 씻어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '사과를 먹기 전에 깨끗이 ( ).', '사과를 먹기 전에 깨끗이 씻어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '씻어요', TRUE, '과일 표면의 먼지를 없애기 위해 깨끗이 씻어요.'),
    (@school_capacity_question_id, 2, '신어요', FALSE, '다시 생각해 볼까요? 과일 표면의 먼지를 없애기 위해 깨끗이 씻어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '사과를 먹기 전에 깨끗이 ( ).', '사과를 먹기 전에 깨끗이 씻어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '신어요', FALSE, '다시 생각해 볼까요? 과일 표면의 먼지를 없애기 위해 깨끗이 씻어요.'),
    (@school_capacity_question_id, 2, '씻어요', TRUE, '과일 표면의 먼지를 없애기 위해 깨끗이 씻어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '밥을 먹은 뒤 빈 그릇을 ( ).', '밥을 먹은 뒤 빈 그릇을 정리해요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '정리해요', TRUE, '식사를 마친 뒤에는 사용한 그릇을 정리해요.'),
    (@school_capacity_question_id, 2, '입어요', FALSE, '다시 생각해 볼까요? 식사를 마친 뒤에는 사용한 그릇을 정리해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '밥을 먹은 뒤 빈 그릇을 ( ).', '밥을 먹은 뒤 빈 그릇을 정리해요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '입어요', FALSE, '다시 생각해 볼까요? 식사를 마친 뒤에는 사용한 그릇을 정리해요.'),
    (@school_capacity_question_id, 2, '정리해요', TRUE, '식사를 마친 뒤에는 사용한 그릇을 정리해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '밥을 먹은 뒤 빈 그릇을 ( ).', '밥을 먹은 뒤 빈 그릇을 정리해요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '정리해요', TRUE, '식사를 마친 뒤에는 사용한 그릇을 정리해요.'),
    (@school_capacity_question_id, 2, '입어요', FALSE, '다시 생각해 볼까요? 식사를 마친 뒤에는 사용한 그릇을 정리해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '어두워지기 전에 집으로 ( ).', '어두워지기 전에 집으로 돌아가요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '씹어요', FALSE, '다시 생각해 볼까요? 있던 곳으로 다시 가는 것은 돌아간다고 해요.'),
    (@school_capacity_question_id, 2, '돌아가요', TRUE, '있던 곳으로 다시 가는 것은 돌아간다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '어두워지기 전에 집으로 ( ).', '어두워지기 전에 집으로 돌아가요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '돌아가요', TRUE, '있던 곳으로 다시 가는 것은 돌아간다고 해요.'),
    (@school_capacity_question_id, 2, '씹어요', FALSE, '다시 생각해 볼까요? 있던 곳으로 다시 가는 것은 돌아간다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '어두워지기 전에 집으로 ( ).', '어두워지기 전에 집으로 돌아가요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '씹어요', FALSE, '다시 생각해 볼까요? 있던 곳으로 다시 가는 것은 돌아간다고 해요.'),
    (@school_capacity_question_id, 2, '돌아가요', TRUE, '있던 곳으로 다시 가는 것은 돌아간다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '우체통에 편지를 ( ).', '우체통에 편지를 넣어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '넣어요', TRUE, '편지를 보내려면 우체통에 넣을 수 있어요.'),
    (@school_capacity_question_id, 2, '신어요', FALSE, '다시 생각해 볼까요? 편지를 보내려면 우체통에 넣을 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '우체통에 편지를 ( ).', '우체통에 편지를 넣어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '신어요', FALSE, '다시 생각해 볼까요? 편지를 보내려면 우체통에 넣을 수 있어요.'),
    (@school_capacity_question_id, 2, '넣어요', TRUE, '편지를 보내려면 우체통에 넣을 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '우체통에 편지를 ( ).', '우체통에 편지를 넣어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '넣어요', TRUE, '편지를 보내려면 우체통에 넣을 수 있어요.'),
    (@school_capacity_question_id, 2, '신어요', FALSE, '다시 생각해 볼까요? 편지를 보내려면 우체통에 넣을 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '친구에게 전할 말을 편지에 ( ).', '친구에게 전할 말을 편지에 써요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '끓여요', FALSE, '다시 생각해 볼까요? 생각이나 말을 글자로 나타낼 때 쓴다고 해요.'),
    (@school_capacity_question_id, 2, '써요', TRUE, '생각이나 말을 글자로 나타낼 때 쓴다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '친구에게 전할 말을 편지에 ( ).', '친구에게 전할 말을 편지에 써요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '써요', TRUE, '생각이나 말을 글자로 나타낼 때 쓴다고 해요.'),
    (@school_capacity_question_id, 2, '끓여요', FALSE, '다시 생각해 볼까요? 생각이나 말을 글자로 나타낼 때 쓴다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '친구에게 전할 말을 편지에 ( ).', '친구에게 전할 말을 편지에 써요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '끓여요', FALSE, '다시 생각해 볼까요? 생각이나 말을 글자로 나타낼 때 쓴다고 해요.'),
    (@school_capacity_question_id, 2, '써요', TRUE, '생각이나 말을 글자로 나타낼 때 쓴다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '종이의 양쪽 끝을 맞추어 반으로 ( ).', '종이의 양쪽 끝을 맞추어 반으로 접어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '접어요', TRUE, '종이를 포개어 구부리는 행동을 접는다고 해요.'),
    (@school_capacity_question_id, 2, '마셔요', FALSE, '다시 생각해 볼까요? 종이를 포개어 구부리는 행동을 접는다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '종이의 양쪽 끝을 맞추어 반으로 ( ).', '종이의 양쪽 끝을 맞추어 반으로 접어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '마셔요', FALSE, '다시 생각해 볼까요? 종이를 포개어 구부리는 행동을 접는다고 해요.'),
    (@school_capacity_question_id, 2, '접어요', TRUE, '종이를 포개어 구부리는 행동을 접는다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '종이의 양쪽 끝을 맞추어 반으로 ( ).', '종이의 양쪽 끝을 맞추어 반으로 접어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '접어요', TRUE, '종이를 포개어 구부리는 행동을 접는다고 해요.'),
    (@school_capacity_question_id, 2, '마셔요', FALSE, '다시 생각해 볼까요? 종이를 포개어 구부리는 행동을 접는다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '달력에서 오늘 날짜를 ( ).', '달력에서 오늘 날짜를 찾아요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '먹어요', FALSE, '다시 생각해 볼까요? 달력의 숫자를 보고 날짜를 찾을 수 있어요.'),
    (@school_capacity_question_id, 2, '찾아요', TRUE, '달력의 숫자를 보고 날짜를 찾을 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '달력에서 오늘 날짜를 ( ).', '달력에서 오늘 날짜를 찾아요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '찾아요', TRUE, '달력의 숫자를 보고 날짜를 찾을 수 있어요.'),
    (@school_capacity_question_id, 2, '먹어요', FALSE, '다시 생각해 볼까요? 달력의 숫자를 보고 날짜를 찾을 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '달력에서 오늘 날짜를 ( ).', '달력에서 오늘 날짜를 찾아요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '먹어요', FALSE, '다시 생각해 볼까요? 달력의 숫자를 보고 날짜를 찾을 수 있어요.'),
    (@school_capacity_question_id, 2, '찾아요', TRUE, '달력의 숫자를 보고 날짜를 찾을 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '시계를 보고 약속 시간을 ( ).', '시계를 보고 약속 시간을 확인해요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '확인해요', TRUE, '시계는 시간을 확인하는 데 사용하는 도구예요.'),
    (@school_capacity_question_id, 2, '씹어요', FALSE, '다시 생각해 볼까요? 시계는 시간을 확인하는 데 사용하는 도구예요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '시계를 보고 약속 시간을 ( ).', '시계를 보고 약속 시간을 확인해요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '씹어요', FALSE, '다시 생각해 볼까요? 시계는 시간을 확인하는 데 사용하는 도구예요.'),
    (@school_capacity_question_id, 2, '확인해요', TRUE, '시계는 시간을 확인하는 데 사용하는 도구예요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '시계를 보고 약속 시간을 ( ).', '시계를 보고 약속 시간을 확인해요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '확인해요', TRUE, '시계는 시간을 확인하는 데 사용하는 도구예요.'),
    (@school_capacity_question_id, 2, '씹어요', FALSE, '다시 생각해 볼까요? 시계는 시간을 확인하는 데 사용하는 도구예요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '비가 그친 뒤 하늘에 무지개가 ( ).', '비가 그친 뒤 하늘에 무지개가 떴어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '신었어요', FALSE, '다시 생각해 볼까요? 하늘에 무지개가 나타나면 무지개가 떴다고 해요.'),
    (@school_capacity_question_id, 2, '떴어요', TRUE, '하늘에 무지개가 나타나면 무지개가 떴다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '비가 그친 뒤 하늘에 무지개가 ( ).', '비가 그친 뒤 하늘에 무지개가 떴어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '떴어요', TRUE, '하늘에 무지개가 나타나면 무지개가 떴다고 해요.'),
    (@school_capacity_question_id, 2, '신었어요', FALSE, '다시 생각해 볼까요? 하늘에 무지개가 나타나면 무지개가 떴다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '비가 그친 뒤 하늘에 무지개가 ( ).', '비가 그친 뒤 하늘에 무지개가 떴어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '신었어요', FALSE, '다시 생각해 볼까요? 하늘에 무지개가 나타나면 무지개가 떴다고 해요.'),
    (@school_capacity_question_id, 2, '떴어요', TRUE, '하늘에 무지개가 나타나면 무지개가 떴다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '바람이 불어서 나뭇잎이 ( ).', '바람이 불어서 나뭇잎이 흔들려요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '흔들려요', TRUE, '바람에 나뭇잎이 이리저리 움직이는 것을 흔들린다고 해요.'),
    (@school_capacity_question_id, 2, '마셔요', FALSE, '다시 생각해 볼까요? 바람에 나뭇잎이 이리저리 움직이는 것을 흔들린다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '바람이 불어서 나뭇잎이 ( ).', '바람이 불어서 나뭇잎이 흔들려요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '마셔요', FALSE, '다시 생각해 볼까요? 바람에 나뭇잎이 이리저리 움직이는 것을 흔들린다고 해요.'),
    (@school_capacity_question_id, 2, '흔들려요', TRUE, '바람에 나뭇잎이 이리저리 움직이는 것을 흔들린다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '바람이 불어서 나뭇잎이 ( ).', '바람이 불어서 나뭇잎이 흔들려요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '흔들려요', TRUE, '바람에 나뭇잎이 이리저리 움직이는 것을 흔들린다고 해요.'),
    (@school_capacity_question_id, 2, '마셔요', FALSE, '다시 생각해 볼까요? 바람에 나뭇잎이 이리저리 움직이는 것을 흔들린다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '봄이 되자 꽃이 활짝 ( ).', '봄이 되자 꽃이 활짝 피었어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '접었어요', FALSE, '다시 생각해 볼까요? 꽃봉오리가 벌어지면 꽃이 피었다고 해요.'),
    (@school_capacity_question_id, 2, '피었어요', TRUE, '꽃봉오리가 벌어지면 꽃이 피었다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '봄이 되자 꽃이 활짝 ( ).', '봄이 되자 꽃이 활짝 피었어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '피었어요', TRUE, '꽃봉오리가 벌어지면 꽃이 피었다고 해요.'),
    (@school_capacity_question_id, 2, '접었어요', FALSE, '다시 생각해 볼까요? 꽃봉오리가 벌어지면 꽃이 피었다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '봄이 되자 꽃이 활짝 ( ).', '봄이 되자 꽃이 활짝 피었어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '접었어요', FALSE, '다시 생각해 볼까요? 꽃봉오리가 벌어지면 꽃이 피었다고 해요.'),
    (@school_capacity_question_id, 2, '피었어요', TRUE, '꽃봉오리가 벌어지면 꽃이 피었다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '가을이 되니 나뭇잎 색이 ( ).', '가을이 되니 나뭇잎 색이 변해요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '변해요', TRUE, '전과 다른 색이 되는 것을 색이 변한다고 해요.'),
    (@school_capacity_question_id, 2, '마셔요', FALSE, '다시 생각해 볼까요? 전과 다른 색이 되는 것을 색이 변한다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '가을이 되니 나뭇잎 색이 ( ).', '가을이 되니 나뭇잎 색이 변해요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '마셔요', FALSE, '다시 생각해 볼까요? 전과 다른 색이 되는 것을 색이 변한다고 해요.'),
    (@school_capacity_question_id, 2, '변해요', TRUE, '전과 다른 색이 되는 것을 색이 변한다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '가을이 되니 나뭇잎 색이 ( ).', '가을이 되니 나뭇잎 색이 변해요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '변해요', TRUE, '전과 다른 색이 되는 것을 색이 변한다고 해요.'),
    (@school_capacity_question_id, 2, '마셔요', FALSE, '다시 생각해 볼까요? 전과 다른 색이 되는 것을 색이 변한다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '눈이 내려 길이 하얗게 ( ).', '눈이 내려 길이 하얗게 덮였어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '읽었어요', FALSE, '다시 생각해 볼까요? 눈이 길 위에 쌓이면 길이 눈으로 덮였다고 해요.'),
    (@school_capacity_question_id, 2, '덮였어요', TRUE, '눈이 길 위에 쌓이면 길이 눈으로 덮였다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '눈이 내려 길이 하얗게 ( ).', '눈이 내려 길이 하얗게 덮였어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '덮였어요', TRUE, '눈이 길 위에 쌓이면 길이 눈으로 덮였다고 해요.'),
    (@school_capacity_question_id, 2, '읽었어요', FALSE, '다시 생각해 볼까요? 눈이 길 위에 쌓이면 길이 눈으로 덮였다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '눈이 내려 길이 하얗게 ( ).', '눈이 내려 길이 하얗게 덮였어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '읽었어요', FALSE, '다시 생각해 볼까요? 눈이 길 위에 쌓이면 길이 눈으로 덮였다고 해요.'),
    (@school_capacity_question_id, 2, '덮였어요', TRUE, '눈이 길 위에 쌓이면 길이 눈으로 덮였다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '새가 날개를 펴고 하늘을 ( ).', '새가 날개를 펴고 하늘을 날아요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '날아요', TRUE, '새가 공중에서 이동하는 행동은 난다고 해요.'),
    (@school_capacity_question_id, 2, '읽어요', FALSE, '다시 생각해 볼까요? 새가 공중에서 이동하는 행동은 난다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '새가 날개를 펴고 하늘을 ( ).', '새가 날개를 펴고 하늘을 날아요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '읽어요', FALSE, '다시 생각해 볼까요? 새가 공중에서 이동하는 행동은 난다고 해요.'),
    (@school_capacity_question_id, 2, '날아요', TRUE, '새가 공중에서 이동하는 행동은 난다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '새가 날개를 펴고 하늘을 ( ).', '새가 날개를 펴고 하늘을 날아요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '날아요', TRUE, '새가 공중에서 이동하는 행동은 난다고 해요.'),
    (@school_capacity_question_id, 2, '읽어요', FALSE, '다시 생각해 볼까요? 새가 공중에서 이동하는 행동은 난다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '물고기가 물속에서 ( ).', '물고기가 물속에서 헤엄쳐요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '신어요', FALSE, '다시 생각해 볼까요? 물속에서 몸을 움직여 나아가는 것을 헤엄친다고 해요.'),
    (@school_capacity_question_id, 2, '헤엄쳐요', TRUE, '물속에서 몸을 움직여 나아가는 것을 헤엄친다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '물고기가 물속에서 ( ).', '물고기가 물속에서 헤엄쳐요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '헤엄쳐요', TRUE, '물속에서 몸을 움직여 나아가는 것을 헤엄친다고 해요.'),
    (@school_capacity_question_id, 2, '신어요', FALSE, '다시 생각해 볼까요? 물속에서 몸을 움직여 나아가는 것을 헤엄친다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '물고기가 물속에서 ( ).', '물고기가 물속에서 헤엄쳐요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '신어요', FALSE, '다시 생각해 볼까요? 물속에서 몸을 움직여 나아가는 것을 헤엄친다고 해요.'),
    (@school_capacity_question_id, 2, '헤엄쳐요', TRUE, '물속에서 몸을 움직여 나아가는 것을 헤엄친다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '달팽이가 천천히 앞으로 ( ).', '달팽이가 천천히 앞으로 기어가요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '기어가요', TRUE, '몸을 바닥에 대고 이동하는 행동을 기어간다고 해요.'),
    (@school_capacity_question_id, 2, '읽어요', FALSE, '다시 생각해 볼까요? 몸을 바닥에 대고 이동하는 행동을 기어간다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '달팽이가 천천히 앞으로 ( ).', '달팽이가 천천히 앞으로 기어가요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '읽어요', FALSE, '다시 생각해 볼까요? 몸을 바닥에 대고 이동하는 행동을 기어간다고 해요.'),
    (@school_capacity_question_id, 2, '기어가요', TRUE, '몸을 바닥에 대고 이동하는 행동을 기어간다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '달팽이가 천천히 앞으로 ( ).', '달팽이가 천천히 앞으로 기어가요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '기어가요', TRUE, '몸을 바닥에 대고 이동하는 행동을 기어간다고 해요.'),
    (@school_capacity_question_id, 2, '읽어요', FALSE, '다시 생각해 볼까요? 몸을 바닥에 대고 이동하는 행동을 기어간다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '운동을 마치고 숨을 천천히 ( ).', '운동을 마치고 숨을 천천히 골라요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '접어요', FALSE, '다시 생각해 볼까요? 거칠어진 숨을 가라앉히는 것을 숨을 고른다고 해요.'),
    (@school_capacity_question_id, 2, '골라요', TRUE, '거칠어진 숨을 가라앉히는 것을 숨을 고른다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '운동을 마치고 숨을 천천히 ( ).', '운동을 마치고 숨을 천천히 골라요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '골라요', TRUE, '거칠어진 숨을 가라앉히는 것을 숨을 고른다고 해요.'),
    (@school_capacity_question_id, 2, '접어요', FALSE, '다시 생각해 볼까요? 거칠어진 숨을 가라앉히는 것을 숨을 고른다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '운동을 마치고 숨을 천천히 ( ).', '운동을 마치고 숨을 천천히 골라요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '접어요', FALSE, '다시 생각해 볼까요? 거칠어진 숨을 가라앉히는 것을 숨을 고른다고 해요.'),
    (@school_capacity_question_id, 2, '골라요', TRUE, '거칠어진 숨을 가라앉히는 것을 숨을 고른다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '차례가 될 때까지 줄을 서서 ( ).', '차례가 될 때까지 줄을 서서 기다려요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '기다려요', TRUE, '여럿이 함께 사용할 때는 자기 차례를 기다려요.'),
    (@school_capacity_question_id, 2, '삼켜요', FALSE, '다시 생각해 볼까요? 여럿이 함께 사용할 때는 자기 차례를 기다려요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '차례가 될 때까지 줄을 서서 ( ).', '차례가 될 때까지 줄을 서서 기다려요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '삼켜요', FALSE, '다시 생각해 볼까요? 여럿이 함께 사용할 때는 자기 차례를 기다려요.'),
    (@school_capacity_question_id, 2, '기다려요', TRUE, '여럿이 함께 사용할 때는 자기 차례를 기다려요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '차례가 될 때까지 줄을 서서 ( ).', '차례가 될 때까지 줄을 서서 기다려요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '기다려요', TRUE, '여럿이 함께 사용할 때는 자기 차례를 기다려요.'),
    (@school_capacity_question_id, 2, '삼켜요', FALSE, '다시 생각해 볼까요? 여럿이 함께 사용할 때는 자기 차례를 기다려요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '친구와 한 약속을 끝까지 ( ).', '친구와 한 약속을 끝까지 지켜요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '씹어요', FALSE, '다시 생각해 볼까요? 하기로 한 일을 행동으로 옮기는 것은 약속을 지킨다고 해요.'),
    (@school_capacity_question_id, 2, '지켜요', TRUE, '하기로 한 일을 행동으로 옮기는 것은 약속을 지킨다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '친구와 한 약속을 끝까지 ( ).', '친구와 한 약속을 끝까지 지켜요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '지켜요', TRUE, '하기로 한 일을 행동으로 옮기는 것은 약속을 지킨다고 해요.'),
    (@school_capacity_question_id, 2, '씹어요', FALSE, '다시 생각해 볼까요? 하기로 한 일을 행동으로 옮기는 것은 약속을 지킨다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '친구와 한 약속을 끝까지 ( ).', '친구와 한 약속을 끝까지 지켜요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '씹어요', FALSE, '다시 생각해 볼까요? 하기로 한 일을 행동으로 옮기는 것은 약속을 지킨다고 해요.'),
    (@school_capacity_question_id, 2, '지켜요', TRUE, '하기로 한 일을 행동으로 옮기는 것은 약속을 지킨다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '다른 사람의 물건을 쓰기 전에 허락을 ( ).', '다른 사람의 물건을 쓰기 전에 허락을 구해요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '구해요', TRUE, '남의 물건을 쓰려면 먼저 허락을 구해요.'),
    (@school_capacity_question_id, 2, '입어요', FALSE, '다시 생각해 볼까요? 남의 물건을 쓰려면 먼저 허락을 구해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '다른 사람의 물건을 쓰기 전에 허락을 ( ).', '다른 사람의 물건을 쓰기 전에 허락을 구해요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '입어요', FALSE, '다시 생각해 볼까요? 남의 물건을 쓰려면 먼저 허락을 구해요.'),
    (@school_capacity_question_id, 2, '구해요', TRUE, '남의 물건을 쓰려면 먼저 허락을 구해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '다른 사람의 물건을 쓰기 전에 허락을 ( ).', '다른 사람의 물건을 쓰기 전에 허락을 구해요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '구해요', TRUE, '남의 물건을 쓰려면 먼저 허락을 구해요.'),
    (@school_capacity_question_id, 2, '입어요', FALSE, '다시 생각해 볼까요? 남의 물건을 쓰려면 먼저 허락을 구해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '모르는 낱말을 사전에서 ( ).', '모르는 낱말을 사전에서 찾아요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '마셔요', FALSE, '다시 생각해 볼까요? 사전에서 낱말을 찾아 뜻을 알아볼 수 있어요.'),
    (@school_capacity_question_id, 2, '찾아요', TRUE, '사전에서 낱말을 찾아 뜻을 알아볼 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '모르는 낱말을 사전에서 ( ).', '모르는 낱말을 사전에서 찾아요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '찾아요', TRUE, '사전에서 낱말을 찾아 뜻을 알아볼 수 있어요.'),
    (@school_capacity_question_id, 2, '마셔요', FALSE, '다시 생각해 볼까요? 사전에서 낱말을 찾아 뜻을 알아볼 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '모르는 낱말을 사전에서 ( ).', '모르는 낱말을 사전에서 찾아요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '마셔요', FALSE, '다시 생각해 볼까요? 사전에서 낱말을 찾아 뜻을 알아볼 수 있어요.'),
    (@school_capacity_question_id, 2, '찾아요', TRUE, '사전에서 낱말을 찾아 뜻을 알아볼 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '틀린 답을 고쳐 다시 ( ).', '틀린 답을 고쳐 다시 써요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '써요', TRUE, '답을 글자로 나타낼 때는 쓴다고 해요.'),
    (@school_capacity_question_id, 2, '신어요', FALSE, '다시 생각해 볼까요? 답을 글자로 나타낼 때는 쓴다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '틀린 답을 고쳐 다시 ( ).', '틀린 답을 고쳐 다시 써요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '신어요', FALSE, '다시 생각해 볼까요? 답을 글자로 나타낼 때는 쓴다고 해요.'),
    (@school_capacity_question_id, 2, '써요', TRUE, '답을 글자로 나타낼 때는 쓴다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '틀린 답을 고쳐 다시 ( ).', '틀린 답을 고쳐 다시 써요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '써요', TRUE, '답을 글자로 나타낼 때는 쓴다고 해요.'),
    (@school_capacity_question_id, 2, '신어요', FALSE, '다시 생각해 볼까요? 답을 글자로 나타낼 때는 쓴다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '친구와 의견이 다를 때 서로의 생각을 ( ).', '친구와 의견이 다를 때 서로의 생각을 들어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '먹어요', FALSE, '다시 생각해 볼까요? 서로의 생각을 들으면 의견을 이해하는 데 도움이 돼요.'),
    (@school_capacity_question_id, 2, '들어요', TRUE, '서로의 생각을 들으면 의견을 이해하는 데 도움이 돼요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '친구와 의견이 다를 때 서로의 생각을 ( ).', '친구와 의견이 다를 때 서로의 생각을 들어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '들어요', TRUE, '서로의 생각을 들으면 의견을 이해하는 데 도움이 돼요.'),
    (@school_capacity_question_id, 2, '먹어요', FALSE, '다시 생각해 볼까요? 서로의 생각을 들으면 의견을 이해하는 데 도움이 돼요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '친구와 의견이 다를 때 서로의 생각을 ( ).', '친구와 의견이 다를 때 서로의 생각을 들어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '먹어요', FALSE, '다시 생각해 볼까요? 서로의 생각을 들으면 의견을 이해하는 데 도움이 돼요.'),
    (@school_capacity_question_id, 2, '들어요', TRUE, '서로의 생각을 들으면 의견을 이해하는 데 도움이 돼요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '넘어진 친구에게 손을 내밀어 ( ).', '넘어진 친구에게 손을 내밀어 도와줘요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '도와줘요', TRUE, '어려운 일을 겪는 사람에게 힘을 보태면 도와준다고 해요.'),
    (@school_capacity_question_id, 2, '접어요', FALSE, '다시 생각해 볼까요? 어려운 일을 겪는 사람에게 힘을 보태면 도와준다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '넘어진 친구에게 손을 내밀어 ( ).', '넘어진 친구에게 손을 내밀어 도와줘요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '접어요', FALSE, '다시 생각해 볼까요? 어려운 일을 겪는 사람에게 힘을 보태면 도와준다고 해요.'),
    (@school_capacity_question_id, 2, '도와줘요', TRUE, '어려운 일을 겪는 사람에게 힘을 보태면 도와준다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '넘어진 친구에게 손을 내밀어 ( ).', '넘어진 친구에게 손을 내밀어 도와줘요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '도와줘요', TRUE, '어려운 일을 겪는 사람에게 힘을 보태면 도와준다고 해요.'),
    (@school_capacity_question_id, 2, '접어요', FALSE, '다시 생각해 볼까요? 어려운 일을 겪는 사람에게 힘을 보태면 도와준다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '길에 떨어진 종이를 주워 쓰레기통에 ( ).', '길에 떨어진 종이를 주워 쓰레기통에 넣어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '신어요', FALSE, '다시 생각해 볼까요? 주운 쓰레기는 알맞은 쓰레기통에 넣어요.'),
    (@school_capacity_question_id, 2, '넣어요', TRUE, '주운 쓰레기는 알맞은 쓰레기통에 넣어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '길에 떨어진 종이를 주워 쓰레기통에 ( ).', '길에 떨어진 종이를 주워 쓰레기통에 넣어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '넣어요', TRUE, '주운 쓰레기는 알맞은 쓰레기통에 넣어요.'),
    (@school_capacity_question_id, 2, '신어요', FALSE, '다시 생각해 볼까요? 주운 쓰레기는 알맞은 쓰레기통에 넣어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '길에 떨어진 종이를 주워 쓰레기통에 ( ).', '길에 떨어진 종이를 주워 쓰레기통에 넣어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '신어요', FALSE, '다시 생각해 볼까요? 주운 쓰레기는 알맞은 쓰레기통에 넣어요.'),
    (@school_capacity_question_id, 2, '넣어요', TRUE, '주운 쓰레기는 알맞은 쓰레기통에 넣어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '책의 제목을 보고 내용을 ( ).', '책의 제목을 보고 내용을 짐작해요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '짐작해요', TRUE, '단서를 보고 내용을 미리 생각하는 것을 짐작한다고 해요.'),
    (@school_capacity_question_id, 2, '마셔요', FALSE, '다시 생각해 볼까요? 단서를 보고 내용을 미리 생각하는 것을 짐작한다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '책의 제목을 보고 내용을 ( ).', '책의 제목을 보고 내용을 짐작해요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '마셔요', FALSE, '다시 생각해 볼까요? 단서를 보고 내용을 미리 생각하는 것을 짐작한다고 해요.'),
    (@school_capacity_question_id, 2, '짐작해요', TRUE, '단서를 보고 내용을 미리 생각하는 것을 짐작한다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '책의 제목을 보고 내용을 ( ).', '책의 제목을 보고 내용을 짐작해요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '짐작해요', TRUE, '단서를 보고 내용을 미리 생각하는 것을 짐작한다고 해요.'),
    (@school_capacity_question_id, 2, '마셔요', FALSE, '다시 생각해 볼까요? 단서를 보고 내용을 미리 생각하는 것을 짐작한다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '만들기 활동을 마친 뒤 도구를 제자리에 ( ).', '만들기 활동을 마친 뒤 도구를 제자리에 돌려놓아요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '삼켜요', FALSE, '다시 생각해 볼까요? 사용한 물건은 원래 있던 자리에 돌려놓아요.'),
    (@school_capacity_question_id, 2, '돌려놓아요', TRUE, '사용한 물건은 원래 있던 자리에 돌려놓아요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '만들기 활동을 마친 뒤 도구를 제자리에 ( ).', '만들기 활동을 마친 뒤 도구를 제자리에 돌려놓아요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '돌려놓아요', TRUE, '사용한 물건은 원래 있던 자리에 돌려놓아요.'),
    (@school_capacity_question_id, 2, '삼켜요', FALSE, '다시 생각해 볼까요? 사용한 물건은 원래 있던 자리에 돌려놓아요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '만들기 활동을 마친 뒤 도구를 제자리에 ( ).', '만들기 활동을 마친 뒤 도구를 제자리에 돌려놓아요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '삼켜요', FALSE, '다시 생각해 볼까요? 사용한 물건은 원래 있던 자리에 돌려놓아요.'),
    (@school_capacity_question_id, 2, '돌려놓아요', TRUE, '사용한 물건은 원래 있던 자리에 돌려놓아요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '버스가 멈춘 뒤 차례대로 ( ).', '버스가 멈춘 뒤 차례대로 내려요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '내려요', TRUE, '버스에서 밖으로 나오는 행동을 내린다고 해요.'),
    (@school_capacity_question_id, 2, '씹어요', FALSE, '다시 생각해 볼까요? 버스에서 밖으로 나오는 행동을 내린다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '버스가 멈춘 뒤 차례대로 ( ).', '버스가 멈춘 뒤 차례대로 내려요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '씹어요', FALSE, '다시 생각해 볼까요? 버스에서 밖으로 나오는 행동을 내린다고 해요.'),
    (@school_capacity_question_id, 2, '내려요', TRUE, '버스에서 밖으로 나오는 행동을 내린다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '버스가 멈춘 뒤 차례대로 ( ).', '버스가 멈춘 뒤 차례대로 내려요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '내려요', TRUE, '버스에서 밖으로 나오는 행동을 내린다고 해요.'),
    (@school_capacity_question_id, 2, '씹어요', FALSE, '다시 생각해 볼까요? 버스에서 밖으로 나오는 행동을 내린다고 해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 8, '동생이 잠들어서 작은 목소리로 ( ).', '동생이 잠들어서 작은 목소리로 말해요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '신어요', FALSE, '다시 생각해 볼까요? 말소리를 작게 하려면 작은 목소리로 말해요.'),
    (@school_capacity_question_id, 2, '말해요', TRUE, '말소리를 작게 하려면 작은 목소리로 말해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 9, '동생이 잠들어서 작은 목소리로 ( ).', '동생이 잠들어서 작은 목소리로 말해요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '말해요', TRUE, '말소리를 작게 하려면 작은 목소리로 말해요.'),
    (@school_capacity_question_id, 2, '신어요', FALSE, '다시 생각해 볼까요? 말소리를 작게 하려면 작은 목소리로 말해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (1, 10, '동생이 잠들어서 작은 목소리로 ( ).', '동생이 잠들어서 작은 목소리로 말해요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '신어요', FALSE, '다시 생각해 볼까요? 말소리를 작게 하려면 작은 목소리로 말해요.'),
    (@school_capacity_question_id, 2, '말해요', TRUE, '말소리를 작게 하려면 작은 목소리로 말해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''빠르다''와 뜻이 반대인 말은 무엇일까요?', '빠르다 ↔ 느리다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '느리다', TRUE, '''빠르다''와 ''느리다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '밝다', FALSE, '다시 생각해 볼까요? ''빠르다''와 ''느리다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''빠르다''와 뜻이 반대인 말은 무엇일까요?', '빠르다 ↔ 느리다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '밝다', FALSE, '다시 생각해 볼까요? ''빠르다''와 ''느리다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '느리다', TRUE, '''빠르다''와 ''느리다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''빠르다''와 뜻이 반대인 말은 무엇일까요?', '빠르다 ↔ 느리다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '느리다', TRUE, '''빠르다''와 ''느리다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '밝다', FALSE, '다시 생각해 볼까요? ''빠르다''와 ''느리다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''가깝다''와 뜻이 반대인 말은 무엇일까요?', '가깝다 ↔ 멀다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '달다', FALSE, '다시 생각해 볼까요? ''가깝다''와 ''멀다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '멀다', TRUE, '''가깝다''와 ''멀다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''가깝다''와 뜻이 반대인 말은 무엇일까요?', '가깝다 ↔ 멀다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '멀다', TRUE, '''가깝다''와 ''멀다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '달다', FALSE, '다시 생각해 볼까요? ''가깝다''와 ''멀다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''가깝다''와 뜻이 반대인 말은 무엇일까요?', '가깝다 ↔ 멀다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '달다', FALSE, '다시 생각해 볼까요? ''가깝다''와 ''멀다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '멀다', TRUE, '''가깝다''와 ''멀다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''높다''와 뜻이 반대인 말은 무엇일까요?', '높다 ↔ 낮다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '낮다', TRUE, '''높다''와 ''낮다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '둥글다', FALSE, '다시 생각해 볼까요? ''높다''와 ''낮다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''높다''와 뜻이 반대인 말은 무엇일까요?', '높다 ↔ 낮다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '둥글다', FALSE, '다시 생각해 볼까요? ''높다''와 ''낮다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '낮다', TRUE, '''높다''와 ''낮다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''높다''와 뜻이 반대인 말은 무엇일까요?', '높다 ↔ 낮다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '낮다', TRUE, '''높다''와 ''낮다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '둥글다', FALSE, '다시 생각해 볼까요? ''높다''와 ''낮다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''넓다''와 뜻이 반대인 말은 무엇일까요?', '넓다 ↔ 좁다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '빠르다', FALSE, '다시 생각해 볼까요? ''넓다''와 ''좁다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '좁다', TRUE, '''넓다''와 ''좁다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''넓다''와 뜻이 반대인 말은 무엇일까요?', '넓다 ↔ 좁다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '좁다', TRUE, '''넓다''와 ''좁다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '빠르다', FALSE, '다시 생각해 볼까요? ''넓다''와 ''좁다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''넓다''와 뜻이 반대인 말은 무엇일까요?', '넓다 ↔ 좁다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '빠르다', FALSE, '다시 생각해 볼까요? ''넓다''와 ''좁다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '좁다', TRUE, '''넓다''와 ''좁다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''두껍다''와 뜻이 반대인 말은 무엇일까요?', '두껍다 ↔ 얇다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '얇다', TRUE, '''두껍다''와 ''얇다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '맑다', FALSE, '다시 생각해 볼까요? ''두껍다''와 ''얇다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''두껍다''와 뜻이 반대인 말은 무엇일까요?', '두껍다 ↔ 얇다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '맑다', FALSE, '다시 생각해 볼까요? ''두껍다''와 ''얇다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '얇다', TRUE, '''두껍다''와 ''얇다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''두껍다''와 뜻이 반대인 말은 무엇일까요?', '두껍다 ↔ 얇다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '얇다', TRUE, '''두껍다''와 ''얇다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '맑다', FALSE, '다시 생각해 볼까요? ''두껍다''와 ''얇다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''깊다''와 뜻이 반대인 말은 무엇일까요?', '깊다 ↔ 얕다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '새롭다', FALSE, '다시 생각해 볼까요? ''깊다''와 ''얕다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '얕다', TRUE, '''깊다''와 ''얕다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''깊다''와 뜻이 반대인 말은 무엇일까요?', '깊다 ↔ 얕다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '얕다', TRUE, '''깊다''와 ''얕다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '새롭다', FALSE, '다시 생각해 볼까요? ''깊다''와 ''얕다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''깊다''와 뜻이 반대인 말은 무엇일까요?', '깊다 ↔ 얕다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '새롭다', FALSE, '다시 생각해 볼까요? ''깊다''와 ''얕다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '얕다', TRUE, '''깊다''와 ''얕다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''앞''와 뜻이 반대인 말은 무엇일까요?', '앞 ↔ 뒤');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '뒤', TRUE, '''앞''와 ''뒤''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '위', FALSE, '다시 생각해 볼까요? ''앞''와 ''뒤''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''앞''와 뜻이 반대인 말은 무엇일까요?', '앞 ↔ 뒤');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '위', FALSE, '다시 생각해 볼까요? ''앞''와 ''뒤''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '뒤', TRUE, '''앞''와 ''뒤''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''앞''와 뜻이 반대인 말은 무엇일까요?', '앞 ↔ 뒤');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '뒤', TRUE, '''앞''와 ''뒤''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '위', FALSE, '다시 생각해 볼까요? ''앞''와 ''뒤''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''위''와 뜻이 반대인 말은 무엇일까요?', '위 ↔ 아래');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '옆', FALSE, '다시 생각해 볼까요? ''위''와 ''아래''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '아래', TRUE, '''위''와 ''아래''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''위''와 뜻이 반대인 말은 무엇일까요?', '위 ↔ 아래');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '아래', TRUE, '''위''와 ''아래''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '옆', FALSE, '다시 생각해 볼까요? ''위''와 ''아래''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''위''와 뜻이 반대인 말은 무엇일까요?', '위 ↔ 아래');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '옆', FALSE, '다시 생각해 볼까요? ''위''와 ''아래''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '아래', TRUE, '''위''와 ''아래''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''안''와 뜻이 반대인 말은 무엇일까요?', '안 ↔ 밖');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '밖', TRUE, '''안''와 ''밖''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '뒤', FALSE, '다시 생각해 볼까요? ''안''와 ''밖''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''안''와 뜻이 반대인 말은 무엇일까요?', '안 ↔ 밖');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '뒤', FALSE, '다시 생각해 볼까요? ''안''와 ''밖''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '밖', TRUE, '''안''와 ''밖''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''안''와 뜻이 반대인 말은 무엇일까요?', '안 ↔ 밖');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '밖', TRUE, '''안''와 ''밖''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '뒤', FALSE, '다시 생각해 볼까요? ''안''와 ''밖''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''오른쪽''와 뜻이 반대인 말은 무엇일까요?', '오른쪽 ↔ 왼쪽');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '위쪽', FALSE, '다시 생각해 볼까요? ''오른쪽''와 ''왼쪽''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '왼쪽', TRUE, '''오른쪽''와 ''왼쪽''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''오른쪽''와 뜻이 반대인 말은 무엇일까요?', '오른쪽 ↔ 왼쪽');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '왼쪽', TRUE, '''오른쪽''와 ''왼쪽''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '위쪽', FALSE, '다시 생각해 볼까요? ''오른쪽''와 ''왼쪽''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''오른쪽''와 뜻이 반대인 말은 무엇일까요?', '오른쪽 ↔ 왼쪽');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '위쪽', FALSE, '다시 생각해 볼까요? ''오른쪽''와 ''왼쪽''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '왼쪽', TRUE, '''오른쪽''와 ''왼쪽''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''낮''와 뜻이 반대인 말은 무엇일까요?', '낮 ↔ 밤');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '밤', TRUE, '''낮''와 ''밤''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '아침', FALSE, '다시 생각해 볼까요? ''낮''와 ''밤''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''낮''와 뜻이 반대인 말은 무엇일까요?', '낮 ↔ 밤');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '아침', FALSE, '다시 생각해 볼까요? ''낮''와 ''밤''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '밤', TRUE, '''낮''와 ''밤''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''낮''와 뜻이 반대인 말은 무엇일까요?', '낮 ↔ 밤');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '밤', TRUE, '''낮''와 ''밤''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '아침', FALSE, '다시 생각해 볼까요? ''낮''와 ''밤''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''아침''와 뜻이 반대인 말은 무엇일까요?', '아침 ↔ 저녁');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '점심', FALSE, '다시 생각해 볼까요? ''아침''와 ''저녁''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '저녁', TRUE, '''아침''와 ''저녁''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''아침''와 뜻이 반대인 말은 무엇일까요?', '아침 ↔ 저녁');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '저녁', TRUE, '''아침''와 ''저녁''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '점심', FALSE, '다시 생각해 볼까요? ''아침''와 ''저녁''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''아침''와 뜻이 반대인 말은 무엇일까요?', '아침 ↔ 저녁');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '점심', FALSE, '다시 생각해 볼까요? ''아침''와 ''저녁''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '저녁', TRUE, '''아침''와 ''저녁''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''처음''와 뜻이 반대인 말은 무엇일까요?', '처음 ↔ 마지막');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '마지막', TRUE, '''처음''와 ''마지막''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '중간', FALSE, '다시 생각해 볼까요? ''처음''와 ''마지막''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''처음''와 뜻이 반대인 말은 무엇일까요?', '처음 ↔ 마지막');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '중간', FALSE, '다시 생각해 볼까요? ''처음''와 ''마지막''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '마지막', TRUE, '''처음''와 ''마지막''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''처음''와 뜻이 반대인 말은 무엇일까요?', '처음 ↔ 마지막');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '마지막', TRUE, '''처음''와 ''마지막''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '중간', FALSE, '다시 생각해 볼까요? ''처음''와 ''마지막''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''입구''와 뜻이 반대인 말은 무엇일까요?', '입구 ↔ 출구');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '통로', FALSE, '다시 생각해 볼까요? ''입구''와 ''출구''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '출구', TRUE, '''입구''와 ''출구''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''입구''와 뜻이 반대인 말은 무엇일까요?', '입구 ↔ 출구');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '출구', TRUE, '''입구''와 ''출구''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '통로', FALSE, '다시 생각해 볼까요? ''입구''와 ''출구''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''입구''와 뜻이 반대인 말은 무엇일까요?', '입구 ↔ 출구');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '통로', FALSE, '다시 생각해 볼까요? ''입구''와 ''출구''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '출구', TRUE, '''입구''와 ''출구''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''출발''와 뜻이 반대인 말은 무엇일까요?', '출발 ↔ 도착');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '도착', TRUE, '''출발''와 ''도착''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '준비', FALSE, '다시 생각해 볼까요? ''출발''와 ''도착''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''출발''와 뜻이 반대인 말은 무엇일까요?', '출발 ↔ 도착');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '준비', FALSE, '다시 생각해 볼까요? ''출발''와 ''도착''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '도착', TRUE, '''출발''와 ''도착''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''출발''와 뜻이 반대인 말은 무엇일까요?', '출발 ↔ 도착');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '도착', TRUE, '''출발''와 ''도착''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '준비', FALSE, '다시 생각해 볼까요? ''출발''와 ''도착''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''질문''와 뜻이 반대인 말은 무엇일까요?', '질문 ↔ 대답');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '생각', FALSE, '다시 생각해 볼까요? ''질문''와 ''대답''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '대답', TRUE, '''질문''와 ''대답''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''질문''와 뜻이 반대인 말은 무엇일까요?', '질문 ↔ 대답');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '대답', TRUE, '''질문''와 ''대답''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '생각', FALSE, '다시 생각해 볼까요? ''질문''와 ''대답''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''질문''와 뜻이 반대인 말은 무엇일까요?', '질문 ↔ 대답');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '생각', FALSE, '다시 생각해 볼까요? ''질문''와 ''대답''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '대답', TRUE, '''질문''와 ''대답''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''성공''와 뜻이 반대인 말은 무엇일까요?', '성공 ↔ 실패');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '실패', TRUE, '''성공''와 ''실패''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '노력', FALSE, '다시 생각해 볼까요? ''성공''와 ''실패''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''성공''와 뜻이 반대인 말은 무엇일까요?', '성공 ↔ 실패');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '노력', FALSE, '다시 생각해 볼까요? ''성공''와 ''실패''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '실패', TRUE, '''성공''와 ''실패''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''성공''와 뜻이 반대인 말은 무엇일까요?', '성공 ↔ 실패');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '실패', TRUE, '''성공''와 ''실패''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '노력', FALSE, '다시 생각해 볼까요? ''성공''와 ''실패''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''찬성''와 뜻이 반대인 말은 무엇일까요?', '찬성 ↔ 반대');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '관심', FALSE, '다시 생각해 볼까요? ''찬성''와 ''반대''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '반대', TRUE, '''찬성''와 ''반대''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''찬성''와 뜻이 반대인 말은 무엇일까요?', '찬성 ↔ 반대');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '반대', TRUE, '''찬성''와 ''반대''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '관심', FALSE, '다시 생각해 볼까요? ''찬성''와 ''반대''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''찬성''와 뜻이 반대인 말은 무엇일까요?', '찬성 ↔ 반대');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '관심', FALSE, '다시 생각해 볼까요? ''찬성''와 ''반대''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '반대', TRUE, '''찬성''와 ''반대''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''안전''와 뜻이 반대인 말은 무엇일까요?', '안전 ↔ 위험');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '위험', TRUE, '''안전''와 ''위험''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '약속', FALSE, '다시 생각해 볼까요? ''안전''와 ''위험''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''안전''와 뜻이 반대인 말은 무엇일까요?', '안전 ↔ 위험');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '약속', FALSE, '다시 생각해 볼까요? ''안전''와 ''위험''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '위험', TRUE, '''안전''와 ''위험''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''안전''와 뜻이 반대인 말은 무엇일까요?', '안전 ↔ 위험');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '위험', TRUE, '''안전''와 ''위험''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '약속', FALSE, '다시 생각해 볼까요? ''안전''와 ''위험''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''건강하다''와 뜻이 반대인 말은 무엇일까요?', '건강하다 ↔ 아프다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '정직하다', FALSE, '다시 생각해 볼까요? ''건강하다''와 ''아프다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '아프다', TRUE, '''건강하다''와 ''아프다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''건강하다''와 뜻이 반대인 말은 무엇일까요?', '건강하다 ↔ 아프다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '아프다', TRUE, '''건강하다''와 ''아프다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '정직하다', FALSE, '다시 생각해 볼까요? ''건강하다''와 ''아프다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''건강하다''와 뜻이 반대인 말은 무엇일까요?', '건강하다 ↔ 아프다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '정직하다', FALSE, '다시 생각해 볼까요? ''건강하다''와 ''아프다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '아프다', TRUE, '''건강하다''와 ''아프다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''부지런하다''와 뜻이 반대인 말은 무엇일까요?', '부지런하다 ↔ 게으르다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '게으르다', TRUE, '''부지런하다''와 ''게으르다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '고요하다', FALSE, '다시 생각해 볼까요? ''부지런하다''와 ''게으르다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''부지런하다''와 뜻이 반대인 말은 무엇일까요?', '부지런하다 ↔ 게으르다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '고요하다', FALSE, '다시 생각해 볼까요? ''부지런하다''와 ''게으르다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '게으르다', TRUE, '''부지런하다''와 ''게으르다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''부지런하다''와 뜻이 반대인 말은 무엇일까요?', '부지런하다 ↔ 게으르다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '게으르다', TRUE, '''부지런하다''와 ''게으르다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '고요하다', FALSE, '다시 생각해 볼까요? ''부지런하다''와 ''게으르다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''정직하다''와 뜻이 반대인 말은 무엇일까요?', '정직하다 ↔ 거짓되다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '재빠르다', FALSE, '다시 생각해 볼까요? ''정직하다''와 ''거짓되다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '거짓되다', TRUE, '''정직하다''와 ''거짓되다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''정직하다''와 뜻이 반대인 말은 무엇일까요?', '정직하다 ↔ 거짓되다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '거짓되다', TRUE, '''정직하다''와 ''거짓되다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '재빠르다', FALSE, '다시 생각해 볼까요? ''정직하다''와 ''거짓되다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''정직하다''와 뜻이 반대인 말은 무엇일까요?', '정직하다 ↔ 거짓되다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '재빠르다', FALSE, '다시 생각해 볼까요? ''정직하다''와 ''거짓되다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '거짓되다', TRUE, '''정직하다''와 ''거짓되다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''조용하다''와 뜻이 반대인 말은 무엇일까요?', '조용하다 ↔ 시끄럽다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '시끄럽다', TRUE, '''조용하다''와 ''시끄럽다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '부드럽다', FALSE, '다시 생각해 볼까요? ''조용하다''와 ''시끄럽다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''조용하다''와 뜻이 반대인 말은 무엇일까요?', '조용하다 ↔ 시끄럽다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '부드럽다', FALSE, '다시 생각해 볼까요? ''조용하다''와 ''시끄럽다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '시끄럽다', TRUE, '''조용하다''와 ''시끄럽다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''조용하다''와 뜻이 반대인 말은 무엇일까요?', '조용하다 ↔ 시끄럽다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '시끄럽다', TRUE, '''조용하다''와 ''시끄럽다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '부드럽다', FALSE, '다시 생각해 볼까요? ''조용하다''와 ''시끄럽다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''쉽다''와 뜻이 반대인 말은 무엇일까요?', '쉽다 ↔ 어렵다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '둥글다', FALSE, '다시 생각해 볼까요? ''쉽다''와 ''어렵다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '어렵다', TRUE, '''쉽다''와 ''어렵다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''쉽다''와 뜻이 반대인 말은 무엇일까요?', '쉽다 ↔ 어렵다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '어렵다', TRUE, '''쉽다''와 ''어렵다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '둥글다', FALSE, '다시 생각해 볼까요? ''쉽다''와 ''어렵다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''쉽다''와 뜻이 반대인 말은 무엇일까요?', '쉽다 ↔ 어렵다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '둥글다', FALSE, '다시 생각해 볼까요? ''쉽다''와 ''어렵다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '어렵다', TRUE, '''쉽다''와 ''어렵다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''편하다''와 뜻이 반대인 말은 무엇일까요?', '편하다 ↔ 불편하다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '불편하다', TRUE, '''편하다''와 ''불편하다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '달콤하다', FALSE, '다시 생각해 볼까요? ''편하다''와 ''불편하다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''편하다''와 뜻이 반대인 말은 무엇일까요?', '편하다 ↔ 불편하다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '달콤하다', FALSE, '다시 생각해 볼까요? ''편하다''와 ''불편하다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '불편하다', TRUE, '''편하다''와 ''불편하다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''편하다''와 뜻이 반대인 말은 무엇일까요?', '편하다 ↔ 불편하다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '불편하다', TRUE, '''편하다''와 ''불편하다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '달콤하다', FALSE, '다시 생각해 볼까요? ''편하다''와 ''불편하다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''같다''와 뜻이 반대인 말은 무엇일까요?', '같다 ↔ 다르다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '짧다', FALSE, '다시 생각해 볼까요? ''같다''와 ''다르다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '다르다', TRUE, '''같다''와 ''다르다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''같다''와 뜻이 반대인 말은 무엇일까요?', '같다 ↔ 다르다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '다르다', TRUE, '''같다''와 ''다르다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '짧다', FALSE, '다시 생각해 볼까요? ''같다''와 ''다르다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''같다''와 뜻이 반대인 말은 무엇일까요?', '같다 ↔ 다르다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '짧다', FALSE, '다시 생각해 볼까요? ''같다''와 ''다르다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '다르다', TRUE, '''같다''와 ''다르다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''새것''와 뜻이 반대인 말은 무엇일까요?', '새것 ↔ 헌것');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '헌것', TRUE, '''새것''와 ''헌것''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '물건', FALSE, '다시 생각해 볼까요? ''새것''와 ''헌것''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''새것''와 뜻이 반대인 말은 무엇일까요?', '새것 ↔ 헌것');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '물건', FALSE, '다시 생각해 볼까요? ''새것''와 ''헌것''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '헌것', TRUE, '''새것''와 ''헌것''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''새것''와 뜻이 반대인 말은 무엇일까요?', '새것 ↔ 헌것');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '헌것', TRUE, '''새것''와 ''헌것''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '물건', FALSE, '다시 생각해 볼까요? ''새것''와 ''헌것''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''젊다''와 뜻이 반대인 말은 무엇일까요?', '젊다 ↔ 늙다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '맑다', FALSE, '다시 생각해 볼까요? ''젊다''와 ''늙다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '늙다', TRUE, '''젊다''와 ''늙다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''젊다''와 뜻이 반대인 말은 무엇일까요?', '젊다 ↔ 늙다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '늙다', TRUE, '''젊다''와 ''늙다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '맑다', FALSE, '다시 생각해 볼까요? ''젊다''와 ''늙다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''젊다''와 뜻이 반대인 말은 무엇일까요?', '젊다 ↔ 늙다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '맑다', FALSE, '다시 생각해 볼까요? ''젊다''와 ''늙다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '늙다', TRUE, '''젊다''와 ''늙다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''가득하다''와 뜻이 반대인 말은 무엇일까요?', '가득하다 ↔ 비어 있다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '비어 있다', TRUE, '''가득하다''와 ''비어 있다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '빠르다', FALSE, '다시 생각해 볼까요? ''가득하다''와 ''비어 있다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''가득하다''와 뜻이 반대인 말은 무엇일까요?', '가득하다 ↔ 비어 있다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '빠르다', FALSE, '다시 생각해 볼까요? ''가득하다''와 ''비어 있다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '비어 있다', TRUE, '''가득하다''와 ''비어 있다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''가득하다''와 뜻이 반대인 말은 무엇일까요?', '가득하다 ↔ 비어 있다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '비어 있다', TRUE, '''가득하다''와 ''비어 있다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '빠르다', FALSE, '다시 생각해 볼까요? ''가득하다''와 ''비어 있다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''맞다''와 뜻이 반대인 말은 무엇일까요?', '맞다 ↔ 틀리다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '앉다', FALSE, '다시 생각해 볼까요? ''맞다''와 ''틀리다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '틀리다', TRUE, '''맞다''와 ''틀리다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''맞다''와 뜻이 반대인 말은 무엇일까요?', '맞다 ↔ 틀리다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '틀리다', TRUE, '''맞다''와 ''틀리다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '앉다', FALSE, '다시 생각해 볼까요? ''맞다''와 ''틀리다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''맞다''와 뜻이 반대인 말은 무엇일까요?', '맞다 ↔ 틀리다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '앉다', FALSE, '다시 생각해 볼까요? ''맞다''와 ''틀리다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '틀리다', TRUE, '''맞다''와 ''틀리다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''있다''와 뜻이 반대인 말은 무엇일까요?', '있다 ↔ 없다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '없다', TRUE, '''있다''와 ''없다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '듣다', FALSE, '다시 생각해 볼까요? ''있다''와 ''없다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''있다''와 뜻이 반대인 말은 무엇일까요?', '있다 ↔ 없다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '듣다', FALSE, '다시 생각해 볼까요? ''있다''와 ''없다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '없다', TRUE, '''있다''와 ''없다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''있다''와 뜻이 반대인 말은 무엇일까요?', '있다 ↔ 없다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '없다', TRUE, '''있다''와 ''없다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '듣다', FALSE, '다시 생각해 볼까요? ''있다''와 ''없다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''가능하다''와 뜻이 반대인 말은 무엇일까요?', '가능하다 ↔ 불가능하다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '비슷하다', FALSE, '다시 생각해 볼까요? ''가능하다''와 ''불가능하다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '불가능하다', TRUE, '''가능하다''와 ''불가능하다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''가능하다''와 뜻이 반대인 말은 무엇일까요?', '가능하다 ↔ 불가능하다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '불가능하다', TRUE, '''가능하다''와 ''불가능하다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '비슷하다', FALSE, '다시 생각해 볼까요? ''가능하다''와 ''불가능하다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''가능하다''와 뜻이 반대인 말은 무엇일까요?', '가능하다 ↔ 불가능하다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '비슷하다', FALSE, '다시 생각해 볼까요? ''가능하다''와 ''불가능하다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '불가능하다', TRUE, '''가능하다''와 ''불가능하다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''필요하다''와 뜻이 반대인 말은 무엇일까요?', '필요하다 ↔ 불필요하다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '불필요하다', TRUE, '''필요하다''와 ''불필요하다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '높다', FALSE, '다시 생각해 볼까요? ''필요하다''와 ''불필요하다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''필요하다''와 뜻이 반대인 말은 무엇일까요?', '필요하다 ↔ 불필요하다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '높다', FALSE, '다시 생각해 볼까요? ''필요하다''와 ''불필요하다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '불필요하다', TRUE, '''필요하다''와 ''불필요하다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''필요하다''와 뜻이 반대인 말은 무엇일까요?', '필요하다 ↔ 불필요하다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '불필요하다', TRUE, '''필요하다''와 ''불필요하다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '높다', FALSE, '다시 생각해 볼까요? ''필요하다''와 ''불필요하다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''충분하다''와 뜻이 반대인 말은 무엇일까요?', '충분하다 ↔ 부족하다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '튼튼하다', FALSE, '다시 생각해 볼까요? ''충분하다''와 ''부족하다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '부족하다', TRUE, '''충분하다''와 ''부족하다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''충분하다''와 뜻이 반대인 말은 무엇일까요?', '충분하다 ↔ 부족하다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '부족하다', TRUE, '''충분하다''와 ''부족하다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '튼튼하다', FALSE, '다시 생각해 볼까요? ''충분하다''와 ''부족하다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''충분하다''와 뜻이 반대인 말은 무엇일까요?', '충분하다 ↔ 부족하다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '튼튼하다', FALSE, '다시 생각해 볼까요? ''충분하다''와 ''부족하다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '부족하다', TRUE, '''충분하다''와 ''부족하다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''기억하다''와 뜻이 반대인 말은 무엇일까요?', '기억하다 ↔ 잊다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '잊다', TRUE, '''기억하다''와 ''잊다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '걷다', FALSE, '다시 생각해 볼까요? ''기억하다''와 ''잊다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''기억하다''와 뜻이 반대인 말은 무엇일까요?', '기억하다 ↔ 잊다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '걷다', FALSE, '다시 생각해 볼까요? ''기억하다''와 ''잊다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '잊다', TRUE, '''기억하다''와 ''잊다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''기억하다''와 뜻이 반대인 말은 무엇일까요?', '기억하다 ↔ 잊다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '잊다', TRUE, '''기억하다''와 ''잊다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '걷다', FALSE, '다시 생각해 볼까요? ''기억하다''와 ''잊다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''모으다''와 뜻이 반대인 말은 무엇일까요?', '모으다 ↔ 흩어 놓다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '읽다', FALSE, '다시 생각해 볼까요? ''모으다''와 ''흩어 놓다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '흩어 놓다', TRUE, '''모으다''와 ''흩어 놓다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''모으다''와 뜻이 반대인 말은 무엇일까요?', '모으다 ↔ 흩어 놓다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '흩어 놓다', TRUE, '''모으다''와 ''흩어 놓다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '읽다', FALSE, '다시 생각해 볼까요? ''모으다''와 ''흩어 놓다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''모으다''와 뜻이 반대인 말은 무엇일까요?', '모으다 ↔ 흩어 놓다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '읽다', FALSE, '다시 생각해 볼까요? ''모으다''와 ''흩어 놓다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '흩어 놓다', TRUE, '''모으다''와 ''흩어 놓다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''넣다''와 뜻이 반대인 말은 무엇일까요?', '넣다 ↔ 빼다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '빼다', TRUE, '''넣다''와 ''빼다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '웃다', FALSE, '다시 생각해 볼까요? ''넣다''와 ''빼다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''넣다''와 뜻이 반대인 말은 무엇일까요?', '넣다 ↔ 빼다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '웃다', FALSE, '다시 생각해 볼까요? ''넣다''와 ''빼다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '빼다', TRUE, '''넣다''와 ''빼다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''넣다''와 뜻이 반대인 말은 무엇일까요?', '넣다 ↔ 빼다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '빼다', TRUE, '''넣다''와 ''빼다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '웃다', FALSE, '다시 생각해 볼까요? ''넣다''와 ''빼다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''올리다''와 뜻이 반대인 말은 무엇일까요?', '올리다 ↔ 내리다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '보다', FALSE, '다시 생각해 볼까요? ''올리다''와 ''내리다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '내리다', TRUE, '''올리다''와 ''내리다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''올리다''와 뜻이 반대인 말은 무엇일까요?', '올리다 ↔ 내리다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '내리다', TRUE, '''올리다''와 ''내리다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '보다', FALSE, '다시 생각해 볼까요? ''올리다''와 ''내리다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''올리다''와 뜻이 반대인 말은 무엇일까요?', '올리다 ↔ 내리다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '보다', FALSE, '다시 생각해 볼까요? ''올리다''와 ''내리다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '내리다', TRUE, '''올리다''와 ''내리다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''밀다''와 뜻이 반대인 말은 무엇일까요?', '밀다 ↔ 당기다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '당기다', TRUE, '''밀다''와 ''당기다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '적다', FALSE, '다시 생각해 볼까요? ''밀다''와 ''당기다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''밀다''와 뜻이 반대인 말은 무엇일까요?', '밀다 ↔ 당기다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '적다', FALSE, '다시 생각해 볼까요? ''밀다''와 ''당기다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '당기다', TRUE, '''밀다''와 ''당기다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''밀다''와 뜻이 반대인 말은 무엇일까요?', '밀다 ↔ 당기다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '당기다', TRUE, '''밀다''와 ''당기다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '적다', FALSE, '다시 생각해 볼까요? ''밀다''와 ''당기다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''붙이다''와 뜻이 반대인 말은 무엇일까요?', '붙이다 ↔ 떼다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '걷다', FALSE, '다시 생각해 볼까요? ''붙이다''와 ''떼다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '떼다', TRUE, '''붙이다''와 ''떼다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''붙이다''와 뜻이 반대인 말은 무엇일까요?', '붙이다 ↔ 떼다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '떼다', TRUE, '''붙이다''와 ''떼다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '걷다', FALSE, '다시 생각해 볼까요? ''붙이다''와 ''떼다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''붙이다''와 뜻이 반대인 말은 무엇일까요?', '붙이다 ↔ 떼다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '걷다', FALSE, '다시 생각해 볼까요? ''붙이다''와 ''떼다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '떼다', TRUE, '''붙이다''와 ''떼다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''켜다''와 뜻이 반대인 말은 무엇일까요?', '켜다 ↔ 끄다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '끄다', TRUE, '''켜다''와 ''끄다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '씻다', FALSE, '다시 생각해 볼까요? ''켜다''와 ''끄다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''켜다''와 뜻이 반대인 말은 무엇일까요?', '켜다 ↔ 끄다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '씻다', FALSE, '다시 생각해 볼까요? ''켜다''와 ''끄다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '끄다', TRUE, '''켜다''와 ''끄다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''켜다''와 뜻이 반대인 말은 무엇일까요?', '켜다 ↔ 끄다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '끄다', TRUE, '''켜다''와 ''끄다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '씻다', FALSE, '다시 생각해 볼까요? ''켜다''와 ''끄다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''묶다''와 뜻이 반대인 말은 무엇일까요?', '묶다 ↔ 풀다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '찾다', FALSE, '다시 생각해 볼까요? ''묶다''와 ''풀다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '풀다', TRUE, '''묶다''와 ''풀다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''묶다''와 뜻이 반대인 말은 무엇일까요?', '묶다 ↔ 풀다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '풀다', TRUE, '''묶다''와 ''풀다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '찾다', FALSE, '다시 생각해 볼까요? ''묶다''와 ''풀다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''묶다''와 뜻이 반대인 말은 무엇일까요?', '묶다 ↔ 풀다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '찾다', FALSE, '다시 생각해 볼까요? ''묶다''와 ''풀다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '풀다', TRUE, '''묶다''와 ''풀다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''앉다''와 뜻이 반대인 말은 무엇일까요?', '앉다 ↔ 서다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '서다', TRUE, '''앉다''와 ''서다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '읽다', FALSE, '다시 생각해 볼까요? ''앉다''와 ''서다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''앉다''와 뜻이 반대인 말은 무엇일까요?', '앉다 ↔ 서다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '읽다', FALSE, '다시 생각해 볼까요? ''앉다''와 ''서다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '서다', TRUE, '''앉다''와 ''서다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''앉다''와 뜻이 반대인 말은 무엇일까요?', '앉다 ↔ 서다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '서다', TRUE, '''앉다''와 ''서다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '읽다', FALSE, '다시 생각해 볼까요? ''앉다''와 ''서다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''가다''와 뜻이 반대인 말은 무엇일까요?', '가다 ↔ 오다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '쉬다', FALSE, '다시 생각해 볼까요? ''가다''와 ''오다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '오다', TRUE, '''가다''와 ''오다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''가다''와 뜻이 반대인 말은 무엇일까요?', '가다 ↔ 오다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '오다', TRUE, '''가다''와 ''오다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '쉬다', FALSE, '다시 생각해 볼까요? ''가다''와 ''오다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''가다''와 뜻이 반대인 말은 무엇일까요?', '가다 ↔ 오다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '쉬다', FALSE, '다시 생각해 볼까요? ''가다''와 ''오다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '오다', TRUE, '''가다''와 ''오다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''주다''와 뜻이 반대인 말은 무엇일까요?', '주다 ↔ 받다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '받다', TRUE, '''주다''와 ''받다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '자다', FALSE, '다시 생각해 볼까요? ''주다''와 ''받다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''주다''와 뜻이 반대인 말은 무엇일까요?', '주다 ↔ 받다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '자다', FALSE, '다시 생각해 볼까요? ''주다''와 ''받다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '받다', TRUE, '''주다''와 ''받다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''주다''와 뜻이 반대인 말은 무엇일까요?', '주다 ↔ 받다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '받다', TRUE, '''주다''와 ''받다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '자다', FALSE, '다시 생각해 볼까요? ''주다''와 ''받다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''사다''와 뜻이 반대인 말은 무엇일까요?', '사다 ↔ 팔다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '열다', FALSE, '다시 생각해 볼까요? ''사다''와 ''팔다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '팔다', TRUE, '''사다''와 ''팔다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''사다''와 뜻이 반대인 말은 무엇일까요?', '사다 ↔ 팔다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '팔다', TRUE, '''사다''와 ''팔다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '열다', FALSE, '다시 생각해 볼까요? ''사다''와 ''팔다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''사다''와 뜻이 반대인 말은 무엇일까요?', '사다 ↔ 팔다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '열다', FALSE, '다시 생각해 볼까요? ''사다''와 ''팔다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '팔다', TRUE, '''사다''와 ''팔다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''만나다''와 뜻이 반대인 말은 무엇일까요?', '만나다 ↔ 헤어지다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '헤어지다', TRUE, '''만나다''와 ''헤어지다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '먹다', FALSE, '다시 생각해 볼까요? ''만나다''와 ''헤어지다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''만나다''와 뜻이 반대인 말은 무엇일까요?', '만나다 ↔ 헤어지다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '먹다', FALSE, '다시 생각해 볼까요? ''만나다''와 ''헤어지다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '헤어지다', TRUE, '''만나다''와 ''헤어지다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''만나다''와 뜻이 반대인 말은 무엇일까요?', '만나다 ↔ 헤어지다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '헤어지다', TRUE, '''만나다''와 ''헤어지다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '먹다', FALSE, '다시 생각해 볼까요? ''만나다''와 ''헤어지다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''알다''와 뜻이 반대인 말은 무엇일까요?', '알다 ↔ 모르다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '앉다', FALSE, '다시 생각해 볼까요? ''알다''와 ''모르다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '모르다', TRUE, '''알다''와 ''모르다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''알다''와 뜻이 반대인 말은 무엇일까요?', '알다 ↔ 모르다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '모르다', TRUE, '''알다''와 ''모르다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '앉다', FALSE, '다시 생각해 볼까요? ''알다''와 ''모르다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''알다''와 뜻이 반대인 말은 무엇일까요?', '알다 ↔ 모르다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '앉다', FALSE, '다시 생각해 볼까요? ''알다''와 ''모르다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '모르다', TRUE, '''알다''와 ''모르다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''잠들다''와 뜻이 반대인 말은 무엇일까요?', '잠들다 ↔ 깨어나다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '깨어나다', TRUE, '''잠들다''와 ''깨어나다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '뛰다', FALSE, '다시 생각해 볼까요? ''잠들다''와 ''깨어나다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''잠들다''와 뜻이 반대인 말은 무엇일까요?', '잠들다 ↔ 깨어나다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '뛰다', FALSE, '다시 생각해 볼까요? ''잠들다''와 ''깨어나다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '깨어나다', TRUE, '''잠들다''와 ''깨어나다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''잠들다''와 뜻이 반대인 말은 무엇일까요?', '잠들다 ↔ 깨어나다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '깨어나다', TRUE, '''잠들다''와 ''깨어나다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '뛰다', FALSE, '다시 생각해 볼까요? ''잠들다''와 ''깨어나다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''들어가다''와 뜻이 반대인 말은 무엇일까요?', '들어가다 ↔ 나오다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '배우다', FALSE, '다시 생각해 볼까요? ''들어가다''와 ''나오다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '나오다', TRUE, '''들어가다''와 ''나오다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''들어가다''와 뜻이 반대인 말은 무엇일까요?', '들어가다 ↔ 나오다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '나오다', TRUE, '''들어가다''와 ''나오다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '배우다', FALSE, '다시 생각해 볼까요? ''들어가다''와 ''나오다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''들어가다''와 뜻이 반대인 말은 무엇일까요?', '들어가다 ↔ 나오다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '배우다', FALSE, '다시 생각해 볼까요? ''들어가다''와 ''나오다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '나오다', TRUE, '''들어가다''와 ''나오다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''올라가다''와 뜻이 반대인 말은 무엇일까요?', '올라가다 ↔ 내려가다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '내려가다', TRUE, '''올라가다''와 ''내려가다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '씻다', FALSE, '다시 생각해 볼까요? ''올라가다''와 ''내려가다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''올라가다''와 뜻이 반대인 말은 무엇일까요?', '올라가다 ↔ 내려가다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '씻다', FALSE, '다시 생각해 볼까요? ''올라가다''와 ''내려가다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '내려가다', TRUE, '''올라가다''와 ''내려가다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''올라가다''와 뜻이 반대인 말은 무엇일까요?', '올라가다 ↔ 내려가다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '내려가다', TRUE, '''올라가다''와 ''내려가다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '씻다', FALSE, '다시 생각해 볼까요? ''올라가다''와 ''내려가다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''넓히다''와 뜻이 반대인 말은 무엇일까요?', '넓히다 ↔ 좁히다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '읽다', FALSE, '다시 생각해 볼까요? ''넓히다''와 ''좁히다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '좁히다', TRUE, '''넓히다''와 ''좁히다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''넓히다''와 뜻이 반대인 말은 무엇일까요?', '넓히다 ↔ 좁히다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '좁히다', TRUE, '''넓히다''와 ''좁히다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '읽다', FALSE, '다시 생각해 볼까요? ''넓히다''와 ''좁히다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''넓히다''와 뜻이 반대인 말은 무엇일까요?', '넓히다 ↔ 좁히다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '읽다', FALSE, '다시 생각해 볼까요? ''넓히다''와 ''좁히다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '좁히다', TRUE, '''넓히다''와 ''좁히다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''채우다''와 뜻이 반대인 말은 무엇일까요?', '채우다 ↔ 비우다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '비우다', TRUE, '''채우다''와 ''비우다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '말하다', FALSE, '다시 생각해 볼까요? ''채우다''와 ''비우다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''채우다''와 뜻이 반대인 말은 무엇일까요?', '채우다 ↔ 비우다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '말하다', FALSE, '다시 생각해 볼까요? ''채우다''와 ''비우다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '비우다', TRUE, '''채우다''와 ''비우다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''채우다''와 뜻이 반대인 말은 무엇일까요?', '채우다 ↔ 비우다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '비우다', TRUE, '''채우다''와 ''비우다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '말하다', FALSE, '다시 생각해 볼까요? ''채우다''와 ''비우다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''늘리다''와 뜻이 반대인 말은 무엇일까요?', '늘리다 ↔ 줄이다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '걷다', FALSE, '다시 생각해 볼까요? ''늘리다''와 ''줄이다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '줄이다', TRUE, '''늘리다''와 ''줄이다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''늘리다''와 뜻이 반대인 말은 무엇일까요?', '늘리다 ↔ 줄이다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '줄이다', TRUE, '''늘리다''와 ''줄이다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '걷다', FALSE, '다시 생각해 볼까요? ''늘리다''와 ''줄이다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''늘리다''와 뜻이 반대인 말은 무엇일까요?', '늘리다 ↔ 줄이다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '걷다', FALSE, '다시 생각해 볼까요? ''늘리다''와 ''줄이다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '줄이다', TRUE, '''늘리다''와 ''줄이다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''굳다''와 뜻이 반대인 말은 무엇일까요?', '굳다 ↔ 녹다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '녹다', TRUE, '''굳다''와 ''녹다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '읽다', FALSE, '다시 생각해 볼까요? ''굳다''와 ''녹다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''굳다''와 뜻이 반대인 말은 무엇일까요?', '굳다 ↔ 녹다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '읽다', FALSE, '다시 생각해 볼까요? ''굳다''와 ''녹다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '녹다', TRUE, '''굳다''와 ''녹다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''굳다''와 뜻이 반대인 말은 무엇일까요?', '굳다 ↔ 녹다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '녹다', TRUE, '''굳다''와 ''녹다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '읽다', FALSE, '다시 생각해 볼까요? ''굳다''와 ''녹다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''젖다''와 뜻이 반대인 말은 무엇일까요?', '젖다 ↔ 마르다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '앉다', FALSE, '다시 생각해 볼까요? ''젖다''와 ''마르다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '마르다', TRUE, '''젖다''와 ''마르다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''젖다''와 뜻이 반대인 말은 무엇일까요?', '젖다 ↔ 마르다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '마르다', TRUE, '''젖다''와 ''마르다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '앉다', FALSE, '다시 생각해 볼까요? ''젖다''와 ''마르다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''젖다''와 뜻이 반대인 말은 무엇일까요?', '젖다 ↔ 마르다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '앉다', FALSE, '다시 생각해 볼까요? ''젖다''와 ''마르다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '마르다', TRUE, '''젖다''와 ''마르다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''살다''와 뜻이 반대인 말은 무엇일까요?', '살다 ↔ 죽다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '죽다', TRUE, '''살다''와 ''죽다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '웃다', FALSE, '다시 생각해 볼까요? ''살다''와 ''죽다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''살다''와 뜻이 반대인 말은 무엇일까요?', '살다 ↔ 죽다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '웃다', FALSE, '다시 생각해 볼까요? ''살다''와 ''죽다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '죽다', TRUE, '''살다''와 ''죽다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''살다''와 뜻이 반대인 말은 무엇일까요?', '살다 ↔ 죽다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '죽다', TRUE, '''살다''와 ''죽다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '웃다', FALSE, '다시 생각해 볼까요? ''살다''와 ''죽다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''보이다''와 뜻이 반대인 말은 무엇일까요?', '보이다 ↔ 숨겨지다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '먹다', FALSE, '다시 생각해 볼까요? ''보이다''와 ''숨겨지다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '숨겨지다', TRUE, '''보이다''와 ''숨겨지다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''보이다''와 뜻이 반대인 말은 무엇일까요?', '보이다 ↔ 숨겨지다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '숨겨지다', TRUE, '''보이다''와 ''숨겨지다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '먹다', FALSE, '다시 생각해 볼까요? ''보이다''와 ''숨겨지다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''보이다''와 뜻이 반대인 말은 무엇일까요?', '보이다 ↔ 숨겨지다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '먹다', FALSE, '다시 생각해 볼까요? ''보이다''와 ''숨겨지다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '숨겨지다', TRUE, '''보이다''와 ''숨겨지다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''질서''와 뜻이 반대인 말은 무엇일까요?', '질서 ↔ 무질서');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '무질서', TRUE, '''질서''와 ''무질서''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '놀이', FALSE, '다시 생각해 볼까요? ''질서''와 ''무질서''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''질서''와 뜻이 반대인 말은 무엇일까요?', '질서 ↔ 무질서');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '놀이', FALSE, '다시 생각해 볼까요? ''질서''와 ''무질서''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '무질서', TRUE, '''질서''와 ''무질서''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''질서''와 뜻이 반대인 말은 무엇일까요?', '질서 ↔ 무질서');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '무질서', TRUE, '''질서''와 ''무질서''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '놀이', FALSE, '다시 생각해 볼까요? ''질서''와 ''무질서''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 8, '''친절하다''와 뜻이 반대인 말은 무엇일까요?', '친절하다 ↔ 불친절하다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '튼튼하다', FALSE, '다시 생각해 볼까요? ''친절하다''와 ''불친절하다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '불친절하다', TRUE, '''친절하다''와 ''불친절하다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 9, '''친절하다''와 뜻이 반대인 말은 무엇일까요?', '친절하다 ↔ 불친절하다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '불친절하다', TRUE, '''친절하다''와 ''불친절하다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '튼튼하다', FALSE, '다시 생각해 볼까요? ''친절하다''와 ''불친절하다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (2, 10, '''친절하다''와 뜻이 반대인 말은 무엇일까요?', '친절하다 ↔ 불친절하다');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '튼튼하다', FALSE, '다시 생각해 볼까요? ''친절하다''와 ''불친절하다''는 서로 반대되는 뜻이에요.'),
    (@school_capacity_question_id, 2, '불친절하다', TRUE, '''친절하다''와 ''불친절하다''는 서로 반대되는 뜻이에요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '친구가 떨어뜨린 공책을 주워 줄 때 어떤 말을 할까요?', '네 공책이 떨어져서 주웠어. 여기 있어.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '네 공책이 떨어져서 주웠어. 여기 있어.', TRUE, '주운 물건은 주인을 찾아 돌려줘요.'),
    (@school_capacity_question_id, 2, '이제 내 공책이야.', FALSE, '다시 생각해 볼까요? 주운 물건은 주인을 찾아 돌려줘요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '친구가 떨어뜨린 공책을 주워 줄 때 어떤 말을 할까요?', '네 공책이 떨어져서 주웠어. 여기 있어.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '이제 내 공책이야.', FALSE, '다시 생각해 볼까요? 주운 물건은 주인을 찾아 돌려줘요.'),
    (@school_capacity_question_id, 2, '네 공책이 떨어져서 주웠어. 여기 있어.', TRUE, '주운 물건은 주인을 찾아 돌려줘요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '친구가 떨어뜨린 공책을 주워 줄 때 어떤 말을 할까요?', '네 공책이 떨어져서 주웠어. 여기 있어.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '네 공책이 떨어져서 주웠어. 여기 있어.', TRUE, '주운 물건은 주인을 찾아 돌려줘요.'),
    (@school_capacity_question_id, 2, '이제 내 공책이야.', FALSE, '다시 생각해 볼까요? 주운 물건은 주인을 찾아 돌려줘요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '친구에게 길을 비켜 달라고 부탁할 때 어떤 말을 할까요?', '잠깐 지나가도 될까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '당장 비켜!', FALSE, '다시 생각해 볼까요? 상대가 놀라지 않도록 정중하게 부탁해요.'),
    (@school_capacity_question_id, 2, '잠깐 지나가도 될까?', TRUE, '상대가 놀라지 않도록 정중하게 부탁해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '친구에게 길을 비켜 달라고 부탁할 때 어떤 말을 할까요?', '잠깐 지나가도 될까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '잠깐 지나가도 될까?', TRUE, '상대가 놀라지 않도록 정중하게 부탁해요.'),
    (@school_capacity_question_id, 2, '당장 비켜!', FALSE, '다시 생각해 볼까요? 상대가 놀라지 않도록 정중하게 부탁해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '친구에게 길을 비켜 달라고 부탁할 때 어떤 말을 할까요?', '잠깐 지나가도 될까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '당장 비켜!', FALSE, '다시 생각해 볼까요? 상대가 놀라지 않도록 정중하게 부탁해요.'),
    (@school_capacity_question_id, 2, '잠깐 지나가도 될까?', TRUE, '상대가 놀라지 않도록 정중하게 부탁해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '선생님께 화장실에 가도 되는지 물을 때 어떤 말을 할까요?', '선생님, 화장실에 다녀와도 될까요?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '선생님, 화장실에 다녀와도 될까요?', TRUE, '교실을 나가기 전에는 선생님께 말씀드려요.'),
    (@school_capacity_question_id, 2, '아무 말 없이 나갈래요.', FALSE, '다시 생각해 볼까요? 교실을 나가기 전에는 선생님께 말씀드려요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '선생님께 화장실에 가도 되는지 물을 때 어떤 말을 할까요?', '선생님, 화장실에 다녀와도 될까요?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '아무 말 없이 나갈래요.', FALSE, '다시 생각해 볼까요? 교실을 나가기 전에는 선생님께 말씀드려요.'),
    (@school_capacity_question_id, 2, '선생님, 화장실에 다녀와도 될까요?', TRUE, '교실을 나가기 전에는 선생님께 말씀드려요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '선생님께 화장실에 가도 되는지 물을 때 어떤 말을 할까요?', '선생님, 화장실에 다녀와도 될까요?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '선생님, 화장실에 다녀와도 될까요?', TRUE, '교실을 나가기 전에는 선생님께 말씀드려요.'),
    (@school_capacity_question_id, 2, '아무 말 없이 나갈래요.', FALSE, '다시 생각해 볼까요? 교실을 나가기 전에는 선생님께 말씀드려요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '준비물을 가져오지 못했을 때 선생님께 어떻게 말할까요?', '준비물을 두고 왔어요. 어떻게 하면 좋을까요?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '가져왔다고 말할래요.', FALSE, '다시 생각해 볼까요? 사실대로 말하고 해결 방법을 함께 찾아요.'),
    (@school_capacity_question_id, 2, '준비물을 두고 왔어요. 어떻게 하면 좋을까요?', TRUE, '사실대로 말하고 해결 방법을 함께 찾아요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '준비물을 가져오지 못했을 때 선생님께 어떻게 말할까요?', '준비물을 두고 왔어요. 어떻게 하면 좋을까요?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '준비물을 두고 왔어요. 어떻게 하면 좋을까요?', TRUE, '사실대로 말하고 해결 방법을 함께 찾아요.'),
    (@school_capacity_question_id, 2, '가져왔다고 말할래요.', FALSE, '다시 생각해 볼까요? 사실대로 말하고 해결 방법을 함께 찾아요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '준비물을 가져오지 못했을 때 선생님께 어떻게 말할까요?', '준비물을 두고 왔어요. 어떻게 하면 좋을까요?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '가져왔다고 말할래요.', FALSE, '다시 생각해 볼까요? 사실대로 말하고 해결 방법을 함께 찾아요.'),
    (@school_capacity_question_id, 2, '준비물을 두고 왔어요. 어떻게 하면 좋을까요?', TRUE, '사실대로 말하고 해결 방법을 함께 찾아요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '친구가 놀이 규칙을 설명하는 중에는 어떻게 말할까요?', '끝까지 듣고 궁금한 것을 물어볼게.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '끝까지 듣고 궁금한 것을 물어볼게.', TRUE, '규칙을 이해하려면 상대의 설명을 끝까지 들어요.'),
    (@school_capacity_question_id, 2, '내 말만 들어!', FALSE, '다시 생각해 볼까요? 규칙을 이해하려면 상대의 설명을 끝까지 들어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '친구가 놀이 규칙을 설명하는 중에는 어떻게 말할까요?', '끝까지 듣고 궁금한 것을 물어볼게.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '내 말만 들어!', FALSE, '다시 생각해 볼까요? 규칙을 이해하려면 상대의 설명을 끝까지 들어요.'),
    (@school_capacity_question_id, 2, '끝까지 듣고 궁금한 것을 물어볼게.', TRUE, '규칙을 이해하려면 상대의 설명을 끝까지 들어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '친구가 놀이 규칙을 설명하는 중에는 어떻게 말할까요?', '끝까지 듣고 궁금한 것을 물어볼게.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '끝까지 듣고 궁금한 것을 물어볼게.', TRUE, '규칙을 이해하려면 상대의 설명을 끝까지 들어요.'),
    (@school_capacity_question_id, 2, '내 말만 들어!', FALSE, '다시 생각해 볼까요? 규칙을 이해하려면 상대의 설명을 끝까지 들어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '교실에서 주인을 모르는 필통을 발견하면 어떻게 말할까요?', '이 필통 주인을 찾고 있어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '아무도 안 보니까 가져갈래요.', FALSE, '다시 생각해 볼까요? 주인을 모르는 물건은 선생님과 함께 주인을 찾아요.'),
    (@school_capacity_question_id, 2, '이 필통 주인을 찾고 있어요.', TRUE, '주인을 모르는 물건은 선생님과 함께 주인을 찾아요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '교실에서 주인을 모르는 필통을 발견하면 어떻게 말할까요?', '이 필통 주인을 찾고 있어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '이 필통 주인을 찾고 있어요.', TRUE, '주인을 모르는 물건은 선생님과 함께 주인을 찾아요.'),
    (@school_capacity_question_id, 2, '아무도 안 보니까 가져갈래요.', FALSE, '다시 생각해 볼까요? 주인을 모르는 물건은 선생님과 함께 주인을 찾아요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '교실에서 주인을 모르는 필통을 발견하면 어떻게 말할까요?', '이 필통 주인을 찾고 있어요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '아무도 안 보니까 가져갈래요.', FALSE, '다시 생각해 볼까요? 주인을 모르는 물건은 선생님과 함께 주인을 찾아요.'),
    (@school_capacity_question_id, 2, '이 필통 주인을 찾고 있어요.', TRUE, '주인을 모르는 물건은 선생님과 함께 주인을 찾아요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '친구와 동시에 말을 시작했을 때 어떤 말을 할까요?', '네가 먼저 말해도 괜찮아.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '네가 먼저 말해도 괜찮아.', TRUE, '서로 차례를 정하면 모두의 말을 들을 수 있어요.'),
    (@school_capacity_question_id, 2, '내가 무조건 먼저야!', FALSE, '다시 생각해 볼까요? 서로 차례를 정하면 모두의 말을 들을 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '친구와 동시에 말을 시작했을 때 어떤 말을 할까요?', '네가 먼저 말해도 괜찮아.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '내가 무조건 먼저야!', FALSE, '다시 생각해 볼까요? 서로 차례를 정하면 모두의 말을 들을 수 있어요.'),
    (@school_capacity_question_id, 2, '네가 먼저 말해도 괜찮아.', TRUE, '서로 차례를 정하면 모두의 말을 들을 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '친구와 동시에 말을 시작했을 때 어떤 말을 할까요?', '네가 먼저 말해도 괜찮아.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '네가 먼저 말해도 괜찮아.', TRUE, '서로 차례를 정하면 모두의 말을 들을 수 있어요.'),
    (@school_capacity_question_id, 2, '내가 무조건 먼저야!', FALSE, '다시 생각해 볼까요? 서로 차례를 정하면 모두의 말을 들을 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '친구의 이름을 잘못 불렀다는 것을 알았을 때 어떤 말을 할까요?', '이름을 잘못 불러서 미안해.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '틀려도 상관없어.', FALSE, '다시 생각해 볼까요? 실수를 인정하고 바르게 불러 주는 것이 좋아요.'),
    (@school_capacity_question_id, 2, '이름을 잘못 불러서 미안해.', TRUE, '실수를 인정하고 바르게 불러 주는 것이 좋아요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '친구의 이름을 잘못 불렀다는 것을 알았을 때 어떤 말을 할까요?', '이름을 잘못 불러서 미안해.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '이름을 잘못 불러서 미안해.', TRUE, '실수를 인정하고 바르게 불러 주는 것이 좋아요.'),
    (@school_capacity_question_id, 2, '틀려도 상관없어.', FALSE, '다시 생각해 볼까요? 실수를 인정하고 바르게 불러 주는 것이 좋아요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '친구의 이름을 잘못 불렀다는 것을 알았을 때 어떤 말을 할까요?', '이름을 잘못 불러서 미안해.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '틀려도 상관없어.', FALSE, '다시 생각해 볼까요? 실수를 인정하고 바르게 불러 주는 것이 좋아요.'),
    (@school_capacity_question_id, 2, '이름을 잘못 불러서 미안해.', TRUE, '실수를 인정하고 바르게 불러 주는 것이 좋아요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '친구가 내 이름을 잘못 불렀을 때 어떤 말을 할까요?', '내 이름은 지우야. 이렇게 불러 줄래?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '내 이름은 지우야. 이렇게 불러 줄래?', TRUE, '바른 이름을 차분하게 알려 줄 수 있어요.'),
    (@school_capacity_question_id, 2, '너랑은 말 안 해.', FALSE, '다시 생각해 볼까요? 바른 이름을 차분하게 알려 줄 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '친구가 내 이름을 잘못 불렀을 때 어떤 말을 할까요?', '내 이름은 지우야. 이렇게 불러 줄래?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '너랑은 말 안 해.', FALSE, '다시 생각해 볼까요? 바른 이름을 차분하게 알려 줄 수 있어요.'),
    (@school_capacity_question_id, 2, '내 이름은 지우야. 이렇게 불러 줄래?', TRUE, '바른 이름을 차분하게 알려 줄 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '친구가 내 이름을 잘못 불렀을 때 어떤 말을 할까요?', '내 이름은 지우야. 이렇게 불러 줄래?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '내 이름은 지우야. 이렇게 불러 줄래?', TRUE, '바른 이름을 차분하게 알려 줄 수 있어요.'),
    (@school_capacity_question_id, 2, '너랑은 말 안 해.', FALSE, '다시 생각해 볼까요? 바른 이름을 차분하게 알려 줄 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '친구가 설명을 더 천천히 해 주면 좋겠을 때 어떤 말을 할까요?', '조금 천천히 설명해 줄래?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '설명하지 마!', FALSE, '다시 생각해 볼까요? 원하는 도움을 구체적으로 말하면 이해하기 쉬워요.'),
    (@school_capacity_question_id, 2, '조금 천천히 설명해 줄래?', TRUE, '원하는 도움을 구체적으로 말하면 이해하기 쉬워요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '친구가 설명을 더 천천히 해 주면 좋겠을 때 어떤 말을 할까요?', '조금 천천히 설명해 줄래?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '조금 천천히 설명해 줄래?', TRUE, '원하는 도움을 구체적으로 말하면 이해하기 쉬워요.'),
    (@school_capacity_question_id, 2, '설명하지 마!', FALSE, '다시 생각해 볼까요? 원하는 도움을 구체적으로 말하면 이해하기 쉬워요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '친구가 설명을 더 천천히 해 주면 좋겠을 때 어떤 말을 할까요?', '조금 천천히 설명해 줄래?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '설명하지 마!', FALSE, '다시 생각해 볼까요? 원하는 도움을 구체적으로 말하면 이해하기 쉬워요.'),
    (@school_capacity_question_id, 2, '조금 천천히 설명해 줄래?', TRUE, '원하는 도움을 구체적으로 말하면 이해하기 쉬워요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '놀이하다가 잠깐 쉬고 싶을 때 어떤 말을 할까요?', '나는 잠깐 쉬었다가 다시 할게.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '나는 잠깐 쉬었다가 다시 할게.', TRUE, '함께 놀던 사람에게 쉬겠다는 말을 전해요.'),
    (@school_capacity_question_id, 2, '아무에게도 말하지 않고 사라질래.', FALSE, '다시 생각해 볼까요? 함께 놀던 사람에게 쉬겠다는 말을 전해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '놀이하다가 잠깐 쉬고 싶을 때 어떤 말을 할까요?', '나는 잠깐 쉬었다가 다시 할게.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '아무에게도 말하지 않고 사라질래.', FALSE, '다시 생각해 볼까요? 함께 놀던 사람에게 쉬겠다는 말을 전해요.'),
    (@school_capacity_question_id, 2, '나는 잠깐 쉬었다가 다시 할게.', TRUE, '함께 놀던 사람에게 쉬겠다는 말을 전해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '놀이하다가 잠깐 쉬고 싶을 때 어떤 말을 할까요?', '나는 잠깐 쉬었다가 다시 할게.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '나는 잠깐 쉬었다가 다시 할게.', TRUE, '함께 놀던 사람에게 쉬겠다는 말을 전해요.'),
    (@school_capacity_question_id, 2, '아무에게도 말하지 않고 사라질래.', FALSE, '다시 생각해 볼까요? 함께 놀던 사람에게 쉬겠다는 말을 전해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '공이 친구의 몸에 실수로 닿았을 때 어떤 말을 할까요?', '미안해. 다친 곳은 없어?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '네가 피했어야지.', FALSE, '다시 생각해 볼까요? 실수로 부딪쳤다면 먼저 상태를 살피고 사과해요.'),
    (@school_capacity_question_id, 2, '미안해. 다친 곳은 없어?', TRUE, '실수로 부딪쳤다면 먼저 상태를 살피고 사과해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '공이 친구의 몸에 실수로 닿았을 때 어떤 말을 할까요?', '미안해. 다친 곳은 없어?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '미안해. 다친 곳은 없어?', TRUE, '실수로 부딪쳤다면 먼저 상태를 살피고 사과해요.'),
    (@school_capacity_question_id, 2, '네가 피했어야지.', FALSE, '다시 생각해 볼까요? 실수로 부딪쳤다면 먼저 상태를 살피고 사과해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '공이 친구의 몸에 실수로 닿았을 때 어떤 말을 할까요?', '미안해. 다친 곳은 없어?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '네가 피했어야지.', FALSE, '다시 생각해 볼까요? 실수로 부딪쳤다면 먼저 상태를 살피고 사과해요.'),
    (@school_capacity_question_id, 2, '미안해. 다친 곳은 없어?', TRUE, '실수로 부딪쳤다면 먼저 상태를 살피고 사과해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '친구가 내게 부딪쳐 사과했을 때 어떤 말을 할까요?', '괜찮아. 다음에는 함께 조심하자.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '괜찮아. 다음에는 함께 조심하자.', TRUE, '상태를 확인하고 차분하게 다음 행동을 이야기해요.'),
    (@school_capacity_question_id, 2, '너도 똑같이 밀칠 거야.', FALSE, '다시 생각해 볼까요? 상태를 확인하고 차분하게 다음 행동을 이야기해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '친구가 내게 부딪쳐 사과했을 때 어떤 말을 할까요?', '괜찮아. 다음에는 함께 조심하자.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '너도 똑같이 밀칠 거야.', FALSE, '다시 생각해 볼까요? 상태를 확인하고 차분하게 다음 행동을 이야기해요.'),
    (@school_capacity_question_id, 2, '괜찮아. 다음에는 함께 조심하자.', TRUE, '상태를 확인하고 차분하게 다음 행동을 이야기해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '친구가 내게 부딪쳐 사과했을 때 어떤 말을 할까요?', '괜찮아. 다음에는 함께 조심하자.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '괜찮아. 다음에는 함께 조심하자.', TRUE, '상태를 확인하고 차분하게 다음 행동을 이야기해요.'),
    (@school_capacity_question_id, 2, '너도 똑같이 밀칠 거야.', FALSE, '다시 생각해 볼까요? 상태를 확인하고 차분하게 다음 행동을 이야기해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '모둠 활동에서 역할을 정할 때 어떤 말을 할까요?', '각자 하고 싶은 역할을 말해 보자.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '내가 모든 역할을 정할 거야.', FALSE, '다시 생각해 볼까요? 함께 할 일은 서로의 의견을 듣고 정해요.'),
    (@school_capacity_question_id, 2, '각자 하고 싶은 역할을 말해 보자.', TRUE, '함께 할 일은 서로의 의견을 듣고 정해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '모둠 활동에서 역할을 정할 때 어떤 말을 할까요?', '각자 하고 싶은 역할을 말해 보자.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '각자 하고 싶은 역할을 말해 보자.', TRUE, '함께 할 일은 서로의 의견을 듣고 정해요.'),
    (@school_capacity_question_id, 2, '내가 모든 역할을 정할 거야.', FALSE, '다시 생각해 볼까요? 함께 할 일은 서로의 의견을 듣고 정해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '모둠 활동에서 역할을 정할 때 어떤 말을 할까요?', '각자 하고 싶은 역할을 말해 보자.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '내가 모든 역할을 정할 거야.', FALSE, '다시 생각해 볼까요? 함께 할 일은 서로의 의견을 듣고 정해요.'),
    (@school_capacity_question_id, 2, '각자 하고 싶은 역할을 말해 보자.', TRUE, '함께 할 일은 서로의 의견을 듣고 정해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '모둠 친구의 생각이 내 생각과 다를 때 어떤 말을 할까요?', '왜 그렇게 생각했는지 알려 줄래?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '왜 그렇게 생각했는지 알려 줄래?', TRUE, '이유를 물어보면 서로의 생각을 이해할 수 있어요.'),
    (@school_capacity_question_id, 2, '내 생각만 맞아.', FALSE, '다시 생각해 볼까요? 이유를 물어보면 서로의 생각을 이해할 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '모둠 친구의 생각이 내 생각과 다를 때 어떤 말을 할까요?', '왜 그렇게 생각했는지 알려 줄래?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '내 생각만 맞아.', FALSE, '다시 생각해 볼까요? 이유를 물어보면 서로의 생각을 이해할 수 있어요.'),
    (@school_capacity_question_id, 2, '왜 그렇게 생각했는지 알려 줄래?', TRUE, '이유를 물어보면 서로의 생각을 이해할 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '모둠 친구의 생각이 내 생각과 다를 때 어떤 말을 할까요?', '왜 그렇게 생각했는지 알려 줄래?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '왜 그렇게 생각했는지 알려 줄래?', TRUE, '이유를 물어보면 서로의 생각을 이해할 수 있어요.'),
    (@school_capacity_question_id, 2, '내 생각만 맞아.', FALSE, '다시 생각해 볼까요? 이유를 물어보면 서로의 생각을 이해할 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '모둠 활동에서 맡은 일을 하기 어려울 때 어떤 말을 할까요?', '이 부분이 어려워. 함께 방법을 찾아줄래?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '몰래 다른 사람에게 넘길래.', FALSE, '다시 생각해 볼까요? 어려운 부분을 알리고 도움을 요청해요.'),
    (@school_capacity_question_id, 2, '이 부분이 어려워. 함께 방법을 찾아줄래?', TRUE, '어려운 부분을 알리고 도움을 요청해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '모둠 활동에서 맡은 일을 하기 어려울 때 어떤 말을 할까요?', '이 부분이 어려워. 함께 방법을 찾아줄래?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '이 부분이 어려워. 함께 방법을 찾아줄래?', TRUE, '어려운 부분을 알리고 도움을 요청해요.'),
    (@school_capacity_question_id, 2, '몰래 다른 사람에게 넘길래.', FALSE, '다시 생각해 볼까요? 어려운 부분을 알리고 도움을 요청해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '모둠 활동에서 맡은 일을 하기 어려울 때 어떤 말을 할까요?', '이 부분이 어려워. 함께 방법을 찾아줄래?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '몰래 다른 사람에게 넘길래.', FALSE, '다시 생각해 볼까요? 어려운 부분을 알리고 도움을 요청해요.'),
    (@school_capacity_question_id, 2, '이 부분이 어려워. 함께 방법을 찾아줄래?', TRUE, '어려운 부분을 알리고 도움을 요청해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '친구가 만든 작품을 구경할 때 어떤 말을 할까요?', '이 부분의 색을 잘 골랐네.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '이 부분의 색을 잘 골랐네.', TRUE, '구체적으로 좋은 점을 말하고 작품은 소중히 다뤄요.'),
    (@school_capacity_question_id, 2, '허락 없이 만질래.', FALSE, '다시 생각해 볼까요? 구체적으로 좋은 점을 말하고 작품은 소중히 다뤄요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '친구가 만든 작품을 구경할 때 어떤 말을 할까요?', '이 부분의 색을 잘 골랐네.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '허락 없이 만질래.', FALSE, '다시 생각해 볼까요? 구체적으로 좋은 점을 말하고 작품은 소중히 다뤄요.'),
    (@school_capacity_question_id, 2, '이 부분의 색을 잘 골랐네.', TRUE, '구체적으로 좋은 점을 말하고 작품은 소중히 다뤄요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '친구가 만든 작품을 구경할 때 어떤 말을 할까요?', '이 부분의 색을 잘 골랐네.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '이 부분의 색을 잘 골랐네.', TRUE, '구체적으로 좋은 점을 말하고 작품은 소중히 다뤄요.'),
    (@school_capacity_question_id, 2, '허락 없이 만질래.', FALSE, '다시 생각해 볼까요? 구체적으로 좋은 점을 말하고 작품은 소중히 다뤄요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '친구가 내 작품을 만지고 싶어 할 때 어떤 말을 할까요?', '잘 망가질 수 있으니 눈으로 봐 줄래?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '물어봤으니 소리부터 지를래.', FALSE, '다시 생각해 볼까요? 원하는 행동을 차분하고 분명하게 부탁해요.'),
    (@school_capacity_question_id, 2, '잘 망가질 수 있으니 눈으로 봐 줄래?', TRUE, '원하는 행동을 차분하고 분명하게 부탁해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '친구가 내 작품을 만지고 싶어 할 때 어떤 말을 할까요?', '잘 망가질 수 있으니 눈으로 봐 줄래?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '잘 망가질 수 있으니 눈으로 봐 줄래?', TRUE, '원하는 행동을 차분하고 분명하게 부탁해요.'),
    (@school_capacity_question_id, 2, '물어봤으니 소리부터 지를래.', FALSE, '다시 생각해 볼까요? 원하는 행동을 차분하고 분명하게 부탁해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '친구가 내 작품을 만지고 싶어 할 때 어떤 말을 할까요?', '잘 망가질 수 있으니 눈으로 봐 줄래?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '물어봤으니 소리부터 지를래.', FALSE, '다시 생각해 볼까요? 원하는 행동을 차분하고 분명하게 부탁해요.'),
    (@school_capacity_question_id, 2, '잘 망가질 수 있으니 눈으로 봐 줄래?', TRUE, '원하는 행동을 차분하고 분명하게 부탁해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '수업 중 옆 친구 때문에 칠판이 안 보일 때 어떤 말을 할까요?', '조금만 옆으로 움직여 줄래?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '조금만 옆으로 움직여 줄래?', TRUE, '상대에게 필요한 행동을 말로 부탁해요.'),
    (@school_capacity_question_id, 2, '친구를 밀어낼래.', FALSE, '다시 생각해 볼까요? 상대에게 필요한 행동을 말로 부탁해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '수업 중 옆 친구 때문에 칠판이 안 보일 때 어떤 말을 할까요?', '조금만 옆으로 움직여 줄래?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '친구를 밀어낼래.', FALSE, '다시 생각해 볼까요? 상대에게 필요한 행동을 말로 부탁해요.'),
    (@school_capacity_question_id, 2, '조금만 옆으로 움직여 줄래?', TRUE, '상대에게 필요한 행동을 말로 부탁해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '수업 중 옆 친구 때문에 칠판이 안 보일 때 어떤 말을 할까요?', '조금만 옆으로 움직여 줄래?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '조금만 옆으로 움직여 줄래?', TRUE, '상대에게 필요한 행동을 말로 부탁해요.'),
    (@school_capacity_question_id, 2, '친구를 밀어낼래.', FALSE, '다시 생각해 볼까요? 상대에게 필요한 행동을 말로 부탁해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '복도에서 친구가 뛰려 할 때 어떤 말을 할까요?', '복도에서는 천천히 걷자.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '더 빨리 뛰어!', FALSE, '다시 생각해 볼까요? 복도에서는 서로 부딪치지 않도록 걸어요.'),
    (@school_capacity_question_id, 2, '복도에서는 천천히 걷자.', TRUE, '복도에서는 서로 부딪치지 않도록 걸어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '복도에서 친구가 뛰려 할 때 어떤 말을 할까요?', '복도에서는 천천히 걷자.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '복도에서는 천천히 걷자.', TRUE, '복도에서는 서로 부딪치지 않도록 걸어요.'),
    (@school_capacity_question_id, 2, '더 빨리 뛰어!', FALSE, '다시 생각해 볼까요? 복도에서는 서로 부딪치지 않도록 걸어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '복도에서 친구가 뛰려 할 때 어떤 말을 할까요?', '복도에서는 천천히 걷자.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '더 빨리 뛰어!', FALSE, '다시 생각해 볼까요? 복도에서는 서로 부딪치지 않도록 걸어요.'),
    (@school_capacity_question_id, 2, '복도에서는 천천히 걷자.', TRUE, '복도에서는 서로 부딪치지 않도록 걸어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '급식 줄에서 앞사람을 실수로 밟았을 때 어떤 말을 할까요?', '발을 밟아서 미안해. 괜찮아?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '발을 밟아서 미안해. 괜찮아?', TRUE, '실수한 일을 인정하고 상대의 상태를 살펴요.'),
    (@school_capacity_question_id, 2, '모른 척할래.', FALSE, '다시 생각해 볼까요? 실수한 일을 인정하고 상대의 상태를 살펴요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '급식 줄에서 앞사람을 실수로 밟았을 때 어떤 말을 할까요?', '발을 밟아서 미안해. 괜찮아?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '모른 척할래.', FALSE, '다시 생각해 볼까요? 실수한 일을 인정하고 상대의 상태를 살펴요.'),
    (@school_capacity_question_id, 2, '발을 밟아서 미안해. 괜찮아?', TRUE, '실수한 일을 인정하고 상대의 상태를 살펴요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '급식 줄에서 앞사람을 실수로 밟았을 때 어떤 말을 할까요?', '발을 밟아서 미안해. 괜찮아?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '발을 밟아서 미안해. 괜찮아?', TRUE, '실수한 일을 인정하고 상대의 상태를 살펴요.'),
    (@school_capacity_question_id, 2, '모른 척할래.', FALSE, '다시 생각해 볼까요? 실수한 일을 인정하고 상대의 상태를 살펴요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '급식을 받을 때 먹을 양을 부탁하려면 어떤 말을 할까요?', '저는 조금만 주세요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '주는 사람에게 소리칠래요.', FALSE, '다시 생각해 볼까요? 원하는 양을 공손하게 말씀드려요.'),
    (@school_capacity_question_id, 2, '저는 조금만 주세요.', TRUE, '원하는 양을 공손하게 말씀드려요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '급식을 받을 때 먹을 양을 부탁하려면 어떤 말을 할까요?', '저는 조금만 주세요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '저는 조금만 주세요.', TRUE, '원하는 양을 공손하게 말씀드려요.'),
    (@school_capacity_question_id, 2, '주는 사람에게 소리칠래요.', FALSE, '다시 생각해 볼까요? 원하는 양을 공손하게 말씀드려요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '급식을 받을 때 먹을 양을 부탁하려면 어떤 말을 할까요?', '저는 조금만 주세요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '주는 사람에게 소리칠래요.', FALSE, '다시 생각해 볼까요? 원하는 양을 공손하게 말씀드려요.'),
    (@school_capacity_question_id, 2, '저는 조금만 주세요.', TRUE, '원하는 양을 공손하게 말씀드려요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '음식을 먹다가 친구에게 물을 부탁할 때 어떤 말을 할까요?', '물을 건네줄 수 있을까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '물을 건네줄 수 있을까?', TRUE, '도움이 필요할 때는 정중하게 부탁해요.'),
    (@school_capacity_question_id, 2, '물 당장 줘!', FALSE, '다시 생각해 볼까요? 도움이 필요할 때는 정중하게 부탁해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '음식을 먹다가 친구에게 물을 부탁할 때 어떤 말을 할까요?', '물을 건네줄 수 있을까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '물 당장 줘!', FALSE, '다시 생각해 볼까요? 도움이 필요할 때는 정중하게 부탁해요.'),
    (@school_capacity_question_id, 2, '물을 건네줄 수 있을까?', TRUE, '도움이 필요할 때는 정중하게 부탁해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '음식을 먹다가 친구에게 물을 부탁할 때 어떤 말을 할까요?', '물을 건네줄 수 있을까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '물을 건네줄 수 있을까?', TRUE, '도움이 필요할 때는 정중하게 부탁해요.'),
    (@school_capacity_question_id, 2, '물 당장 줘!', FALSE, '다시 생각해 볼까요? 도움이 필요할 때는 정중하게 부탁해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '급식 시간에 처음 보는 음식이 궁금하면 어떤 말을 할까요?', '이 음식의 이름은 무엇인가요?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '모르는 음식이니 나쁘다고 할래요.', FALSE, '다시 생각해 볼까요? 궁금한 점은 이름이나 재료를 물어볼 수 있어요.'),
    (@school_capacity_question_id, 2, '이 음식의 이름은 무엇인가요?', TRUE, '궁금한 점은 이름이나 재료를 물어볼 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '급식 시간에 처음 보는 음식이 궁금하면 어떤 말을 할까요?', '이 음식의 이름은 무엇인가요?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '이 음식의 이름은 무엇인가요?', TRUE, '궁금한 점은 이름이나 재료를 물어볼 수 있어요.'),
    (@school_capacity_question_id, 2, '모르는 음식이니 나쁘다고 할래요.', FALSE, '다시 생각해 볼까요? 궁금한 점은 이름이나 재료를 물어볼 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '급식 시간에 처음 보는 음식이 궁금하면 어떤 말을 할까요?', '이 음식의 이름은 무엇인가요?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '모르는 음식이니 나쁘다고 할래요.', FALSE, '다시 생각해 볼까요? 궁금한 점은 이름이나 재료를 물어볼 수 있어요.'),
    (@school_capacity_question_id, 2, '이 음식의 이름은 무엇인가요?', TRUE, '궁금한 점은 이름이나 재료를 물어볼 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '도서관에서 찾는 책이 없을 때 어떤 말을 할까요?', '이 책은 어디에서 찾을 수 있나요?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '이 책은 어디에서 찾을 수 있나요?', TRUE, '필요한 책을 찾기 어려우면 담당 선생님께 여쭤봐요.'),
    (@school_capacity_question_id, 2, '책장을 모두 어지럽힐래요.', FALSE, '다시 생각해 볼까요? 필요한 책을 찾기 어려우면 담당 선생님께 여쭤봐요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '도서관에서 찾는 책이 없을 때 어떤 말을 할까요?', '이 책은 어디에서 찾을 수 있나요?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '책장을 모두 어지럽힐래요.', FALSE, '다시 생각해 볼까요? 필요한 책을 찾기 어려우면 담당 선생님께 여쭤봐요.'),
    (@school_capacity_question_id, 2, '이 책은 어디에서 찾을 수 있나요?', TRUE, '필요한 책을 찾기 어려우면 담당 선생님께 여쭤봐요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '도서관에서 찾는 책이 없을 때 어떤 말을 할까요?', '이 책은 어디에서 찾을 수 있나요?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '이 책은 어디에서 찾을 수 있나요?', TRUE, '필요한 책을 찾기 어려우면 담당 선생님께 여쭤봐요.'),
    (@school_capacity_question_id, 2, '책장을 모두 어지럽힐래요.', FALSE, '다시 생각해 볼까요? 필요한 책을 찾기 어려우면 담당 선생님께 여쭤봐요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '빌린 책이 찢어진 것을 발견했을 때 어떤 말을 할까요?', '책이 찢어진 것을 발견했어요. 확인해 주세요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '숨기고 그냥 돌려줄래요.', FALSE, '다시 생각해 볼까요? 책의 상태를 사실대로 알려 함께 확인해요.'),
    (@school_capacity_question_id, 2, '책이 찢어진 것을 발견했어요. 확인해 주세요.', TRUE, '책의 상태를 사실대로 알려 함께 확인해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '빌린 책이 찢어진 것을 발견했을 때 어떤 말을 할까요?', '책이 찢어진 것을 발견했어요. 확인해 주세요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '책이 찢어진 것을 발견했어요. 확인해 주세요.', TRUE, '책의 상태를 사실대로 알려 함께 확인해요.'),
    (@school_capacity_question_id, 2, '숨기고 그냥 돌려줄래요.', FALSE, '다시 생각해 볼까요? 책의 상태를 사실대로 알려 함께 확인해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '빌린 책이 찢어진 것을 발견했을 때 어떤 말을 할까요?', '책이 찢어진 것을 발견했어요. 확인해 주세요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '숨기고 그냥 돌려줄래요.', FALSE, '다시 생각해 볼까요? 책의 상태를 사실대로 알려 함께 확인해요.'),
    (@school_capacity_question_id, 2, '책이 찢어진 것을 발견했어요. 확인해 주세요.', TRUE, '책의 상태를 사실대로 알려 함께 확인해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '친구가 책을 읽는 중 이야기를 하고 싶을 때 어떤 말을 할까요?', '다 읽고 나서 잠깐 이야기할 수 있을까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '다 읽고 나서 잠깐 이야기할 수 있을까?', TRUE, '상대가 하던 일을 존중하며 시간을 물어봐요.'),
    (@school_capacity_question_id, 2, '책을 빼앗을래.', FALSE, '다시 생각해 볼까요? 상대가 하던 일을 존중하며 시간을 물어봐요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '친구가 책을 읽는 중 이야기를 하고 싶을 때 어떤 말을 할까요?', '다 읽고 나서 잠깐 이야기할 수 있을까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '책을 빼앗을래.', FALSE, '다시 생각해 볼까요? 상대가 하던 일을 존중하며 시간을 물어봐요.'),
    (@school_capacity_question_id, 2, '다 읽고 나서 잠깐 이야기할 수 있을까?', TRUE, '상대가 하던 일을 존중하며 시간을 물어봐요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '친구가 책을 읽는 중 이야기를 하고 싶을 때 어떤 말을 할까요?', '다 읽고 나서 잠깐 이야기할 수 있을까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '다 읽고 나서 잠깐 이야기할 수 있을까?', TRUE, '상대가 하던 일을 존중하며 시간을 물어봐요.'),
    (@school_capacity_question_id, 2, '책을 빼앗을래.', FALSE, '다시 생각해 볼까요? 상대가 하던 일을 존중하며 시간을 물어봐요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '함께 쓰는 색연필을 더 사용하고 싶을 때 어떤 말을 할까요?', '조금만 더 쓰고 바로 돌려줘도 될까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '내가 계속 갖고 있을래.', FALSE, '다시 생각해 볼까요? 공동 물건을 더 쓸 때는 다른 사람에게 양해를 구해요.'),
    (@school_capacity_question_id, 2, '조금만 더 쓰고 바로 돌려줘도 될까?', TRUE, '공동 물건을 더 쓸 때는 다른 사람에게 양해를 구해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '함께 쓰는 색연필을 더 사용하고 싶을 때 어떤 말을 할까요?', '조금만 더 쓰고 바로 돌려줘도 될까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '조금만 더 쓰고 바로 돌려줘도 될까?', TRUE, '공동 물건을 더 쓸 때는 다른 사람에게 양해를 구해요.'),
    (@school_capacity_question_id, 2, '내가 계속 갖고 있을래.', FALSE, '다시 생각해 볼까요? 공동 물건을 더 쓸 때는 다른 사람에게 양해를 구해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '함께 쓰는 색연필을 더 사용하고 싶을 때 어떤 말을 할까요?', '조금만 더 쓰고 바로 돌려줘도 될까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '내가 계속 갖고 있을래.', FALSE, '다시 생각해 볼까요? 공동 물건을 더 쓸 때는 다른 사람에게 양해를 구해요.'),
    (@school_capacity_question_id, 2, '조금만 더 쓰고 바로 돌려줘도 될까?', TRUE, '공동 물건을 더 쓸 때는 다른 사람에게 양해를 구해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '친구가 쓰던 가위를 빌리고 싶을 때 어떤 말을 할까요?', '다 쓰면 나도 빌려줄 수 있을까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '다 쓰면 나도 빌려줄 수 있을까?', TRUE, '사용 중인 물건은 기다린 뒤 허락을 받아요.'),
    (@school_capacity_question_id, 2, '말없이 손에서 가져갈래.', FALSE, '다시 생각해 볼까요? 사용 중인 물건은 기다린 뒤 허락을 받아요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '친구가 쓰던 가위를 빌리고 싶을 때 어떤 말을 할까요?', '다 쓰면 나도 빌려줄 수 있을까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '말없이 손에서 가져갈래.', FALSE, '다시 생각해 볼까요? 사용 중인 물건은 기다린 뒤 허락을 받아요.'),
    (@school_capacity_question_id, 2, '다 쓰면 나도 빌려줄 수 있을까?', TRUE, '사용 중인 물건은 기다린 뒤 허락을 받아요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '친구가 쓰던 가위를 빌리고 싶을 때 어떤 말을 할까요?', '다 쓰면 나도 빌려줄 수 있을까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '다 쓰면 나도 빌려줄 수 있을까?', TRUE, '사용 중인 물건은 기다린 뒤 허락을 받아요.'),
    (@school_capacity_question_id, 2, '말없이 손에서 가져갈래.', FALSE, '다시 생각해 볼까요? 사용 중인 물건은 기다린 뒤 허락을 받아요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '학교에서 몸이 아플 때 어떻게 말할까요?', '선생님, 배가 아파요. 도와주세요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '아픈 것을 숨기고 혼자 나갈래요.', FALSE, '다시 생각해 볼까요? 몸이 아프면 믿을 수 있는 어른에게 구체적으로 알려요.'),
    (@school_capacity_question_id, 2, '선생님, 배가 아파요. 도와주세요.', TRUE, '몸이 아프면 믿을 수 있는 어른에게 구체적으로 알려요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '학교에서 몸이 아플 때 어떻게 말할까요?', '선생님, 배가 아파요. 도와주세요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '선생님, 배가 아파요. 도와주세요.', TRUE, '몸이 아프면 믿을 수 있는 어른에게 구체적으로 알려요.'),
    (@school_capacity_question_id, 2, '아픈 것을 숨기고 혼자 나갈래요.', FALSE, '다시 생각해 볼까요? 몸이 아프면 믿을 수 있는 어른에게 구체적으로 알려요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '학교에서 몸이 아플 때 어떻게 말할까요?', '선생님, 배가 아파요. 도와주세요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '아픈 것을 숨기고 혼자 나갈래요.', FALSE, '다시 생각해 볼까요? 몸이 아프면 믿을 수 있는 어른에게 구체적으로 알려요.'),
    (@school_capacity_question_id, 2, '선생님, 배가 아파요. 도와주세요.', TRUE, '몸이 아프면 믿을 수 있는 어른에게 구체적으로 알려요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '체육 시간에 운동 방법을 모르겠을 때 어떤 말을 할까요?', '동작을 한 번 더 보여 주실 수 있나요?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '동작을 한 번 더 보여 주실 수 있나요?', TRUE, '운동 방법이 불확실하면 먼저 설명을 요청해요.'),
    (@school_capacity_question_id, 2, '모르지만 위험하게 따라 할래요.', FALSE, '다시 생각해 볼까요? 운동 방법이 불확실하면 먼저 설명을 요청해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '체육 시간에 운동 방법을 모르겠을 때 어떤 말을 할까요?', '동작을 한 번 더 보여 주실 수 있나요?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '모르지만 위험하게 따라 할래요.', FALSE, '다시 생각해 볼까요? 운동 방법이 불확실하면 먼저 설명을 요청해요.'),
    (@school_capacity_question_id, 2, '동작을 한 번 더 보여 주실 수 있나요?', TRUE, '운동 방법이 불확실하면 먼저 설명을 요청해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '체육 시간에 운동 방법을 모르겠을 때 어떤 말을 할까요?', '동작을 한 번 더 보여 주실 수 있나요?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '동작을 한 번 더 보여 주실 수 있나요?', TRUE, '운동 방법이 불확실하면 먼저 설명을 요청해요.'),
    (@school_capacity_question_id, 2, '모르지만 위험하게 따라 할래요.', FALSE, '다시 생각해 볼까요? 운동 방법이 불확실하면 먼저 설명을 요청해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '팀 경기에서 졌을 때 친구에게 어떤 말을 할까요?', '우리 함께 열심히 했어. 다음에 또 해 보자.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '너 때문에 졌어!', FALSE, '다시 생각해 볼까요? 결과만으로 친구를 탓하지 않고 함께한 노력을 인정해요.'),
    (@school_capacity_question_id, 2, '우리 함께 열심히 했어. 다음에 또 해 보자.', TRUE, '결과만으로 친구를 탓하지 않고 함께한 노력을 인정해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '팀 경기에서 졌을 때 친구에게 어떤 말을 할까요?', '우리 함께 열심히 했어. 다음에 또 해 보자.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '우리 함께 열심히 했어. 다음에 또 해 보자.', TRUE, '결과만으로 친구를 탓하지 않고 함께한 노력을 인정해요.'),
    (@school_capacity_question_id, 2, '너 때문에 졌어!', FALSE, '다시 생각해 볼까요? 결과만으로 친구를 탓하지 않고 함께한 노력을 인정해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '팀 경기에서 졌을 때 친구에게 어떤 말을 할까요?', '우리 함께 열심히 했어. 다음에 또 해 보자.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '너 때문에 졌어!', FALSE, '다시 생각해 볼까요? 결과만으로 친구를 탓하지 않고 함께한 노력을 인정해요.'),
    (@school_capacity_question_id, 2, '우리 함께 열심히 했어. 다음에 또 해 보자.', TRUE, '결과만으로 친구를 탓하지 않고 함께한 노력을 인정해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '팀 경기에서 이겼을 때 상대 팀에게 어떤 말을 할까요?', '함께 경기해서 즐거웠어.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '함께 경기해서 즐거웠어.', TRUE, '경기 결과와 관계없이 상대를 존중해요.'),
    (@school_capacity_question_id, 2, '우리가 이겼으니 너희를 놀릴 거야.', FALSE, '다시 생각해 볼까요? 경기 결과와 관계없이 상대를 존중해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '팀 경기에서 이겼을 때 상대 팀에게 어떤 말을 할까요?', '함께 경기해서 즐거웠어.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '우리가 이겼으니 너희를 놀릴 거야.', FALSE, '다시 생각해 볼까요? 경기 결과와 관계없이 상대를 존중해요.'),
    (@school_capacity_question_id, 2, '함께 경기해서 즐거웠어.', TRUE, '경기 결과와 관계없이 상대를 존중해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '팀 경기에서 이겼을 때 상대 팀에게 어떤 말을 할까요?', '함께 경기해서 즐거웠어.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '함께 경기해서 즐거웠어.', TRUE, '경기 결과와 관계없이 상대를 존중해요.'),
    (@school_capacity_question_id, 2, '우리가 이겼으니 너희를 놀릴 거야.', FALSE, '다시 생각해 볼까요? 경기 결과와 관계없이 상대를 존중해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '친구가 어려운 문제에 도전하고 있을 때 어떤 말을 할까요?', '천천히 해 봐. 필요한 것이 있으면 말해 줘.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '너는 못 할 거야.', FALSE, '다시 생각해 볼까요? 도전하는 사람에게는 격려와 필요한 도움을 건네요.'),
    (@school_capacity_question_id, 2, '천천히 해 봐. 필요한 것이 있으면 말해 줘.', TRUE, '도전하는 사람에게는 격려와 필요한 도움을 건네요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '친구가 어려운 문제에 도전하고 있을 때 어떤 말을 할까요?', '천천히 해 봐. 필요한 것이 있으면 말해 줘.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '천천히 해 봐. 필요한 것이 있으면 말해 줘.', TRUE, '도전하는 사람에게는 격려와 필요한 도움을 건네요.'),
    (@school_capacity_question_id, 2, '너는 못 할 거야.', FALSE, '다시 생각해 볼까요? 도전하는 사람에게는 격려와 필요한 도움을 건네요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '친구가 어려운 문제에 도전하고 있을 때 어떤 말을 할까요?', '천천히 해 봐. 필요한 것이 있으면 말해 줘.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '너는 못 할 거야.', FALSE, '다시 생각해 볼까요? 도전하는 사람에게는 격려와 필요한 도움을 건네요.'),
    (@school_capacity_question_id, 2, '천천히 해 봐. 필요한 것이 있으면 말해 줘.', TRUE, '도전하는 사람에게는 격려와 필요한 도움을 건네요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '친구가 혼자 있고 싶다고 할 때 어떤 말을 할까요?', '알겠어. 나중에 이야기하고 싶으면 알려 줘.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '알겠어. 나중에 이야기하고 싶으면 알려 줘.', TRUE, '상대가 원하는 시간을 존중할 수 있어요.'),
    (@school_capacity_question_id, 2, '싫다고 해도 계속 따라갈래.', FALSE, '다시 생각해 볼까요? 상대가 원하는 시간을 존중할 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '친구가 혼자 있고 싶다고 할 때 어떤 말을 할까요?', '알겠어. 나중에 이야기하고 싶으면 알려 줘.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '싫다고 해도 계속 따라갈래.', FALSE, '다시 생각해 볼까요? 상대가 원하는 시간을 존중할 수 있어요.'),
    (@school_capacity_question_id, 2, '알겠어. 나중에 이야기하고 싶으면 알려 줘.', TRUE, '상대가 원하는 시간을 존중할 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '친구가 혼자 있고 싶다고 할 때 어떤 말을 할까요?', '알겠어. 나중에 이야기하고 싶으면 알려 줘.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '알겠어. 나중에 이야기하고 싶으면 알려 줘.', TRUE, '상대가 원하는 시간을 존중할 수 있어요.'),
    (@school_capacity_question_id, 2, '싫다고 해도 계속 따라갈래.', FALSE, '다시 생각해 볼까요? 상대가 원하는 시간을 존중할 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '놀이에 새 친구를 초대하려면 어떤 말을 할까요?', '우리와 같이 놀래?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '우리는 절대 끼워 주지 않아.', FALSE, '다시 생각해 볼까요? 함께할 수 있는지 친근하게 물어봐요.'),
    (@school_capacity_question_id, 2, '우리와 같이 놀래?', TRUE, '함께할 수 있는지 친근하게 물어봐요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '놀이에 새 친구를 초대하려면 어떤 말을 할까요?', '우리와 같이 놀래?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '우리와 같이 놀래?', TRUE, '함께할 수 있는지 친근하게 물어봐요.'),
    (@school_capacity_question_id, 2, '우리는 절대 끼워 주지 않아.', FALSE, '다시 생각해 볼까요? 함께할 수 있는지 친근하게 물어봐요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '놀이에 새 친구를 초대하려면 어떤 말을 할까요?', '우리와 같이 놀래?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '우리는 절대 끼워 주지 않아.', FALSE, '다시 생각해 볼까요? 함께할 수 있는지 친근하게 물어봐요.'),
    (@school_capacity_question_id, 2, '우리와 같이 놀래?', TRUE, '함께할 수 있는지 친근하게 물어봐요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '친구의 제안을 거절해야 할 때 어떤 말을 할까요?', '나는 지금 다른 일을 하고 싶어. 다음에 하자.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '나는 지금 다른 일을 하고 싶어. 다음에 하자.', TRUE, '거절할 때도 자신의 상황을 차분하게 말할 수 있어요.'),
    (@school_capacity_question_id, 2, '네 생각은 다 싫어.', FALSE, '다시 생각해 볼까요? 거절할 때도 자신의 상황을 차분하게 말할 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '친구의 제안을 거절해야 할 때 어떤 말을 할까요?', '나는 지금 다른 일을 하고 싶어. 다음에 하자.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '네 생각은 다 싫어.', FALSE, '다시 생각해 볼까요? 거절할 때도 자신의 상황을 차분하게 말할 수 있어요.'),
    (@school_capacity_question_id, 2, '나는 지금 다른 일을 하고 싶어. 다음에 하자.', TRUE, '거절할 때도 자신의 상황을 차분하게 말할 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '친구의 제안을 거절해야 할 때 어떤 말을 할까요?', '나는 지금 다른 일을 하고 싶어. 다음에 하자.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '나는 지금 다른 일을 하고 싶어. 다음에 하자.', TRUE, '거절할 때도 자신의 상황을 차분하게 말할 수 있어요.'),
    (@school_capacity_question_id, 2, '네 생각은 다 싫어.', FALSE, '다시 생각해 볼까요? 거절할 때도 자신의 상황을 차분하게 말할 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '친구가 원하지 않는 별명을 부르지 말라고 하면 어떤 말을 할까요?', '알겠어. 이제 네 이름으로 부를게.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '싫어해도 계속 부를 거야.', FALSE, '다시 생각해 볼까요? 상대가 싫어하는 호칭은 멈추고 원하는 이름을 불러요.'),
    (@school_capacity_question_id, 2, '알겠어. 이제 네 이름으로 부를게.', TRUE, '상대가 싫어하는 호칭은 멈추고 원하는 이름을 불러요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '친구가 원하지 않는 별명을 부르지 말라고 하면 어떤 말을 할까요?', '알겠어. 이제 네 이름으로 부를게.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '알겠어. 이제 네 이름으로 부를게.', TRUE, '상대가 싫어하는 호칭은 멈추고 원하는 이름을 불러요.'),
    (@school_capacity_question_id, 2, '싫어해도 계속 부를 거야.', FALSE, '다시 생각해 볼까요? 상대가 싫어하는 호칭은 멈추고 원하는 이름을 불러요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '친구가 원하지 않는 별명을 부르지 말라고 하면 어떤 말을 할까요?', '알겠어. 이제 네 이름으로 부를게.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '싫어해도 계속 부를 거야.', FALSE, '다시 생각해 볼까요? 상대가 싫어하는 호칭은 멈추고 원하는 이름을 불러요.'),
    (@school_capacity_question_id, 2, '알겠어. 이제 네 이름으로 부를게.', TRUE, '상대가 싫어하는 호칭은 멈추고 원하는 이름을 불러요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '다른 사람의 사진을 찍기 전에는 어떤 말을 할까요?', '사진을 찍어도 괜찮을까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '사진을 찍어도 괜찮을까?', TRUE, '사진을 찍기 전에는 상대의 허락을 받아요.'),
    (@school_capacity_question_id, 2, '말없이 찍어서 올릴래.', FALSE, '다시 생각해 볼까요? 사진을 찍기 전에는 상대의 허락을 받아요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '다른 사람의 사진을 찍기 전에는 어떤 말을 할까요?', '사진을 찍어도 괜찮을까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '말없이 찍어서 올릴래.', FALSE, '다시 생각해 볼까요? 사진을 찍기 전에는 상대의 허락을 받아요.'),
    (@school_capacity_question_id, 2, '사진을 찍어도 괜찮을까?', TRUE, '사진을 찍기 전에는 상대의 허락을 받아요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '다른 사람의 사진을 찍기 전에는 어떤 말을 할까요?', '사진을 찍어도 괜찮을까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '사진을 찍어도 괜찮을까?', TRUE, '사진을 찍기 전에는 상대의 허락을 받아요.'),
    (@school_capacity_question_id, 2, '말없이 찍어서 올릴래.', FALSE, '다시 생각해 볼까요? 사진을 찍기 전에는 상대의 허락을 받아요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '친구 사진을 다른 사람에게 보내기 전에는 어떤 말을 할까요?', '이 사진을 보내도 괜찮을까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '허락 없이 모두에게 보낼래.', FALSE, '다시 생각해 볼까요? 다른 사람의 사진을 공유할 때도 허락이 필요해요.'),
    (@school_capacity_question_id, 2, '이 사진을 보내도 괜찮을까?', TRUE, '다른 사람의 사진을 공유할 때도 허락이 필요해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '친구 사진을 다른 사람에게 보내기 전에는 어떤 말을 할까요?', '이 사진을 보내도 괜찮을까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '이 사진을 보내도 괜찮을까?', TRUE, '다른 사람의 사진을 공유할 때도 허락이 필요해요.'),
    (@school_capacity_question_id, 2, '허락 없이 모두에게 보낼래.', FALSE, '다시 생각해 볼까요? 다른 사람의 사진을 공유할 때도 허락이 필요해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '친구 사진을 다른 사람에게 보내기 전에는 어떤 말을 할까요?', '이 사진을 보내도 괜찮을까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '허락 없이 모두에게 보낼래.', FALSE, '다시 생각해 볼까요? 다른 사람의 사진을 공유할 때도 허락이 필요해요.'),
    (@school_capacity_question_id, 2, '이 사진을 보내도 괜찮을까?', TRUE, '다른 사람의 사진을 공유할 때도 허락이 필요해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '공동 작품에 실수로 물을 쏟았을 때 어떤 말을 할까요?', '내가 물을 쏟았어. 함께 정리하고 다시 만들어도 될까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '내가 물을 쏟았어. 함께 정리하고 다시 만들어도 될까?', TRUE, '실수를 솔직히 말하고 해결에 참여해요.'),
    (@school_capacity_question_id, 2, '다른 친구 탓이라고 할래.', FALSE, '다시 생각해 볼까요? 실수를 솔직히 말하고 해결에 참여해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '공동 작품에 실수로 물을 쏟았을 때 어떤 말을 할까요?', '내가 물을 쏟았어. 함께 정리하고 다시 만들어도 될까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '다른 친구 탓이라고 할래.', FALSE, '다시 생각해 볼까요? 실수를 솔직히 말하고 해결에 참여해요.'),
    (@school_capacity_question_id, 2, '내가 물을 쏟았어. 함께 정리하고 다시 만들어도 될까?', TRUE, '실수를 솔직히 말하고 해결에 참여해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '공동 작품에 실수로 물을 쏟았을 때 어떤 말을 할까요?', '내가 물을 쏟았어. 함께 정리하고 다시 만들어도 될까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '내가 물을 쏟았어. 함께 정리하고 다시 만들어도 될까?', TRUE, '실수를 솔직히 말하고 해결에 참여해요.'),
    (@school_capacity_question_id, 2, '다른 친구 탓이라고 할래.', FALSE, '다시 생각해 볼까요? 실수를 솔직히 말하고 해결에 참여해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '청소 시간에 역할을 바꾸고 싶을 때 어떤 말을 할까요?', '괜찮다면 오늘 역할을 바꿔도 될까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '다른 사람 일을 말없이 바꿀래.', FALSE, '다시 생각해 볼까요? 역할을 바꾸려면 함께 일하는 사람과 먼저 이야기해요.'),
    (@school_capacity_question_id, 2, '괜찮다면 오늘 역할을 바꿔도 될까?', TRUE, '역할을 바꾸려면 함께 일하는 사람과 먼저 이야기해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '청소 시간에 역할을 바꾸고 싶을 때 어떤 말을 할까요?', '괜찮다면 오늘 역할을 바꿔도 될까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '괜찮다면 오늘 역할을 바꿔도 될까?', TRUE, '역할을 바꾸려면 함께 일하는 사람과 먼저 이야기해요.'),
    (@school_capacity_question_id, 2, '다른 사람 일을 말없이 바꿀래.', FALSE, '다시 생각해 볼까요? 역할을 바꾸려면 함께 일하는 사람과 먼저 이야기해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '청소 시간에 역할을 바꾸고 싶을 때 어떤 말을 할까요?', '괜찮다면 오늘 역할을 바꿔도 될까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '다른 사람 일을 말없이 바꿀래.', FALSE, '다시 생각해 볼까요? 역할을 바꾸려면 함께 일하는 사람과 먼저 이야기해요.'),
    (@school_capacity_question_id, 2, '괜찮다면 오늘 역할을 바꿔도 될까?', TRUE, '역할을 바꾸려면 함께 일하는 사람과 먼저 이야기해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '약속 시간에 늦을 것 같을 때 어떤 말을 할까요?', '조금 늦을 것 같아. 기다리게 해서 미안해.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '조금 늦을 것 같아. 기다리게 해서 미안해.', TRUE, '늦는다는 것을 알게 되면 미리 알려요.'),
    (@school_capacity_question_id, 2, '아무 말 없이 기다리게 할래.', FALSE, '다시 생각해 볼까요? 늦는다는 것을 알게 되면 미리 알려요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '약속 시간에 늦을 것 같을 때 어떤 말을 할까요?', '조금 늦을 것 같아. 기다리게 해서 미안해.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '아무 말 없이 기다리게 할래.', FALSE, '다시 생각해 볼까요? 늦는다는 것을 알게 되면 미리 알려요.'),
    (@school_capacity_question_id, 2, '조금 늦을 것 같아. 기다리게 해서 미안해.', TRUE, '늦는다는 것을 알게 되면 미리 알려요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '약속 시간에 늦을 것 같을 때 어떤 말을 할까요?', '조금 늦을 것 같아. 기다리게 해서 미안해.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '조금 늦을 것 같아. 기다리게 해서 미안해.', TRUE, '늦는다는 것을 알게 되면 미리 알려요.'),
    (@school_capacity_question_id, 2, '아무 말 없이 기다리게 할래.', FALSE, '다시 생각해 볼까요? 늦는다는 것을 알게 되면 미리 알려요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '친구를 기다리다가 먼저 가야 할 때 어떤 말을 할까요?', '나는 먼저 가야 해. 다음에 만나자.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '말하지 않고 화만 낼래.', FALSE, '다시 생각해 볼까요? 자신의 상황을 알리면 상대가 이해하기 쉬워요.'),
    (@school_capacity_question_id, 2, '나는 먼저 가야 해. 다음에 만나자.', TRUE, '자신의 상황을 알리면 상대가 이해하기 쉬워요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '친구를 기다리다가 먼저 가야 할 때 어떤 말을 할까요?', '나는 먼저 가야 해. 다음에 만나자.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '나는 먼저 가야 해. 다음에 만나자.', TRUE, '자신의 상황을 알리면 상대가 이해하기 쉬워요.'),
    (@school_capacity_question_id, 2, '말하지 않고 화만 낼래.', FALSE, '다시 생각해 볼까요? 자신의 상황을 알리면 상대가 이해하기 쉬워요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '친구를 기다리다가 먼저 가야 할 때 어떤 말을 할까요?', '나는 먼저 가야 해. 다음에 만나자.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '말하지 않고 화만 낼래.', FALSE, '다시 생각해 볼까요? 자신의 상황을 알리면 상대가 이해하기 쉬워요.'),
    (@school_capacity_question_id, 2, '나는 먼저 가야 해. 다음에 만나자.', TRUE, '자신의 상황을 알리면 상대가 이해하기 쉬워요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '친구에게 잘못된 정보를 알려 준 것을 알았을 때 어떤 말을 할까요?', '내가 잘못 알려 줬어. 다시 확인해 보자.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '내가 잘못 알려 줬어. 다시 확인해 보자.', TRUE, '잘못된 정보는 인정하고 바르게 확인해요.'),
    (@school_capacity_question_id, 2, '틀려도 계속 맞다고 우길래.', FALSE, '다시 생각해 볼까요? 잘못된 정보는 인정하고 바르게 확인해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '친구에게 잘못된 정보를 알려 준 것을 알았을 때 어떤 말을 할까요?', '내가 잘못 알려 줬어. 다시 확인해 보자.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '틀려도 계속 맞다고 우길래.', FALSE, '다시 생각해 볼까요? 잘못된 정보는 인정하고 바르게 확인해요.'),
    (@school_capacity_question_id, 2, '내가 잘못 알려 줬어. 다시 확인해 보자.', TRUE, '잘못된 정보는 인정하고 바르게 확인해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '친구에게 잘못된 정보를 알려 준 것을 알았을 때 어떤 말을 할까요?', '내가 잘못 알려 줬어. 다시 확인해 보자.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '내가 잘못 알려 줬어. 다시 확인해 보자.', TRUE, '잘못된 정보는 인정하고 바르게 확인해요.'),
    (@school_capacity_question_id, 2, '틀려도 계속 맞다고 우길래.', FALSE, '다시 생각해 볼까요? 잘못된 정보는 인정하고 바르게 확인해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '설명을 들었지만 정확히 이해했는지 확인하려면 어떤 말을 할까요?', '내가 이해한 내용이 맞는지 확인해 줄래?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '이해한 척만 할래.', FALSE, '다시 생각해 볼까요? 이해한 내용을 다시 확인하면 실수를 줄일 수 있어요.'),
    (@school_capacity_question_id, 2, '내가 이해한 내용이 맞는지 확인해 줄래?', TRUE, '이해한 내용을 다시 확인하면 실수를 줄일 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '설명을 들었지만 정확히 이해했는지 확인하려면 어떤 말을 할까요?', '내가 이해한 내용이 맞는지 확인해 줄래?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '내가 이해한 내용이 맞는지 확인해 줄래?', TRUE, '이해한 내용을 다시 확인하면 실수를 줄일 수 있어요.'),
    (@school_capacity_question_id, 2, '이해한 척만 할래.', FALSE, '다시 생각해 볼까요? 이해한 내용을 다시 확인하면 실수를 줄일 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '설명을 들었지만 정확히 이해했는지 확인하려면 어떤 말을 할까요?', '내가 이해한 내용이 맞는지 확인해 줄래?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '이해한 척만 할래.', FALSE, '다시 생각해 볼까요? 이해한 내용을 다시 확인하면 실수를 줄일 수 있어요.'),
    (@school_capacity_question_id, 2, '내가 이해한 내용이 맞는지 확인해 줄래?', TRUE, '이해한 내용을 다시 확인하면 실수를 줄일 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '친구가 내 물건을 빌려 달라고 했지만 빌려주기 어려울 때 어떤 말을 할까요?', '미안해. 지금 내가 써야 해서 빌려주기 어려워.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '미안해. 지금 내가 써야 해서 빌려주기 어려워.', TRUE, '빌려주기 어려운 이유를 정중하게 말할 수 있어요.'),
    (@school_capacity_question_id, 2, '물어본 친구를 비웃을래.', FALSE, '다시 생각해 볼까요? 빌려주기 어려운 이유를 정중하게 말할 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '친구가 내 물건을 빌려 달라고 했지만 빌려주기 어려울 때 어떤 말을 할까요?', '미안해. 지금 내가 써야 해서 빌려주기 어려워.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '물어본 친구를 비웃을래.', FALSE, '다시 생각해 볼까요? 빌려주기 어려운 이유를 정중하게 말할 수 있어요.'),
    (@school_capacity_question_id, 2, '미안해. 지금 내가 써야 해서 빌려주기 어려워.', TRUE, '빌려주기 어려운 이유를 정중하게 말할 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '친구가 내 물건을 빌려 달라고 했지만 빌려주기 어려울 때 어떤 말을 할까요?', '미안해. 지금 내가 써야 해서 빌려주기 어려워.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '미안해. 지금 내가 써야 해서 빌려주기 어려워.', TRUE, '빌려주기 어려운 이유를 정중하게 말할 수 있어요.'),
    (@school_capacity_question_id, 2, '물어본 친구를 비웃을래.', FALSE, '다시 생각해 볼까요? 빌려주기 어려운 이유를 정중하게 말할 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '친구에게 빌린 물건을 잃어버렸을 때 어떤 말을 할까요?', '물건을 잃어버려서 미안해. 함께 해결 방법을 찾자.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '빌린 적 없다고 할래.', FALSE, '다시 생각해 볼까요? 잃어버린 사실을 솔직히 말하고 책임 있게 해결해요.'),
    (@school_capacity_question_id, 2, '물건을 잃어버려서 미안해. 함께 해결 방법을 찾자.', TRUE, '잃어버린 사실을 솔직히 말하고 책임 있게 해결해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '친구에게 빌린 물건을 잃어버렸을 때 어떤 말을 할까요?', '물건을 잃어버려서 미안해. 함께 해결 방법을 찾자.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '물건을 잃어버려서 미안해. 함께 해결 방법을 찾자.', TRUE, '잃어버린 사실을 솔직히 말하고 책임 있게 해결해요.'),
    (@school_capacity_question_id, 2, '빌린 적 없다고 할래.', FALSE, '다시 생각해 볼까요? 잃어버린 사실을 솔직히 말하고 책임 있게 해결해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '친구에게 빌린 물건을 잃어버렸을 때 어떤 말을 할까요?', '물건을 잃어버려서 미안해. 함께 해결 방법을 찾자.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '빌린 적 없다고 할래.', FALSE, '다시 생각해 볼까요? 잃어버린 사실을 솔직히 말하고 책임 있게 해결해요.'),
    (@school_capacity_question_id, 2, '물건을 잃어버려서 미안해. 함께 해결 방법을 찾자.', TRUE, '잃어버린 사실을 솔직히 말하고 책임 있게 해결해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '친구가 틀린 답을 말했다고 생각할 때 어떤 말을 할까요?', '이 부분을 같이 다시 확인해 볼까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '이 부분을 같이 다시 확인해 볼까?', TRUE, '다른 생각이 있어도 상대를 존중하며 확인해요.'),
    (@school_capacity_question_id, 2, '틀렸다고 크게 놀릴래.', FALSE, '다시 생각해 볼까요? 다른 생각이 있어도 상대를 존중하며 확인해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '친구가 틀린 답을 말했다고 생각할 때 어떤 말을 할까요?', '이 부분을 같이 다시 확인해 볼까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '틀렸다고 크게 놀릴래.', FALSE, '다시 생각해 볼까요? 다른 생각이 있어도 상대를 존중하며 확인해요.'),
    (@school_capacity_question_id, 2, '이 부분을 같이 다시 확인해 볼까?', TRUE, '다른 생각이 있어도 상대를 존중하며 확인해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '친구가 틀린 답을 말했다고 생각할 때 어떤 말을 할까요?', '이 부분을 같이 다시 확인해 볼까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '이 부분을 같이 다시 확인해 볼까?', TRUE, '다른 생각이 있어도 상대를 존중하며 확인해요.'),
    (@school_capacity_question_id, 2, '틀렸다고 크게 놀릴래.', FALSE, '다시 생각해 볼까요? 다른 생각이 있어도 상대를 존중하며 확인해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '발표 중에 말을 잊었을 때 어떤 말을 할까요?', '잠깐 생각을 정리하고 이어서 말할게요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '친구에게 화를 낼래요.', FALSE, '다시 생각해 볼까요? 잠시 멈추고 생각을 정리한 뒤 이어갈 수 있어요.'),
    (@school_capacity_question_id, 2, '잠깐 생각을 정리하고 이어서 말할게요.', TRUE, '잠시 멈추고 생각을 정리한 뒤 이어갈 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '발표 중에 말을 잊었을 때 어떤 말을 할까요?', '잠깐 생각을 정리하고 이어서 말할게요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '잠깐 생각을 정리하고 이어서 말할게요.', TRUE, '잠시 멈추고 생각을 정리한 뒤 이어갈 수 있어요.'),
    (@school_capacity_question_id, 2, '친구에게 화를 낼래요.', FALSE, '다시 생각해 볼까요? 잠시 멈추고 생각을 정리한 뒤 이어갈 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '발표 중에 말을 잊었을 때 어떤 말을 할까요?', '잠깐 생각을 정리하고 이어서 말할게요.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '친구에게 화를 낼래요.', FALSE, '다시 생각해 볼까요? 잠시 멈추고 생각을 정리한 뒤 이어갈 수 있어요.'),
    (@school_capacity_question_id, 2, '잠깐 생각을 정리하고 이어서 말할게요.', TRUE, '잠시 멈추고 생각을 정리한 뒤 이어갈 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '발표하는 친구의 목소리가 잘 안 들릴 때 어떤 말을 할까요?', '조금 더 크게 말해 줄 수 있을까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '조금 더 크게 말해 줄 수 있을까?', TRUE, '필요한 도움을 정중하게 요청하면 발표를 듣기 쉬워요.'),
    (@school_capacity_question_id, 2, '내용을 듣지 않고 떠들래.', FALSE, '다시 생각해 볼까요? 필요한 도움을 정중하게 요청하면 발표를 듣기 쉬워요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '발표하는 친구의 목소리가 잘 안 들릴 때 어떤 말을 할까요?', '조금 더 크게 말해 줄 수 있을까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '내용을 듣지 않고 떠들래.', FALSE, '다시 생각해 볼까요? 필요한 도움을 정중하게 요청하면 발표를 듣기 쉬워요.'),
    (@school_capacity_question_id, 2, '조금 더 크게 말해 줄 수 있을까?', TRUE, '필요한 도움을 정중하게 요청하면 발표를 듣기 쉬워요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '발표하는 친구의 목소리가 잘 안 들릴 때 어떤 말을 할까요?', '조금 더 크게 말해 줄 수 있을까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '조금 더 크게 말해 줄 수 있을까?', TRUE, '필요한 도움을 정중하게 요청하면 발표를 듣기 쉬워요.'),
    (@school_capacity_question_id, 2, '내용을 듣지 않고 떠들래.', FALSE, '다시 생각해 볼까요? 필요한 도움을 정중하게 요청하면 발표를 듣기 쉬워요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '친구가 좋은 아이디어를 냈을 때 어떤 말을 할까요?', '그 방법이 좋겠어. 함께 해 보자.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '내 생각인 척할래.', FALSE, '다시 생각해 볼까요? 아이디어를 낸 친구를 인정하고 함께 발전시켜요.'),
    (@school_capacity_question_id, 2, '그 방법이 좋겠어. 함께 해 보자.', TRUE, '아이디어를 낸 친구를 인정하고 함께 발전시켜요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '친구가 좋은 아이디어를 냈을 때 어떤 말을 할까요?', '그 방법이 좋겠어. 함께 해 보자.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '그 방법이 좋겠어. 함께 해 보자.', TRUE, '아이디어를 낸 친구를 인정하고 함께 발전시켜요.'),
    (@school_capacity_question_id, 2, '내 생각인 척할래.', FALSE, '다시 생각해 볼까요? 아이디어를 낸 친구를 인정하고 함께 발전시켜요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '친구가 좋은 아이디어를 냈을 때 어떤 말을 할까요?', '그 방법이 좋겠어. 함께 해 보자.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '내 생각인 척할래.', FALSE, '다시 생각해 볼까요? 아이디어를 낸 친구를 인정하고 함께 발전시켜요.'),
    (@school_capacity_question_id, 2, '그 방법이 좋겠어. 함께 해 보자.', TRUE, '아이디어를 낸 친구를 인정하고 함께 발전시켜요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '새로 전학 온 친구에게 교실을 안내할 때 어떤 말을 할까요?', '필요한 곳이 있으면 내가 알려 줄게.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '필요한 곳이 있으면 내가 알려 줄게.', TRUE, '처음 온 친구가 익숙해지도록 필요한 도움을 건네요.'),
    (@school_capacity_question_id, 2, '혼자 알아서 찾으라고 할래.', FALSE, '다시 생각해 볼까요? 처음 온 친구가 익숙해지도록 필요한 도움을 건네요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '새로 전학 온 친구에게 교실을 안내할 때 어떤 말을 할까요?', '필요한 곳이 있으면 내가 알려 줄게.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '혼자 알아서 찾으라고 할래.', FALSE, '다시 생각해 볼까요? 처음 온 친구가 익숙해지도록 필요한 도움을 건네요.'),
    (@school_capacity_question_id, 2, '필요한 곳이 있으면 내가 알려 줄게.', TRUE, '처음 온 친구가 익숙해지도록 필요한 도움을 건네요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '새로 전학 온 친구에게 교실을 안내할 때 어떤 말을 할까요?', '필요한 곳이 있으면 내가 알려 줄게.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '필요한 곳이 있으면 내가 알려 줄게.', TRUE, '처음 온 친구가 익숙해지도록 필요한 도움을 건네요.'),
    (@school_capacity_question_id, 2, '혼자 알아서 찾으라고 할래.', FALSE, '다시 생각해 볼까요? 처음 온 친구가 익숙해지도록 필요한 도움을 건네요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '친구가 놀이 차례를 헷갈릴 때 어떤 말을 할까요?', '우리 차례를 다시 같이 확인하자.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '무조건 네 차례는 아니야!', FALSE, '다시 생각해 볼까요? 정해진 순서를 함께 확인하면 공정하게 놀 수 있어요.'),
    (@school_capacity_question_id, 2, '우리 차례를 다시 같이 확인하자.', TRUE, '정해진 순서를 함께 확인하면 공정하게 놀 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '친구가 놀이 차례를 헷갈릴 때 어떤 말을 할까요?', '우리 차례를 다시 같이 확인하자.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '우리 차례를 다시 같이 확인하자.', TRUE, '정해진 순서를 함께 확인하면 공정하게 놀 수 있어요.'),
    (@school_capacity_question_id, 2, '무조건 네 차례는 아니야!', FALSE, '다시 생각해 볼까요? 정해진 순서를 함께 확인하면 공정하게 놀 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '친구가 놀이 차례를 헷갈릴 때 어떤 말을 할까요?', '우리 차례를 다시 같이 확인하자.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '무조건 네 차례는 아니야!', FALSE, '다시 생각해 볼까요? 정해진 순서를 함께 확인하면 공정하게 놀 수 있어요.'),
    (@school_capacity_question_id, 2, '우리 차례를 다시 같이 확인하자.', TRUE, '정해진 순서를 함께 확인하면 공정하게 놀 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '쉬는 시간에 교실을 떠나려면 함께 있던 친구에게 어떤 말을 할까요?', '나는 잠깐 도서관에 다녀올게.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '나는 잠깐 도서관에 다녀올게.', TRUE, '함께 있던 사람에게 자신의 이동을 알릴 수 있어요.'),
    (@school_capacity_question_id, 2, '어디 가는지 절대 말 안 할래.', FALSE, '다시 생각해 볼까요? 함께 있던 사람에게 자신의 이동을 알릴 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '쉬는 시간에 교실을 떠나려면 함께 있던 친구에게 어떤 말을 할까요?', '나는 잠깐 도서관에 다녀올게.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '어디 가는지 절대 말 안 할래.', FALSE, '다시 생각해 볼까요? 함께 있던 사람에게 자신의 이동을 알릴 수 있어요.'),
    (@school_capacity_question_id, 2, '나는 잠깐 도서관에 다녀올게.', TRUE, '함께 있던 사람에게 자신의 이동을 알릴 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '쉬는 시간에 교실을 떠나려면 함께 있던 친구에게 어떤 말을 할까요?', '나는 잠깐 도서관에 다녀올게.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '나는 잠깐 도서관에 다녀올게.', TRUE, '함께 있던 사람에게 자신의 이동을 알릴 수 있어요.'),
    (@school_capacity_question_id, 2, '어디 가는지 절대 말 안 할래.', FALSE, '다시 생각해 볼까요? 함께 있던 사람에게 자신의 이동을 알릴 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '선생님의 부탁을 잘 듣지 못했을 때 어떤 말을 할까요?', '죄송하지만 해야 할 일을 다시 말씀해 주실 수 있나요?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '아무 일이나 먼저 해 버릴래요.', FALSE, '다시 생각해 볼까요? 해야 할 일이 불확실하면 다시 확인해요.'),
    (@school_capacity_question_id, 2, '죄송하지만 해야 할 일을 다시 말씀해 주실 수 있나요?', TRUE, '해야 할 일이 불확실하면 다시 확인해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '선생님의 부탁을 잘 듣지 못했을 때 어떤 말을 할까요?', '죄송하지만 해야 할 일을 다시 말씀해 주실 수 있나요?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '죄송하지만 해야 할 일을 다시 말씀해 주실 수 있나요?', TRUE, '해야 할 일이 불확실하면 다시 확인해요.'),
    (@school_capacity_question_id, 2, '아무 일이나 먼저 해 버릴래요.', FALSE, '다시 생각해 볼까요? 해야 할 일이 불확실하면 다시 확인해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '선생님의 부탁을 잘 듣지 못했을 때 어떤 말을 할까요?', '죄송하지만 해야 할 일을 다시 말씀해 주실 수 있나요?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '아무 일이나 먼저 해 버릴래요.', FALSE, '다시 생각해 볼까요? 해야 할 일이 불확실하면 다시 확인해요.'),
    (@school_capacity_question_id, 2, '죄송하지만 해야 할 일을 다시 말씀해 주실 수 있나요?', TRUE, '해야 할 일이 불확실하면 다시 확인해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '친구에게 관심 있는 놀이를 물어볼 때 어떤 말을 할까요?', '너는 어떤 놀이를 좋아해?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '너는 어떤 놀이를 좋아해?', TRUE, '상대의 관심을 물어보면 함께할 놀이를 찾기 쉬워요.'),
    (@school_capacity_question_id, 2, '네가 좋아하는 것은 듣기 싫어.', FALSE, '다시 생각해 볼까요? 상대의 관심을 물어보면 함께할 놀이를 찾기 쉬워요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '친구에게 관심 있는 놀이를 물어볼 때 어떤 말을 할까요?', '너는 어떤 놀이를 좋아해?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '네가 좋아하는 것은 듣기 싫어.', FALSE, '다시 생각해 볼까요? 상대의 관심을 물어보면 함께할 놀이를 찾기 쉬워요.'),
    (@school_capacity_question_id, 2, '너는 어떤 놀이를 좋아해?', TRUE, '상대의 관심을 물어보면 함께할 놀이를 찾기 쉬워요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '친구에게 관심 있는 놀이를 물어볼 때 어떤 말을 할까요?', '너는 어떤 놀이를 좋아해?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '너는 어떤 놀이를 좋아해?', TRUE, '상대의 관심을 물어보면 함께할 놀이를 찾기 쉬워요.'),
    (@school_capacity_question_id, 2, '네가 좋아하는 것은 듣기 싫어.', FALSE, '다시 생각해 볼까요? 상대의 관심을 물어보면 함께할 놀이를 찾기 쉬워요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '시끄러운 곳에서 잠깐 대화 장소를 바꾸고 싶을 때 어떤 말을 할까요?', '조금 조용한 곳에서 이야기해도 될까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '상대에게 더 크게 화낼래.', FALSE, '다시 생각해 볼까요? 대화하기 어려운 이유를 말하고 가능한 방법을 제안해요.'),
    (@school_capacity_question_id, 2, '조금 조용한 곳에서 이야기해도 될까?', TRUE, '대화하기 어려운 이유를 말하고 가능한 방법을 제안해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '시끄러운 곳에서 잠깐 대화 장소를 바꾸고 싶을 때 어떤 말을 할까요?', '조금 조용한 곳에서 이야기해도 될까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '조금 조용한 곳에서 이야기해도 될까?', TRUE, '대화하기 어려운 이유를 말하고 가능한 방법을 제안해요.'),
    (@school_capacity_question_id, 2, '상대에게 더 크게 화낼래.', FALSE, '다시 생각해 볼까요? 대화하기 어려운 이유를 말하고 가능한 방법을 제안해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '시끄러운 곳에서 잠깐 대화 장소를 바꾸고 싶을 때 어떤 말을 할까요?', '조금 조용한 곳에서 이야기해도 될까?');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '상대에게 더 크게 화낼래.', FALSE, '다시 생각해 볼까요? 대화하기 어려운 이유를 말하고 가능한 방법을 제안해요.'),
    (@school_capacity_question_id, 2, '조금 조용한 곳에서 이야기해도 될까?', TRUE, '대화하기 어려운 이유를 말하고 가능한 방법을 제안해요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '친구가 물건을 떨어뜨린 것을 모를 때 어떤 말을 할까요?', '방금 물건이 떨어졌어. 확인해 봐.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '방금 물건이 떨어졌어. 확인해 봐.', TRUE, '상대가 놓친 상황을 알려 주면 도움이 돼요.'),
    (@school_capacity_question_id, 2, '모른 척 숨겨 둘래.', FALSE, '다시 생각해 볼까요? 상대가 놓친 상황을 알려 주면 도움이 돼요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '친구가 물건을 떨어뜨린 것을 모를 때 어떤 말을 할까요?', '방금 물건이 떨어졌어. 확인해 봐.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '모른 척 숨겨 둘래.', FALSE, '다시 생각해 볼까요? 상대가 놓친 상황을 알려 주면 도움이 돼요.'),
    (@school_capacity_question_id, 2, '방금 물건이 떨어졌어. 확인해 봐.', TRUE, '상대가 놓친 상황을 알려 주면 도움이 돼요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '친구가 물건을 떨어뜨린 것을 모를 때 어떤 말을 할까요?', '방금 물건이 떨어졌어. 확인해 봐.');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '방금 물건이 떨어졌어. 확인해 봐.', TRUE, '상대가 놓친 상황을 알려 주면 도움이 돼요.'),
    (@school_capacity_question_id, 2, '모른 척 숨겨 둘래.', FALSE, '다시 생각해 볼까요? 상대가 놓친 상황을 알려 주면 도움이 돼요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 8, '하교할 때 친구에게 어떤 말을 할까요?', '오늘 즐거웠어. 내일 만나!');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '인사를 하면 안 돼.', FALSE, '다시 생각해 볼까요? 헤어질 때 인사를 건네면 반갑게 마무리할 수 있어요.'),
    (@school_capacity_question_id, 2, '오늘 즐거웠어. 내일 만나!', TRUE, '헤어질 때 인사를 건네면 반갑게 마무리할 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 9, '하교할 때 친구에게 어떤 말을 할까요?', '오늘 즐거웠어. 내일 만나!');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '오늘 즐거웠어. 내일 만나!', TRUE, '헤어질 때 인사를 건네면 반갑게 마무리할 수 있어요.'),
    (@school_capacity_question_id, 2, '인사를 하면 안 돼.', FALSE, '다시 생각해 볼까요? 헤어질 때 인사를 건네면 반갑게 마무리할 수 있어요.');

INSERT INTO question (topic_id, target_age, content, correct_answer_text) VALUES
    (3, 10, '하교할 때 친구에게 어떤 말을 할까요?', '오늘 즐거웠어. 내일 만나!');
SET @school_capacity_question_id = LAST_INSERT_ID();
INSERT INTO choice (question_id, choice_order, content, is_correct, feedback) VALUES
    (@school_capacity_question_id, 1, '인사를 하면 안 돼.', FALSE, '다시 생각해 볼까요? 헤어질 때 인사를 건네면 반갑게 마무리할 수 있어요.'),
    (@school_capacity_question_id, 2, '오늘 즐거웠어. 내일 만나!', TRUE, '헤어질 때 인사를 건네면 반갑게 마무리할 수 있어요.');

COMMIT;
