package com.green.university.repository.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Student {
	
	private Integer id;
	private String name;
	private String birthDate;
	private String gender;
	private String address;
	private String tel;
	private Integer deptId;
	private Integer grade;
	private Integer semester;
	private Date entranceDate;
	private Date graduationDate;
}
