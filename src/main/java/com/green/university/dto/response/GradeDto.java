package com.green.university.dto.response;

import lombok.Data;

@Data
public class GradeDto {
	
	private Integer subYear;
	private Integer semester;
	private Integer subjectId;
	private String name;
	private String type;
	private String grade;
	private String gradeValue;
}
