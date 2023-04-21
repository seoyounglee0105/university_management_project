INSERT INTO college_tb (name)
VALUES ('공과대학');

INSERT INTO department_tb (name, college_id)
VALUES ('산업공학과', 1);

INSERT INTO student_tb (name, birth_date, gender, address, tel, dept_id, grade, semester, entrance_date)
VALUES ('이서영', '2000-01-05', 'F', '부산광역시 수영구', '010-1111-1111', 101, 1, 1, '2018-03-02');