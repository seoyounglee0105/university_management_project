INSERT INTO college_tb (name) VALUES ('공과대학');
INSERT INTO department_tb
(
   name,
   college_id
)
VALUES
(
   '토목과',
   1
);
INSERT INTO department_tb
(
   name,
   college_id
)
VALUES
(
   '산업공학과',
   1
);
INSERT INTO student_tb
(
   id,
   name,
   birth_date,
   gender,
   address,
   tel,
   email,
   dept_id,
   grade,
   semester,
   entrance_date
)
VALUES
(
   2018000001,
   '이서영',
   '2000-01-05',
   'F',
   '부산광역시 수영구',
   '010-1111-1111',
   'b@test.com',
   102,
   1,
   1,
   '2018-03-02'
);
INSERT INTO coll_tuit_tb VALUES
(
   1,
   2173500
);
INSERT INTO scholarship_tb VALUES
(
   1,
   2500000
);
INSERT INTO scholarship_tb VALUES
(
   2,
   1500000
);
INSERT INTO tuition_tb
(
   student_id,
   tui_year,
   semester,
   tui_amount,
   sch_type,
   sch_amount,
   status
)
VALUES
(
   2018000001,
   2018,
   1,
   2173500,
   1,
   2173500,
   1
);
-- 성적조회 샘플 데이터
INSERT INTO student_tb
(
   id,
   name,
   birth_date,
   gender,
   address,
   tel,
   email,
   dept_id,
   grade,
   semester,
   entrance_date
)
VALUES
(
   2018000002,
   '편용림',
   '2000-08-05',
   'M',
   '부산광역시 수영구 광안동',
   '010-4444-2221',
   'a@test.com',
   101,
   1,
   2,
   '2023-04-01'
);
INSERT INTO room_tb
(
   id,
   college_id
)
VALUES
(
   'C201',
   1
),

(
   'C202',
   1
);
INSERT INTO professor_tb
(
   name,
   birth_date,
   gender,
   address,
   tel,
   email,
   dept_id
)
VALUES
(
   '홍길동',
   '1999-01-01',
   'M',
   '서울특별시 북한산',
   '010-1234-5678',
   'b@test.com',
   '101'
),

(
   '장길산',
   '1990-01-01',
   'M',
   '제주도 한라산',
   '010-9999-9999',
   'c@test.com',
   '101'
);
INSERT INTO staff_tb
(
   name,
   birth_date,
   gender,
   address,
   tel,
   email
)
VALUES
(
   '신사임당',
   '1988-01-01',
   'F',
   '경기도 도산서원',
   '010-1233-5673',
   'd@test.com'
),

(
   '장영실',
   '1989-01-01',
   'M',
   '서울특별시 왕십리',
   '010-9999-9939',
   'e@test.com'
);
INSERT INTO user_tb VALUES
(
   2018000001,
   '$2a$10$fXVPmpG.D9iVDC/Clj9MU.Jp.uQDyGu4QflOJydT/ChDT90.rdtUu',
   'student'
),

(
   2018000002,
   '$2a$10$fXVPmpG.D9iVDC/Clj9MU.Jp.uQDyGu4QflOJydT/ChDT90.rdtUu',
   'student'
),

(
   230001,
   '$2a$10$fXVPmpG.D9iVDC/Clj9MU.Jp.uQDyGu4QflOJydT/ChDT90.rdtUu',
   'staff'
),

(
   230002,
   '$2a$10$fXVPmpG.D9iVDC/Clj9MU.Jp.uQDyGu4QflOJydT/ChDT90.rdtUu',
   'staff'
),

(
   23000001,
   '$2a$10$fXVPmpG.D9iVDC/Clj9MU.Jp.uQDyGu4QflOJydT/ChDT90.rdtUu',
   'professor'
),

(
   23000002,
   '$2a$10$fXVPmpG.D9iVDC/Clj9MU.Jp.uQDyGu4QflOJydT/ChDT90.rdtUu',
   'professor'
);
INSERT INTO grade_tb
(
   grade,
   grade_value
)
VALUES
(
   'A+',
   4.5
),

(
   'A',
   4.0
),

(
   'B+',
   3.5
),

(
   'B',
   3.0
),

(
   'C+',
   2.5
),

(
   'C',
   2.0
),

(
   'D+',
   1.5
),

(
   'F',
   0
);

-- F : 0점이고 학기에 취득학점도 없어야 함
INSERT INTO subject_tb
(
   name,
   professor_id,
   room_id,
   dept_id,
   type,
   sub_year,
   semester,
   sub_day,
   start_time,
   end_time,
   grades,
   capacity
)
VALUES
(
   '상하수도공학',
   '23000001',
   'C201',
   101,
   '전공',
   '2023',
   1,
   '월',
   10,
   13,
   3,
   30
),

(
   '응용역학',
   '23000001',
   'C202',
   101,
   '전공',
   '2023',
   1,
   '화',
   10,
   13,
   3,
   30
),

(
   '측량학',
   '23000001',
   'C201',
   101,
   '전공',
   '2023',
   1,
   '월',
   14,
   17,
   3,
   30
),

(
   '수리학',
   '23000001',
   'C202',
   101,
   '전공',
   '2023',
   1,
   '수',
   14,
   17,
   3,
   30
),

(
   '철근콘크리트 및 강구조',
   '23000001',
   'C201',
   101,
   '전공',
   '2023',
   1,
   '화',
   13,
   16,
   3,
   30
),

(
   '토질 및 기초',
   '23000001',
   'C202',
   101,
   '전공',
   '2023',
   1,
   '화',
   10,
   13,
   3,
   30
),

(
   '영어',
   '23000002',
   'C201',
   101,
   '교양',
   '2023',
   1,
   '목',
   14,
   17,
   3,
   30
),

