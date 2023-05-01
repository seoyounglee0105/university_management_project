package com.green.university.dto;

import lombok.Data;

@Data
public class ScheduleFormDto {

	private Integer id;
	private Integer staffId;
	private Integer year;
	private Integer mouth;
	private String day;
	private String content;
	
}
