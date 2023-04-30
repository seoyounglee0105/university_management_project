package com.green.university.dto;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class LoginDto {

	@Min(99999)
	private Integer id;
	@NotBlank
	private String password;
	private String rememberId;
	
}
