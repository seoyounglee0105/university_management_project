package com.green.university.dto;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class LoginDto {

	@NotBlank
	private Integer userId;
	@NotBlank
	private String password;
	
}
