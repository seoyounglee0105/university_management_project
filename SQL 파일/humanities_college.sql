INSERT INTO staff_tb
VALUES (230002, '이서영', '2000-01-05', '여성', '부산시 수영구', '010-0743-3282', 'os010312@naver.com', '2023-01-01');
INSERT INTO user_tb
VALUES (230002, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'staff');

-- 인문대학 - 철학과, 국사학과, 언어학과, 영어영문학과, 국어국문학과

-- 단과대 1개(college_tb) - id : 2
INSERT INTO college_tb VALUES (2, '인문대학');

-- 강의실 10개 (room_tb) 과당 2개
INSERT INTO room_tb
VALUES 
	('H101', 2),
	('H102', 2),
	('H103', 2),
	('H104', 2),
	('H201', 2),
	('H202', 2),
	('H203', 2),
	('H204', 2),
	('H301', 2),
	('H302', 2);


-- 학과 5개(department_tb)
INSERT INTO department_tb
VALUES 
	(106, '철학과', 2),
	(107, '국사학과', 2),
	(108, '언어학과', 2),
	(109, '국어국문학과', 2),
	(110, '영어영문학과', 2);


-- 교수 10명 (professor_tb, user_tb) 과당 2명
INSERT INTO professor_tb
VALUES 
	(23000011, '구평회', '1985-03-12', '남성', '부산시 남구', '010-6356-2325', 'asdfqwe11@nate.com', 106, '2023-01-01'),
	(23000012, '김선우', '1991-12-14', '남성', '부산시 남구', '010-5234-1234', 'as5435@nate.com', 106, '2023-01-01'),
	(23000013, '이유신', '1990-05-14', '남성', '부산시 남구', '010-3423-3476', 'hfgdfg44@nate.com', 107, '2023-01-01'),
	(23000014, '고시근', '1981-08-21', '남성', '부산시 남구', '010-6765-6734', 'gvcfg4325@nate.com', 107, '2023-01-01'),
	(23000015, '김영진', '1976-06-03', '남성', '부산시 남구', '010-6345-3654', 'hgrds455@nate.com', 108, '2023-01-01'),
	(23000016, '이운식', '1979-05-04', '남성', '부산시 남구', '010-8642-9776', 'dfhyurewr444@nate.com', 108, '2023-01-01'),
	(23000017, '김민수', '1978-11-07', '남성', '부산시 남구', '010-3456-7456', 'alstn134@nate.com', 109, '2023-01-01'),
	(23000018, '이지환', '1987-10-25', '남성', '부산시 남구', '010-5423-6565', 'wlghks344@nate.com', 109, '2023-01-01'),
	(23000019, '서원철', '1988-06-27', '남성', '부산시 남구', '010-8654-8644', 'dnjscjf345@nate.com', 110, '2023-01-01'),
	(23000020, '이유신', '1991-08-30', '남성', '부산시 남구', '010-2345-4574', 'dsdfgert34@nate.com', 110, '2023-01-01');

INSERT INTO user_tb
	VALUES 
		(23000011, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'professor'),
		(23000012, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'professor'),
		(23000013, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'professor'),
		(23000014, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'professor'),
		(23000015, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'professor'),
		(23000016, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'professor'),
		(23000017, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'professor'),
		(23000018, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'professor'),
		(23000019, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'professor'),
		(23000020, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'professor');

