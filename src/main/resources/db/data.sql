INSERT INTO college_tb (name)
VALUES ('공과대학');

INSERT INTO department_tb (name, college_id)
VALUES ('토목과', 1);

INSERT INTO student_tb (id, name, birth_date, gender, address, tel, dept_id, grade, semester, entrance_date)
VALUES (2018000001, '이서영', '2000-01-05', 'F', '부산광역시 수영구', '010-1111-1111', 101, 1, 1, '2018-03-02');

INSERT INTO coll_tuit_tb VALUES (1, 2173500);

INSERT INTO scholarship_tb VALUES (1, 2500000);

INSERT INTO stu_sch_tb VALUES (2018000001, 2018, 1, 1);
INSERT INTO stu_sch_tb VALUES (2018000001, 2023, 1, 1);

INSERT INTO tuition_tb (student_id, tui_year, semester, tui_amount, sch_type, sch_amount, status)
VALUES (2018000001, 2018, 1, 2173500, 1, 2173500, 1);


-- 성적조회 샘플 데이터
INSERT INTO student_tb (id, name, birth_date, gender, address, tel, dept_id, grade, semester, entrance_date)
VALUES (2018000002,'편용림','2000-08-05','M','부산광역시 수영구 광안동','010-4444-2221',101,1,1,'2023-04-01');

INSERT INTO room_tb(id,college_id)
VALUES 
('c201',1),
('c202',1);
INSERT INTO professor_tb(name,dept_id)
VALUES
	('홍길동','101'),
	('장길산','101');
    
INSERT INTO grade_tb(grade,grade_value)
VALUES
('A+',4.5),
('A',4.0),
('B+',3.5),
('B',3.0),
('C+',2.5),
('C',2.0),
('D+',1.5),
('F',0.5);    
    
INSERT INTO subject_tb(name,professor_id,room_id,dept_id,type,sub_year,semester,time, grades,capacity)
VALUES
	('상하수도공학','23000001','c201',101,'전공','2023',1,'금요일 10:00',3,30),
	('응용역학','23000001','c201',101,'전공','2023',1,'금요일 11:00',3,30),
	('측량학','23000001','c201',101,'전공','2023',1,'금요일 12:00',3,30),
	('수리학','23000001','c201',101,'전공','2023',1,'금요일 14:00',3,30),
	('철근콘크리트 및 강구조','23000001','c201',101,'전공','2023',1,'금요일 16:00',3,30),
	('토질 및 기초','23000001','c201',101,'전공','2023',1,'금요일 18:00',3,30),
	('영어','23000002','c201',101,'교양','2023',1,'토요일 10:00',3,30),
    ('미술','23000002','c201',101,'교양','2023',1,'토요일 11:00',3,30),
    ('상하수도공학','23000001','c202',101,'전공','2023',2,'금요일 10:00',3,30),
	('응용역학','23000001','c202',101,'전공','2023',2,'금요일 11:00',3,30),
	('측량학','23000001','c202',101,'전공','2023',2,'금요일 12:00',3,30),
	('수리학','23000001','c202',101,'전공','2023',2,'금요일 14:00',3,30),
	('철근콘크리트 및 강구조','23000001','c202',101,'전공','2023',2,'금요일 16:00',3,30),
	('영어','23000002','c202',101,'교양','2023',2,'토요일 10:00',3,30),
    ('토질 및 기초','23000001','c202',101,'전공','2023',2,'금요일 18:00',3,30),
    ('미술','23000002','c202',101,'교양','2023',2,'토요일 11:00',3,30);
    
 INSERT INTO stu_sub_tb(student_id,subject_id,grade)
VALUES
(2018000002,10000,'A'),
(2018000002,10001,'A+'),
(2018000002,10002,'B'),
(2018000002,10003,'B+'),
(2018000002,10004,'C+'),
(2018000002,10005,'C'),
(2018000002,10006,'A'),
(2018000002,10007,'A+'),
(2018000002,10008,'A'),
(2018000002,10009,'A+'),
(2018000002,10010,'B'),
(2018000002,10011,'B+'),
(2018000002,10012,'C+'),
(2018000002,10013,'C'),
(2018000002,10014,'A'),
(2018000002,10015,'A+');
