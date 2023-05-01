

-- 공과대학 
INSERT INTO college_tb (name)
VALUES ('공과대학');

SELECT * FROM college_tb;

-- 학과 입력
INSERT INTO department_tb (name, college_id)
VALUES 
('컴퓨터공학과', 1),
('전자공학과', 1),
('화학공학과', 1),
('기계공학과', 1),
('신소재공학과', 1);

SELECT * FROM department_tb;
SELECT * FROM professor_tb;
-- 교수 입력
INSERT INTO professor_tb(name, birth_date, gender, address, tel, email, dept_id)
VALUES
('김근호', '1985-08-01', '남성', '부산시 부산진구', '010-5277-0535', 'tenco@green.com', 101),
('이치승', '1960-11-04', '남성', '부산시 수영구', '010-5241-7184', 'lcs@green.com', 101),
('김미정', '1971-10-19', '여성', '부산시 북구', '010-1162-9586', 'kmj@green.com', 102),
('전대영', '1962-08-30', '남성', '부산시 동래구', '010-9938-8571', 'jdy@green.com', 102),
('김효린', '1980-09-01', '여성', '부산시 해운대구', '010-8520-1748', 'khr@green.com', 103),
('김현우', '1948-11-11', '남성', '부산시 해운대구', '010-1024-7785', 'khw@green.com', 103),
('정다운', '1966-04-24', '남성', '부산시 강서구', '010-1642-9966', 'jdw@green.com', 104),
('손주이', '1973-10-09', '여성', '부산시 수영구', '010-3425-8896', 'sjy@green.com', 104),
('이현서', '1983-02-27', '남성', '부산시 영도구', '010-2025-5748', 'lhs@green.com', 105),
('이지운', '1957-01-18', '여성', '부산시 사하구', '010-1566-9486', 'ljw@green.com', 105);

SET FOREIGN_KEY_CHECKS = 0;
SET FOREIGN_KEY_CHECKS = 1;

SELECT * FROM room_tb;
-- 강의실 
INSERT INTO room_tb (id, college_id)
VALUES 
('C601',1),
('C602',1),
('C701',1),
('C702',1),
('C801',1),
('C802',1),
('C901',1),
('C902',1),
('C904',1),
('C905',1);

-- 강의 입력
INSERT INTO subject_tb (name, professor_id, room_id, dept_id, type, sub_year, semester, sub_day, start_time, end_time, grades, capacity)
VALUES
('데이터통신', 23000001, 'C601', 101, '전공', 2023, 1, '월', 14, 17, 3, 20),
('딥러닝의 기초', 23000001, 'C601', 101, '전공', 2023, 1, '수', 9, 12, 3, 20),
('컴퓨터의 개념 및 실습', 23000002, 'C602', 101, '교양', 2023, 1, '화', 10, 12, 2, 30),
('컴퓨터 프로그래밍', 23000002, 'C602', 101, '전공', 2023, 1, '금', 15, 18, 3, 20),
('공학설계 입문', 23000003, 'C701', 102, '전공', 2023, 1, '목', 9, 12, 3, 20),
('반도체 공학', 23000003, 'C701', 102, '전공', 2023, 1, '목', 14, 17, 3, 20),
('융합전자연구', 23000004, 'C702', 102, '전공', 2023, 1, '금', 14, 17, 3, 20),
('기초 전기실험', 23000005, 'C702', 102, '전공', 2023, 1, '월', 14, 17, 3, 20),
('물리화학', 23000005, 'C801', 103, '전공', 2023, 1, '목', 12, 15, 3, 20),
('반응공학', 23000005, 'C801', 103, '전공', 2023, 1, '수', 12, 15, 3, 20),
('사고와 표현', 23000006, 'C802', 103, '교양', 2023, 1, '화', 11, 13, 2, 30),
('과학과 기술', 23000006, 'C802', 103, '교양', 2023, 1, '화', 13, 15, 2, 30),
('고체역학', 23000007, 'C901', 104, '전공', 2023, 1, '월', 13, 16, 3, 20),
('자유정의진리', 23000007, 'C901', 104, '교양', 2023, 1, '화', 9, 11, 2, 30),
('정보적 사고', 23000008, 'C902', 104, '교양', 2023, 1, '목', 9, 11, 2, 30),
('CAD기초', 23000008, 'C902', 104, '전공', 2023, 1, '화', 13, 15, 2, 20),
('에너지재료', 23000009, 'C904', 105, '전공', 2023, 1, '수', 11, 14, 3, 30),
('나노재료합성', 23000009, 'C904', 105, '전공', 2023, 1, '목', 11, 14, 3, 30),
('신소재공학개론', 23000010, 'C905', 105, '전공', 2023, 1, '월', 9, 12, 3, 30),
('신소재기초실습', 23000010, 'C905', 105, '전공', 2023, 1, '월', 13, 16, 3, 30);

