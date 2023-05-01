package com.green.university.dto;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import lombok.Data;

/**
 * @author 서영
 * 전체 강의 조회에서 사용하는 검색 폼 dto
 */
@Data
public class AllSubjectSearchFormDto {

	@Min(2005)
	@Max(2023)
	@NotNull
	private Integer subYear;
	
	@Min(1)
	@Max(2)
	@NotNull
	private Integer semester;
	
	@NotNull
	private Integer deptId;
	
	@NotNull
	private String name;
	
	private Integer page;
	
}
