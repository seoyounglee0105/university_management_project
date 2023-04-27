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
   '2018000001',
   'student'
),

(
   2018000002,
   '2018000002',
   'student'
),

(
   230001,
   '230001',
   'staff'
),

(
   230002,
   '230002',
   'staff'
),

(
   23000001,
   '23000001',
   'professor'
),

(
   23000002,
   '23000002',
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
   2,
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
   grade
)
VALUES
(
   2018000002,
   10000,
   'A'
),

(
   2018000002,
   10001,
   'A+'
),

(
   2018000002,
   10002,
   'B'
),

(
   2018000002,
   10003,
   'B+'
),

(
   2018000002,
   10004,
   'C+'
),

(
   2018000002,
   10005,
   'C'
),

(
   2018000002,
   10006,
   'A'
),

(
   2018000002,
   10007,
   'A+'
),

(
   2018000002,
   10008,
   'A'
),

(
   2018000002,
   10009,
   'A+'
),

(
   2018000002,
   10010,
   'B'
),

(
   2018000002,
   10011,
   'B+'
),

(
   2018000002,
   10012,
   'C+'
),

(
   2018000002,
   10013,
   'C'
),

(
   2018000002,
   10014,
   'A'
),

(
   2018000002,
   10015,
   'A+'
);
INSERT INTO stu_stat_tb VALUES
( 
   1,
   2018000001,
   '휴학',
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