-- 강의 20개 (subject_tb, syllabus_tb) 교수당 2개 (과당 4개) -- 10020부터
INSERT INTO subject_tb 
	VALUES
		(10020, '칸트철학', 23000011, 'H101', 106, '전공', 2023, 1, '월', 15, 18, 3, 25, 0),
		(10021, '불교철학사', 23000011, 'H101', 106, '전공', 2023, 1, '화', 09, 12, 3, 25, 0),
		(10022, '대륙합리론', 23000012, 'H102', 106, '전공', 2023, 1, '수', 10, 13, 3, 20, 0),
		(10023, '심리철학', 23000012, 'H102', 106, '교양', 2023, 1, '목', 14, 16, 2, 50, 0),
		(10024, '역사학개론', 23000013, 'H103', 107, '전공', 2023, 1, '월', 13, 16, 3, 25, 0),
		(10025, '동아시아사', 23000013, 'H103', 107, '전공', 2023, 1, '화', 11, 14, 3, 25, 0),
		(10026, '한국근대사', 23000014, 'H104', 107, '전공', 2023, 1, '금', 13, 16, 3, 20, 0),
		(10027, '한국사입문', 23000014, 'H104', 107, '교양', 2023, 1, '목', 10, 12, 2, 50, 0),
		(10028, '의미론', 23000015, 'H201', 108, '전공', 2023, 1, '월', 10, 13, 3, 25, 0),
		(10029, '형태론', 23000015, 'H201', 108, '전공', 2023, 1, '화', 14, 17, 3, 25, 0),
		(10030, '컴퓨터언어학', 23000016, 'H202', 108, '전공', 2023, 1, '수', 13, 16, 3, 20, 0),
		(10031, '이태리어', 23000016, 'H202', 108, '교양', 2023, 1, '금', 09, 11, 2, 50, 0),
		(10032, '고전문학연습', 23000017, 'H203', 109, '전공', 2023, 1, '월', 15, 18, 3, 25, 0),
		(10033, '국어정서법', 23000017, 'H203', 109, '전공', 2023, 1, '화', 12, 15, 3, 25, 0),
		(10034, '한국현대작가론', 23000018, 'H204', 109, '전공', 2023, 1, '수', 09, 12, 3, 20, 0),
		(10035, '국문학개론', 23000018, 'H204', 109, '교양', 2023, 1, '목', 16, 18, 2, 50, 0),
		(10036, '중세영문학', 23000019, 'H301', 110, '전공', 2023, 1, '금', 13, 16, 3, 25, 0),
		(10037, '영어발달사', 23000019, 'H301', 110, '전공', 2023, 1, '목', 10, 13, 3, 25, 0),
		(10038, '현대영국소설론', 23000020, 'H302', 110, '전공', 2023, 1, '수', 13, 16, 3, 20, 0),
		(10039, '영문학입문', 23000020, 'H302', 110, '교양', 2023, 1, '화', 15, 17, 2, 50, 0);
        
-- 강의 계획서
INSERT INTO syllabus_tb (subject_id)
VALUES 
	(10020),
	(10021),
	(10022),
	(10023),
	(10024),
	(10025),
	(10026),
	(10027),
	(10028),
	(10029),
	(10030),
	(10031),
	(10032),
	(10033),
	(10034),
	(10035),
	(10036),
	(10037),
	(10038),
	(10039);
        
