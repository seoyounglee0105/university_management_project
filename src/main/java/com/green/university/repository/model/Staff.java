package com.green.university.repository.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Staff {

	private Integer id;
	private String name;
	private Date hireDate;
	
}
