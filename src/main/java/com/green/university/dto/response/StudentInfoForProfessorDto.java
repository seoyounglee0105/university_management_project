package com.green.university.dto.response;

import lombok.Data;

/**
 * 과목에 대한 학생의 디테일한 정보(교수 조회, 입력용)
 * @author 김지현
 */
@Data
public class StudentInfoForProfessorDto {

	private Integer id;
	private Integer studentId;
	private String studentName;
	// 학생 소속
	private String deptName;
	private Integer absent;
	private Integer lateness;
	private Integer midExam;
	private Integer finalExam;
	private Integer convertedMark;
	
}