ALTER TABLE staff_tb MODIFY gender VARCHAR(2);
-- 교직원
INSERT INTO staff_tb (name, birth_date, gender, address, tel, email)
VALUES
('박성희', '1995-09-03', '여성', '부산시 부산진구', '010-9930-2889', 'sungheepppp@gmail.com');

INSERT INTO student_tb (name, birth_date, gender, address, tel, email, dept_id, grade, semester, entrance_date)
VALUES
('박시우', '2002-06-19', '남성', '부산시 남구', '010-5267-1815', 'psw@green.com', 101, 3, 1, '2021-03-02'),
('김예준', '2002-04-25', '남성', '부산시 북구', '010-4152-9963', 'kyj@green.com', 101, 3, 1, '2021-03-02'),
('김지우', '2002-11-15', '여성', '부산시 해운대구', '010-1526-8495', 'kjw@green.com', 101, 3, 1, '2021-03-02'),
('정수호', '2003-01-14', '남성', '부산시 북구', '010-2481-7553', 'jsh@green.com', 101, 2, 1, '2022-03-02'),
('김주원', '2003-06-19', '남성', '부산시 동구', '010-1052-4486', 'kjw2@green.com', 101, 2, 1, '2022-03-02'),
('이민서', '2003-12-29', '여성', '부산시 해운대구', '010-1096-7741', 'lms2@green.com', 101, 2, 1, '2022-03-02'),
('문건우', '2003-07-22', '남성', '부산시 해운대구', '010-0326-0926', 'mgw@green.com', 101, 2, 1, '2022-03-02'),
('정민준', '2004-06-02', '남성', '부산시 사하구', '010-0096-8196', 'jmj@green.com', 101, 1, 1, '2023-03-02'),
('전하은', '2003-04-28', '여성', '부산시 사하구', '010-7158-8852', 'jhe@green.com', 101, 1, 1, '2023-03-02'),
('김도현', '2003-09-29', '남성', '부산시 영도구', '010-1234-8592', 'kdh2@green.com', 101, 1, 1, '2023-03-02');

INSERT INTO student_tb (name, birth_date, gender, address, tel, email, dept_id, grade, semester, entrance_date)
VALUES
('차은우', '2002-07-04', '남성', '부산시 남구', '010-5267-0106', 'cew@green.com', 102, 3, 1, '2021-03-02'),
('박서준', '2002-04-26', '남성', '부산시 북구', '010-4152-9148', 'psj@green.com', 102, 3, 1, '2021-03-02'),
('이도윤', '2002-11-22', '남성', '부산시 해운대구', '010-1526-9962', 'ldw@green.com', 102, 3, 1, '2021-03-02'),
('강민지', '2003-01-01', '여성', '부산시 북구', '010-2481-7718', 'kmj11@green.com', 102, 2, 1, '2022-03-02'),
('윤진희', '2003-06-29', '여성', '부산시 동구', '010-1052-1014', 'yjh@green.com', 102, 2, 1, '2022-03-02'),
('김유준', '2003-12-30', '남성', '부산시 해운대구', '010-1096-0205', 'kyj09@green.com', 102, 2, 1, '2022-03-02'),
('이준우', '2003-07-11', '남성', '부산시 해운대구', '010-0326-7085', 'ljw@green.com', 102, 2, 1, '2022-03-02'),
('박연우', '2004-06-17', '남성', '부산시 사하구', '010-0096-1164', 'pyw@green.com', 102, 1, 1, '2023-03-02'),
('이윤서', '2003-04-03', '여성', '부산시 사하구', '010-7158-1992', 'lys08@green.com', 102, 1, 1, '2023-03-02'),
('신하윤', '2003-09-01', '여성', '부산시 영도구', '010-1234-4052', 'shy@green.com', 102, 1, 1, '2023-03-02');


INSERT INTO student_tb (name, birth_date, gender, address, tel, email, dept_id, grade, semester, entrance_date)
VALUES
('김현민', '2002-01-04', '남성', '부산시 남구', '010-4165-0106', 'khm@green.com', 103, 3, 1, '2021-03-02'),
('하준서', '2002-01-26', '남성', '부산시 북구', '010-1152-9148', 'hjs@green.com', 103, 3, 1, '2021-03-02'),
('김우진', '2002-02-22', '남성', '부산시 해운대구', '010-8295-9962', 'kwj@green.com', 103, 3, 1, '2021-03-02'),
('김예나', '2003-11-01', '여성', '부산시 북구', '010-8844-7718', 'kyn@green.com', 103, 2, 1, '2022-03-02'),
('윤태리', '2003-12-29', '여성', '부산시 동구', '010-7154-1014', 'ytr@green.com', 103, 2, 1, '2022-03-02'),
('이민재', '2003-09-30', '남성', '부산시 해운대구', '010-1693-0205', 'lmj87@green.com', 103, 2, 1, '2022-03-02'),
('정현준', '2003-05-11', '남성', '부산시 해운대구', '010-2356-7085', 'jhj2@green.com', 103, 2, 1, '2022-03-02'),
('정지호', '2004-05-17', '남성', '부산시 사하구', '010-8520-1164', 'jjh@green.com', 103, 1, 1, '2023-03-02'),
('이수아', '2003-02-03', '여성', '부산시 사하구', '010-0215-1992', 'lsa@green.com', 103, 1, 1, '2023-03-02'),
('김채원', '2003-08-01', '여성', '부산시 영도구', '010-0369-4052', 'kcw@green.com', 103, 1, 1, '2023-03-02');


