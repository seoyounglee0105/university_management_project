package com.green.university.dto;

import lombok.Data;

@Data
public class ScheduleFormDto {

	private Integer id;
	private String startDay;
	private String endDay;
	private String title;
	private String content;
}
