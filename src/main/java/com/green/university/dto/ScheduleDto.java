package com.green.university.dto;

import lombok.Data;

@Data
public class ScheduleDto {

	private Integer mouth;
	private Integer sum;
	private Integer id;
	private Integer staffId;
	private Integer year;
	private String startMday;
	private String endMday;
	private String startDay;
	private String endDay;
	private String information;
}
