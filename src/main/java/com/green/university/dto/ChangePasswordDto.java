package com.green.university.dto;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class ChangePasswordDto {

	@NotBlank
	private String beforePassword;
	@NotBlank
	private String afterPassword;
	@NotBlank
	private String passwordCheck;
	private Integer id;
	
}