(
   '미술',
   '23000002',
   'C202',
   101,
   '교양',
   '2023',
   1,
   '목',
   10,
   12,
   3,
   30
),

(
   '경영학개론',
   '23000001',
   'C202',
   102,
   '교양',
   '2023',
   1,
   '목',
   14,
   17,
   3,
   30
),

(
   '상하수도공학',
   '23000001',
   'C201',
   101,
   '전공',
   '2023',
   2,
   '수',
   10,
   12,
   3,
   30
),

(
   '응용역학',
   '23000001',
   'C202',
   101,
   '전공',
   '2023',
   2,
   '수',
   14,
   17,
   3,
   30
),

(
   '측량학',
   '23000001',
   'C201',
   101,
   '전공',
   '2023',
   2,
   '수',
   10,
   13,
   3,
   30
),

(
   '수리학',
   '23000001',
   'C202',
   101,
   '전공',
   '2023',
   2,
   '수',
   14,
   17,
   3,
   30
),

(
   '철근콘크리트 및 강구조',
   '23000001',
   'C201',
   101,
   '전공',
   '2023',
   2,
   '목',
   10,
   13,
   3,
   30
),

(
   '영어',
   '23000002',
   'C202',
   101,
   '교양',
   '2023',
   2,
   '목',
   10,
   13,
   3,
   30
),

(
   '토질 및 기초',
   '23000001',
   'C201',
   101,
   '전공',
   '2023',
   2,
   '목',
   14,
   17,
   3,
   30
),

(
   '미술',
   '23000002',
   'C202',
   101,
   '교양',
   '2023',
   2,
   '목',
   14,
   17,
   3,
   30
);
INSERT INTO stu_sub_tb
(
   student_id,
   subject_id,
   grade,
   complete_grade
)
VALUES
(
   2018000002,
   10000,
   'F',
   0   
),

(
   2018000002,
   10001,
   'A+',
   3
),

(
   2018000002,
   10002,
   'B',
   3
),

(
   2018000002,
   10003,
   'B+',
   3
),

(
   2018000002,
   10004,
   'C+',
   3
),

(
   2018000002,
   10005,
   'C',
   3
),

(
   2018000002,
   10006,
   'A',
   3
),

(
   2018000002,
   10007,
   'A+',
   3
),

(
   2018000002,
   10008,
   'A',
   3
),

(
   2018000002,
   10009,
   'A+',
   3
),

(
   2018000002,
   10010,
   'B',
   3
),

(
   2018000002,
   10011,
   'B+',
   3
),

(
   2018000002,
   10012,
   'C+',
   3
),

(
   2018000002,
   10013,
   'C',
   3
),

(
   2018000002,
   10014,
   'A',
   3
),

(
   2018000002,
   10015,
   'A+',
   3
);
INSERT INTO stu_stat_tb VALUES
(
   1,
   2018000001,
   '재학',
   current_date,
   '9999-01-01'
);
INSERT INTO stu_stat_tb VALUES
(
   2,
   2018000002,
   '재학',
   current_date,
   '9999-01-01'
);
INSERT INTO stu_sub_detail_tb
(
   id,
   student_id,
   subject_id
)
VALUES
(
   1,
   2018000002,
   10000
),

(
   2,
   2018000002,
   10001
),

(
   3,
   2018000002,
   10002
),

(
   4,
   2018000002,
   10003
),

(
   5,
   2018000002,
   10004
),

(
   6,
   2018000002,
   10005
),

(
   7,
   2018000002,
   10006
),

(
   8,
   2018000002,
   10007
),

(
   9,
   2018000002,
   10008
),

(
   10,
   2018000002,
   10009
),

(
   11,
   2018000002,
   10010
),

(
   12,
   2018000002,
   10011
),

(
   13,
   2018000002,
   10012
),

(
   14,
   2018000002,
   10013
),

(
   15,
   2018000002,
   10014
),

(
   16,
   2018000002,
   10015
);

INSERT INTO syllabus_tb VALUES
(
   10000,
   '상하수도에 대한 과목',
   '상하수도에 대해 이해하고 실제로 상하수도를 설계할 수 있다.',
   '상하수도공학1 (편용림)',
   '1주차 - 6주차: 상하수도 개론 \r\n7주차 중간시험\r\n 8주차 - 15주차 실습 \r\n16주차 기말시험'
);

-- 질문지 내용 정보

INSERT INTO question_tb(que_1, que_2, que_3, que_4, que_5, que_6, que_7, sug_content)
VALUES 
 (
 '강의 내용은 자신에게 학습 욕구를 불러일으킬 만큼 적절한 수준이었는가?',
 '이 강의를 통하여 다른 강의에서는 접할 수 없는 새로운 내용을 배울 수 있었는가?',
 '강의를 통하여 해당 교과목에 대한 이해(실기 능력과 기능)가 개선되었는가?',
 '교수는 주요 주제들간의 관계가 드러나도록 내용을 구조화 하여 전달하였는가?',
 '교수는 열정을 갖고 수업을 진행하였는가?',
 '수업시간은 제대로 이루어졌는가?',
 '강의 내용이 과목명이랑 부합하는가?',
 '이 강의가 계속 실려 나가야 할 장점과 개선이 필요한 점'
 );
 
INSERT INTO subject_tb
(
   name,
   professor_id,
   room_id,
   dept_id,
   type,
   sub_year,
   semester,
   sub_day,
   start_time,
   end_time,
   grades,
   capacity,
   num_of_student
)
VALUES
(
   '사용자 중심 디자인',
   '23000001',
   'C202',
   102,
   '전공',
   '2023',
   1,
   '수',
   10,
   13,
   3,
   30,
   29
);
