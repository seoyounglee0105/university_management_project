INSERT INTO college_tb (name)
VALUES ('공과대학');

INSERT INTO department_tb (name, college_id)
VALUES ('산업공학과', 1);

INSERT INTO student_tb (id, name, birth_date, gender, address, tel, dept_id, grade, semester, entrance_date)
VALUES (2018000001, '이서영', '2000-01-05', 'F', '부산광역시 수영구', '010-1111-1111', 101, 1, 1, '2018-03-02');

INSERT INTO coll_tuit VALUES (1, 2173500);

INSERT INTO scholarship_tb VALUES (1, 2500000);

INSERT INTO stu_sch_tb VALUES (2018000001, 2018, 1, 1);
INSERT INTO stu_sch_tb VALUES (2018000001, 2023, 1, 1);

INSERT INTO tuition_tb (student_id, tui_year, semester, tui_amount, sch_type, sch_amount, status)
VALUES (2018000001, 2018, 1, 2173500, 1, 2173500, 1);
