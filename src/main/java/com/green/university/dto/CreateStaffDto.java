package com.green.university.dto;

import java.sql.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class CreateStaffDto {

	@NotEmpty
	@NotNull
	@Size(min = 2, max= 30)
	private String name;
	private Date birthDate;
	private String gender;
	@NotNull
	@NotEmpty
	private String address;
	@NotNull
	@NotEmpty
	@NotBlank
	private String tel;
	
}
