package com.green.university.repository.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Professor {

	private Integer id;
	private String name;
	private Integer deptId;
	private Date hireDate;
}
