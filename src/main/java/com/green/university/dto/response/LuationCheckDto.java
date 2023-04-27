package com.green.university.dto.response;

import lombok.Data;
/**
 * 
 * @author 편용림
 * 강의 평가를 했는지 확인하는 Dto
 */
@Data
public class LuationCheckDto {

	private Integer studentId;
	private Integer subjectId;
	
}