-- 학생 50명 (student_tb, stustat_tb, user_tb) 과당 10명 -- 2023000051부터
INSERT INTO student_tb
VALUES
	(2023000051, '김민지', '2004-01-01', '여성', '부산시 기장군', '010-3423-0355', 'alswl@naver.com', 106, 1, 1, '2023-03-02', NULL),
	(2023000052, '임소연', '2004-04-01', '여성', '부산시 기장군', '010-2344-0452', 'thdus@naver.com', 106, 1, 1, '2023-03-02', NULL),
	(2023000053, '최지혜', '2004-06-02', '여성', '부산시 기장군', '010-6564-6370', 'wlgp@naver.com', 106, 1, 1, '2023-03-02', NULL),
	(2023000054, '이서연', '2004-02-03', '여성', '부산시 기장군', '010-2325-1305', 'tjdus@naver.com', 106, 1, 1, '2023-03-02', NULL),
	(2023000055, '노휘정', '2004-07-06', '여성', '부산시 기장군', '010-5445-3562', 'gnlwjd@naver.com', 106, 1, 1, '2023-03-02', NULL),
	(2023000056, '서지혜', '2004-12-08', '여성', '부산시 기장군', '010-6654-8865', 'wlgptj@naver.com', 106, 1, 1, '2023-03-02', NULL),
	(2023000057, '김한솔', '2004-11-07', '여성', '부산시 기장군', '010-7867-8768', 'gksthf@naver.com', 106, 1, 1, '2023-03-02', NULL),
	(2023000058, '백선우', '2004-10-10', '여성', '부산시 기장군', '010-5465-9975', 'tjsdn@naver.com', 106, 1, 1, '2023-03-02', NULL),
	(2023000059, '권희진', '2004-05-10', '여성', '부산시 기장군', '010-7676-7478', 'gmlwls@naver.com', 106, 1, 1, '2023-03-02', NULL),
	(2023000060, '백수민', '2004-07-12', '여성', '부산시 기장군', '010-5424-2596', 'tnals@naver.com', 106, 1, 1, '2023-03-02', NULL),
	(2023000061, '최성민', '2004-04-12', '여성', '부산시 기장군', '010-4534-4563', 'tjdals@naver.com', 107, 1, 1, '2023-03-02', NULL),
	(2023000062, '이윤정', '2004-09-14', '여성', '부산시 기장군', '010-3247-9784', 'dbswjd@naver.com', 107, 1, 1, '2023-03-02', NULL),
	(2023000063, '배수연', '2004-10-19', '여성', '부산시 기장군', '010-8965-4564', 'tndus@naver.com', 107, 1, 1, '2023-03-02', NULL),
	(2023000064, '강윤지', '2004-10-17', '여성', '부산시 기장군', '010-3453-6775', 'dbswl@naver.com', 107, 1, 1, '2023-03-02', NULL),
	(2023000065, '김예빈', '2004-12-15', '여성', '부산시 기장군', '010-4432-2234', 'dpqls@naver.com', 107, 1, 1, '2023-03-02', NULL),
	(2023000066, '김하정', '2004-11-14', '여성', '부산시 기장군', '010-8778-5452', 'gkwjd@naver.com', 107, 1, 1, '2023-03-02', NULL),
	(2023000067, '김지원', '2004-11-12', '여성', '부산시 기장군', '010-5464-4311', 'wldnjs@naver.com', 107, 1, 1, '2023-03-02', NULL),
	(2023000068, '김현아', '2004-06-12', '여성', '부산시 기장군', '010-2346-3423', 'gusdk@naver.com', 107, 1, 1, '2023-03-02', NULL),
	(2023000069, '박수현', '2004-07-03', '여성', '부산시 기장군', '010-8644-5634', 'tngus@naver.com', 107, 1, 1, '2023-03-02', NULL),
	(2023000070, '송민정', '2004-08-05', '여성', '부산시 기장군', '010-5453-2354', 'alswjd@naver.com', 107, 1, 1, '2023-03-02', NULL),
	(2023000071, '우해인', '2004-05-06', '여성', '부산시 기장군', '010-8675-4653', 'godls@naver.com', 108, 1, 1, '2023-03-02', NULL),
	(2023000072, '엄세희', '2004-03-05', '여성', '부산시 기장군', '010-4364-2456', 'tpgml@naver.com', 108, 1, 1, '2023-03-02', NULL),
	(2023000073, '이선아', '2004-02-02', '여성', '부산시 기장군', '010-4654-2357', 'tjsdk@naver.com', 108, 1, 1, '2023-03-02', NULL),
	(2023000074, '이효주', '2004-01-21', '여성', '부산시 기장군', '010-8678-2955', 'gywn@naver.com', 108, 1, 1, '2023-03-02', NULL),
	(2023000075, '임희영', '2004-01-24', '여성', '부산시 기장군', '010-9865-2346', 'gmldud@naver.com', 108, 1, 1, '2023-03-02', NULL),
	(2023000076, '김기범', '2004-05-19', '남성', '부산시 기장군', '010-3246-7537', 'rlqja@naver.com', 108, 1, 1, '2023-03-02', NULL),
	(2023000077, '이태형', '2004-08-18', '남성', '부산시 기장군', '010-5442-2423', 'xogud@naver.com', 108, 1, 1, '2023-03-02', NULL),
	(2023000078, '김민철', '2004-07-16', '남성', '부산시 기장군', '010-3245-3523', 'alscjf@naver.com', 108, 1, 1, '2023-03-02', NULL),
	(2023000079, '김준우', '2004-06-15', '남성', '부산시 기장군', '010-5435-3546', 'wnsdn@naver.com', 108, 1, 1, '2023-03-02', NULL),
	(2023000080, '류영환', '2004-09-12', '남성', '부산시 기장군', '010-6546-2345', 'dudghks@naver.com', 108, 1, 1, '2023-03-02', NULL),
	(2023000081, '박건현', '2004-10-23', '남성', '부산시 기장군', '010-4634-6734', 'rjsgus@naver.com', 109, 1, 1, '2023-03-02', NULL),
	(2023000082, '박명찬', '2004-10-23', '남성', '부산시 기장군', '010-3434-7854', 'audcks@naver.com', 109, 1, 1, '2023-03-02', NULL),
	(2023000083, '박세원', '2004-05-27', '남성', '부산시 기장군', '010-4367-4356', 'tpdnjs@naver.com', 109, 1, 1, '2023-03-02', NULL),
	(2023000084, '박수현', '2004-05-26', '남성', '부산시 기장군', '010-7564-9663', 'tngus@naver.com', 109, 1, 1, '2023-03-02', NULL),
	(2023000085, '박재현', '2004-05-24', '남성', '부산시 기장군', '010-6988-5783', 'wogus@naver.com', 109, 1, 1, '2023-03-02', NULL),
	(2023000086, '박태호', '2004-03-20', '남성', '부산시 기장군', '010-7634-8563', 'xogh33@naver.com', 109, 1, 1, '2023-03-02', NULL),
	(2023000087, '배용진', '2004-02-10', '남성', '부산시 기장군', '010-4535-7567', 'dydwls@naver.com', 109, 1, 1, '2023-03-02', NULL),
	(2023000088, '서재영', '2004-01-13', '남성', '부산시 기장군', '010-6754-6573', 'wodud@naver.com', 109, 1, 1, '2023-03-02', NULL),
	(2023000089, '성윤석', '2004-05-11', '남성', '부산시 기장군', '010-6545-3456', 'dbstjr@naver.com', 109, 1, 1, '2023-03-02', NULL),
	(2023000090, '소제웅', '2004-07-17', '남성', '부산시 기장군', '010-4654-8645', 'wpdnd@naver.com', 109, 1, 1, '2023-03-02', NULL),
	(2023000091, '손휘준', '2004-06-15', '남성', '부산시 기장군', '010-6547-6772', 'gnlwns@naver.com', 110, 1, 1, '2023-03-02', NULL),
	(2023000092, '신종민', '2004-08-15', '남성', '부산시 기장군', '010-4536-8862', 'whdals@naver.com', 110, 1, 1, '2023-03-02', NULL),
	(2023000093, '안지훈', '2004-05-11', '남성', '부산시 기장군', '010-7634-7743', 'wlgns@naver.com', 110, 1, 1, '2023-03-02', NULL),
	(2023000094, '이건민', '2004-05-05', '남성', '부산시 기장군', '010-2323-5536', 'rjsals@naver.com', 110, 1, 1, '2023-03-02', NULL),
	(2023000095, '이경섭', '2004-04-21', '남성', '부산시 기장군', '010-4323-1127', 'rudtjq@naver.com', 110, 1, 1, '2023-03-02', NULL),
	(2023000096, '이병권', '2004-02-22', '남성', '부산시 기장군', '010-3242-1235', 'qudrnjs@naver.com', 110, 1, 1, '2023-03-02', NULL),
	(2023000097, '이연수', '2004-05-23', '남성', '부산시 기장군', '010-2323-1331', 'dustn@naver.com', 110, 1, 1, '2023-03-02', NULL),
	(2023000098, '이인기', '2004-10-23', '남성', '부산시 기장군', '010-4374-4573', 'dlsrl@naver.com', 110, 1, 1, '2023-03-02', NULL),
	(2023000099, '이장혁', '2004-12-23', '남성', '부산시 기장군', '010-8754-8657', 'wkdgur@naver.com', 110, 1, 1, '2023-03-02', NULL),
	(2023000100, '정재민', '2004-12-23', '남성', '부산시 기장군', '010-2346-8867', 'woals@naver.com', 110, 1, 1, '2023-03-02', NULL);

