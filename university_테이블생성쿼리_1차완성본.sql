CREATE DATABASE university_management_sys;
USE university_management_sys;

-- 단과대
CREATE TABLE college_tb (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(10) NOT NULL UNIQUE
);

-- 부서
CREATE TABLE department_tb (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(10) NOT NULL UNIQUE,
    college_id INT NOT NULL COMMENT '단과대 id',
    FOREIGN KEY (college_id) REFERENCES college_tb (id)
);

ALTER TABLE department_tb AUTO_INCREMENT = 101;

-- 사용자
CREATE TABLE user_tb (
	id INT PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    user_role VARCHAR(10) NOT NULL
);

-- 학생
CREATE TABLE student_tb (
	id INT PRIMARY KEY AUTO_INCREMENT COMMENT '학번',
	name VARCHAR(30) NOT NULL,
    birth_date DATE NOT NULL,
    gender CHAR(1) NOT NULL COMMENT '남자: M, 여자: F',
    address VARCHAR(100) NOT NULL,
    tel VARCHAR(13) NOT NULL,
    dept_id INT NOT NULL COMMENT '학과',
    grade INT NOT NULL COMMENT '학년',
    semester INT NOT NULL COMMENT '학기',
    entrance_date DATE NOT NULL,
    graduation_date DATE,
    FOREIGN KEY(dept_id) REFERENCES department_tb (id)
);

ALTER TABLE student_tb AUTO_INCREMENT = 2023000001;

-- 교직원
CREATE TABLE staff_tb (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    hire_date DATE DEFAULT (current_date)
);

ALTER TABLE staff_tb AUTO_INCREMENT = 230001;

-- 교수
CREATE TABLE professor_tb (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    dept_id INT NOT NULL,
    hire_date DATE DEFAULT (current_date),
    FOREIGN KEY (dept_id) REFERENCES department_tb (id)
);

ALTER TABLE professor_tb AUTO_INCREMENT = 23000001;

-- 강의실
CREATE TABLE room_tb (
	id VARCHAR(5) PRIMARY KEY,
    college_id INT NOT NULL,
    FOREIGN KEY (college_id) REFERENCES college_tb (id)
);

-- 강의
CREATE TABLE subject_tb (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    professor_id INT NOT NULL,
    room_id VARCHAR(5),
    dept_id INT NOT NULL,
    type VARCHAR(2) NOT NULL COMMENT '강의 구분 (전공, 교양)',
    year INT NOT NULL COMMENT '년도',
    semester INT NOT NULL COMMENT '학기',
    time VARCHAR(35) NOT NULL COMMENT '요일 및 시간',
    grades INT NOT NULL COMMENT '이수 학점',
    capacity INT NOT NULL COMMENT '수강 정원',
    -- 실제 신청한 학생 수
    num_of_student INT NOT NULL DEFAULT 0 COMMENT '현재 신청 인원',
    FOREIGN KEY (professor_id) REFERENCES professor_tb (id),
    FOREIGN KEY (room_id) REFERENCES room_tb (id),
    FOREIGN KEY (dept_id) REFERENCES department_tb (id)
);
-- 과목 id 10000부터
ALTER TABLE subject_tb AUTO_INCREMENT = 10000;


-- 환산 점수
CREATE TABLE grade_tb (
	grade VARCHAR(2) PRIMARY KEY COMMENT '학점 (평점)',
    grade_value FLOAT NOT NULL COMMENT '환산 점수'
);

-- 수강 신청
CREATE TABLE pre_stu_sub_tb (
	student_id INT,
    subject_id INT,
    PRIMARY KEY (student_id, subject_id),
    FOREIGN KEY (student_id) REFERENCES student_tb (id),
    FOREIGN KEY (subject_id) REFERENCES subject_tb (id)
);

-- 수강 내역
CREATE TABLE stu_sub_tb (
	student_id INT,
    subject_id INT,
    PRIMARY KEY (student_id, subject_id),
    grade VARCHAR(2) COMMENT '학점 (평점)',
    FOREIGN KEY (student_id) REFERENCES student_tb (id),
    FOREIGN KEY (subject_id) REFERENCES subject_tb (id),
    FOREIGN KEY (grade) REFERENCES grade_tb (grade)
);

-- 단과대별 등록금
CREATE TABLE coll_tuit (
	college_id INT PRIMARY KEY,
    amount INT NOT NULL,
    FOREIGN KEY (college_id) REFERENCES college_tb (id)
);

-- 등록금
CREATE TABLE tuition_tb (
	student_id INT,
    semester VARCHAR(6),
    status BOOLEAN DEFAULT false COMMENT '납부 여부',
    PRIMARY KEY (student_id, semester),
    FOREIGN KEY (student_id) REFERENCES student_tb (id)
);

-- 장학금
CREATE TABLE scholarship_tb (
	student_id INT NOT NULL,
    semester VARCHAR(6) NOT NULL COMMENT '연도-학기',
    type VARCHAR(3) NOT NULL COMMENT '장학금 유형',
    PRIMARY KEY (student_id, semester),
    FOREIGN KEY (student_id) REFERENCES student_tb (id)
);

-- 학적 상태
CREATE TABLE stu_stat_tb (
	student_id INT NOT NULL,
	status VARCHAR(3) NOT NULL,
    from_date DATE,
    to_date DATE, -- 현재 속한 상태인 경우 '9999-01-01'
    FOREIGN KEY (student_id) REFERENCES student_tb (id)
);

-- 공지사항
CREATE TABLE notice_tb (
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    created_time TIMESTAMP DEFAULT now(),
    views INT NOT NULL DEFAULT 0 COMMENT '조회수'
);

-- 공지사항 첨부 파일
CREATE TABLE notice_file_tb (
	notice_id INT NOT NULL,
    origin_filename VARCHAR(100) COMMENT '기존 파일명' NOT NULL,
    uuid_filename VARCHAR(255) COMMENT '랜덤 문자열 포함 파일명' NOT NULL,
    FOREIGN KEY (notice_id) REFERENCES notice_tb (id)
);



-- 스태프 생성 예시
INSERT INTO staff_tb (name) VALUES ('김지현');

INSERT INTO user_tb VALUES
(
	(SELECT id FROM staff_tb ORDER BY id DESC LIMIT 1),
	(SELECT id FROM staff_tb ORDER BY id DESC LIMIT 1),
	'staff'
);







