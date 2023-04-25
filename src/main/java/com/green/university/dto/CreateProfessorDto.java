package com.green.university.dto;

import java.sql.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Data;

/**
 * professor_tb insert용
 * @author 김지현
 *
 */
@Data
public class CreateProfessorDto {

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
	@Min(100)
	@Max(999)
	private Integer deptId;
	@Email
	private String email;
	
}