INSERT INTO user_tb
VALUES 
	(2023000051, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000052, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000053, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000054, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000055, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000056, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000057, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000058, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000059, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000060, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000061, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000062, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000063, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000064, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000065, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000066, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000067, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000068, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000069, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000070, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000071, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000072, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000073, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000074, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000075, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000076, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000077, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000078, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000079, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000080, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000081, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000082, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000083, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000084, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000085, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000086, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000087, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000088, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000089, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000090, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000091, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000092, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000093, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000094, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000095, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000096, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000097, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000098, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000099, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student'),
	(2023000100, '$2a$10$hEYFZOe.PbFbVRcPZymRKuCGMU2MilAn64ZGnIqPgfwWL7JyGeKKW', 'student');

INSERT INTO stu_stat_tb (student_id, status, from_date, to_date)
VALUES 
	(2023000051, '재학', '2023-03-02', '9999-01-01'),
	(2023000052, '재학', '2023-03-02', '9999-01-01'),
	(2023000053, '재학', '2023-03-02', '9999-01-01'),
	(2023000054, '재학', '2023-03-02', '9999-01-01'),
	(2023000055, '재학', '2023-03-02', '9999-01-01'),
	(2023000056, '재학', '2023-03-02', '9999-01-01'),
	(2023000057, '재학', '2023-03-02', '9999-01-01'),
	(2023000058, '재학', '2023-03-02', '9999-01-01'),
	(2023000059, '재학', '2023-03-02', '9999-01-01'),
	(2023000060, '재학', '2023-03-02', '9999-01-01'),
	(2023000061, '재학', '2023-03-02', '9999-01-01'),
	(2023000062, '재학', '2023-03-02', '9999-01-01'),
	(2023000063, '재학', '2023-03-02', '9999-01-01'),
	(2023000064, '재학', '2023-03-02', '9999-01-01'),
	(2023000065, '재학', '2023-03-02', '9999-01-01'),
	(2023000066, '재학', '2023-03-02', '9999-01-01'),
	(2023000067, '재학', '2023-03-02', '9999-01-01'),
	(2023000068, '재학', '2023-03-02', '9999-01-01'),
	(2023000069, '재학', '2023-03-02', '9999-01-01'),
	(2023000070, '재학', '2023-03-02', '9999-01-01'),
	(2023000071, '재학', '2023-03-02', '9999-01-01'),
	(2023000072, '재학', '2023-03-02', '9999-01-01'),
	(2023000073, '재학', '2023-03-02', '9999-01-01'),
	(2023000074, '재학', '2023-03-02', '9999-01-01'),
	(2023000075, '재학', '2023-03-02', '9999-01-01'),
	(2023000076, '재학', '2023-03-02', '9999-01-01'),
	(2023000077, '재학', '2023-03-02', '9999-01-01'),
	(2023000078, '재학', '2023-03-02', '9999-01-01'),
	(2023000079, '재학', '2023-03-02', '9999-01-01'),
	(2023000080, '재학', '2023-03-02', '9999-01-01'),
	(2023000081, '재학', '2023-03-02', '9999-01-01'),
	(2023000082, '재학', '2023-03-02', '9999-01-01'),
	(2023000083, '재학', '2023-03-02', '9999-01-01'),
	(2023000084, '재학', '2023-03-02', '9999-01-01'),
	(2023000085, '재학', '2023-03-02', '9999-01-01'),
	(2023000086, '재학', '2023-03-02', '9999-01-01'),
	(2023000087, '재학', '2023-03-02', '9999-01-01'),
	(2023000088, '재학', '2023-03-02', '9999-01-01'),
	(2023000089, '재학', '2023-03-02', '9999-01-01'),
	(2023000090, '재학', '2023-03-02', '9999-01-01'),
	(2023000091, '재학', '2023-03-02', '9999-01-01'),
	(2023000092, '재학', '2023-03-02', '9999-01-01'),
	(2023000093, '재학', '2023-03-02', '9999-01-01'),
	(2023000094, '재학', '2023-03-02', '9999-01-01'),
	(2023000095, '재학', '2023-03-02', '9999-01-01'),
	(2023000096, '재학', '2023-03-02', '9999-01-01'),
	(2023000097, '재학', '2023-03-02', '9999-01-01'),
	(2023000098, '재학', '2023-03-02', '9999-01-01'),
	(2023000099, '재학', '2023-03-02', '9999-01-01'),
	(2023000100, '재학', '2023-03-02', '9999-01-01');