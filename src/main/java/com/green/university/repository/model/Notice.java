package com.green.university.repository.model;

import java.security.Timestamp;

import lombok.Data;

@Data
public class Notice {

	private Integer id;
	private String title;
	private String content;
	private Integer views;
	private Timestamp createdTime;
	
}
