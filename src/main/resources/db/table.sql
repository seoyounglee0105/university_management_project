
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
    grade INT NOT NULL DEFAULT 1 COMMENT '학년',
    semester INT NOT NULL DEFAULT 1 COMMENT '학기',
    entrance_date DATE NOT NULL,
    graduation_date DATE DEFAULT NULL
    
);

ALTER TABLE student_tb AUTO_INCREMENT = 2023000001;

-- 교직원
CREATE TABLE staff_tb (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    birth_date DATE NOT NULL,
    gender CHAR(1) NOT NULL COMMENT '남자: M, 여자: F',
    address VARCHAR(100) NOT NULL,
    tel VARCHAR(13) NOT NULL,
    hire_date DATE DEFAULT (current_date)
);

ALTER TABLE staff_tb AUTO_INCREMENT = 230001;

-- 교수
CREATE TABLE professor_tb (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    birth_date DATE NOT NULL,
    gender CHAR(1) NOT NULL COMMENT '남자: M, 여자: F',
    address VARCHAR(100) NOT NULL,
    tel VARCHAR(13) NOT NULL,
    dept_id INT NOT NULL,
    hire_date DATE DEFAULT (current_date)
    
);

ALTER TABLE professor_tb AUTO_INCREMENT = 23000001;

-- 강의실
CREATE TABLE room_tb (
	id VARCHAR(5) PRIMARY KEY,
    college_id INT NOT NULL,
    FOREIGN KEY (college_id) REFERENCES college_tb (id)
);

