INSERT INTO college_tb (name)
VALUES ('공과대학');

INSERT INTO department_tb (name, college_id)
VALUES ('산업공학과', 1);

INSERT INTO student_tb (id, name, birth_date, gender, address, tel, dept_id, grade, semester, entrance_date)
VALUES (2018000001, '이서영', '2000-01-05', 'F', '부산광역시 수영구', '010-1111-1111', 101, 1, 1, '2018-03-02');

INSERT INTO coll_tuit_tb VALUES (1, 2173500);

INSERT INTO scholarship_tb VALUES (1, 2500000);

INSERT INTO stu_sch_tb VALUES (2018000001, 2018, 1, 1);

INSERT INTO tuition_tb (student_id, tui_year, semester, tui_amount, sch_type, sch_amount, status)
VALUES (2018000001, 2018, 1, 2173500, 1, 2173500, 1);

SELECT * FROM student_tb;

-- 1. 재학 상태인 학생의 학번들만 추출해서 리스트에 담음
SELECT student_id FROM stu_stat_tb WHERE status = '재학';
-- 이 결과를 리스트에 담음 (이 리스트를 idList라고 부르겠음)

-- 2. idList에 대해 foreach
for (Integer id : idList) {

	-- 3. 해당 학생의 납부된 등록금 내역 리스트 뽑아냄 
    SELECT * FROM tuition_tb WHERE student_id = #{id} AND status = true;
	-- 이 결과를 리스트에 담음 (이 리스트를 tuiList라고 부르겠음)
    
    -- 4. 납부된 등록금 내역 개수
    int tuiCount = tuiList.size();
    
    -- 5. 학년 구하기 (0.5 -> 1로 올림)
    int newGrade = (int) Math.ceil(tuiCount / 2.0); 
    
    -- 6. 학기 구하기
    int newSemester = 0;
    if (tuiCount % 2 == 1) {
		newSemester = 1;
	} else {
		newSemester = 2;
    }
    
    -- 7. 학년/학기 갱신
    UPDATE student_tb SET grade = #{grade}, semester = #{semester}
    WHERE id = #{id}
    
} -- end of foreach


UPDATE student_tb SET grade = #{grade}, semester = #{semester}
WHERE id = #{studentId}