INSERT INTO student_tb (name, birth_date, gender, address, tel, email, dept_id, grade, semester, entrance_date)
VALUES
('이지후', '2002-01-10', '남성', '부산시 남구', '010-2623-0106', 'ljh@green.com', 104, 3, 1, '2021-03-02'),
('윤정우', '2002-01-11', '남성', '부산시 북구', '010-1152-1625', 'yjw@green.com', 104, 3, 1, '2021-03-02'),
('김시윤', '2002-02-24', '남성', '부산시 해운대구', '010-1195-9962', 'ksy3@green.com', 104, 3, 1, '2021-03-02'),
('최서연', '2003-11-14', '여성', '부산시 북구', '010-8844-4185', 'csy@green.com', 104, 2, 1, '2022-03-02'),
('임지유', '2003-12-27', '여성', '부산시 동구', '010-7154-1166', 'lju@green.com', 104, 2, 1, '2022-03-02'),
('김유찬', '2003-09-02', '남성', '부산시 해운대구', '010-1748-0205', 'kyc@green.com', 104, 2, 1, '2022-03-02'),
('하준영', '2003-05-01', '남성', '부산시 해운대구', '010-2356-1234', 'hjw2@green.com', 104, 2, 1, '2022-03-02'),
('차지원', '2004-05-19', '남성', '부산시 사하구', '010-1928-1164', 'cjw9@green.com', 104, 1, 1, '2023-03-02'),
('이다인', '2003-02-14', '여성', '부산시 사하구', '010-0215-1614', 'ldi@green.com', 104, 1, 1, '2023-03-02'),
('김아린', '2003-08-24', '여성', '부산시 영도구', '010-0042-4052', 'kar@green.com', 104, 1, 1, '2023-03-02');

INSERT INTO student_tb (name, birth_date, gender, address, tel, email, dept_id, grade, semester, entrance_date)
VALUES
('정윤호', '2002-07-10', '남성', '부산시 남구', '010-1235-8495', 'jyh@green.com', 105, 3, 1, '2021-03-02'),
('이태윤', '2002-11-11', '남성', '부산시 북구', '010-1624-1625', 'lty@green.com', 105, 3, 1, '2021-03-02'),
('이재민', '2002-06-24', '남성', '부산시 해운대구', '010-1162-9962', 'ljm@green.com', 105, 3, 1, '2021-03-02'),
('박시연', '2003-08-14', '여성', '부산시 북구', '010-8844-1948', 'psy@green.com', 105, 2, 1, '2022-03-02'),
('정나윤', '2003-01-27', '여성', '부산시 동구', '010-7154-1245', 'jny@green.com', 105, 2, 1, '2022-03-02'),
('하준호', '2003-05-02', '남성', '부산시 해운대구', '010-1748-7548', 'hjh3@green.com', 105, 2, 1, '2022-03-02'),
('김나은', '2003-04-01', '남성', '부산시 해운대구', '010-2356-7410', 'kne@green.com', 105, 2, 1, '2022-03-02'),
('이한결', '2004-07-19', '남성', '부산시 사하구', '010-1928-0104', 'lhg@green.com', 105, 1, 1, '2023-03-02'),
('김서진', '2003-04-14', '여성', '부산시 사하구', '010-0215-0062', 'ksj12@green.com', 105, 1, 1, '2023-03-02'),
('김다빈', '2003-09-24', '여성', '부산시 영도구', '010-0042-4015', 'kdb@green.com', 105, 1, 1, '2023-03-02');

INSERT INTO user_tb
VALUES 
	(2023000001, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000002, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000003, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000004, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000005, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000006, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000007, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000008, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000009, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000010, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000011, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000012, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000013, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000014, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000015, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000016, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000017, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000018, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000019, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000020, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000021, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000022, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000023, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000024, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000025, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000026, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000027, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000028, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000029, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000030, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000031, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000032, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000033, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000034, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000035, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000036, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000037, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000038, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000039, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000040, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000041, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000042, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000043, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000044, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000045, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000046, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000047, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000048, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000049, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000050, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student');
	
INSERT INTO user_tb
	VALUES 
		(23000001, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'professor'),
		(23000002, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'professor'),
		(23000003, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'professor'),
		(23000004, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'professor'),
		(23000005, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'professor'),
		(23000006, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'professor'),
		(23000007, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'professor'),
		(23000008, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'professor'),
		(23000009, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'professor'),
		(23000010, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'professor');
		
INSERT INTO user_tb
VALUES (230001, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'staff');