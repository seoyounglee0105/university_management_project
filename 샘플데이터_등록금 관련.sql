INSERT INTO college_tb (name)
VALUES ('공과대학');

INSERT INTO department_tb (name, college_id)
VALUES ('산업공학과', 1);

INSERT INTO student_tb (id, name, birth_date, gender, address, tel, dept_id, grade, semester, entrance_date)
VALUES (2018000001, '이서영', '2000-01-05', 'F', '부산광역시 수영구', '010-1111-1111', 101, 1, 1, '2018-03-02');

INSERT INTO coll_tuit VALUES (1, 2173500);

INSERT INTO scholarship_tb VALUES (1, 2500000);

-- 장학금액은 등록금이랑 비교해서 등록금보다 클 경우 등록금만큼만
INSERT INTO tuition_tb (student_id, tui_year, semester, sch_type, tui_amount, sch_amount)
VALUES (2018000001, 2018, 1, 1, 2173500, 2173500);

-- 해당 학생의 등록금 (단과대에서 가져옴)
SELECT amount FROM coll_tuit AS ct
WHERE college_id = (SELECT d.college_id FROM student_tb AS s
					JOIN department_tb AS d
					ON s.dept_id = d.id);
                    
-- 해당 학생의 장학금액
SELECT amount FROM coll_tuit AS ct
WHERE college_id = (SELECT d.college_id FROM student_tb AS s
					JOIN department_tb AS d
					ON s.dept_id = d.id);
                    
SELECT * FROM tuition_tb;