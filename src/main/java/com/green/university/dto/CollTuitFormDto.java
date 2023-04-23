package com.green.university.dto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import com.green.university.repository.model.College;

import lombok.Data;
/**
 * 
 * @author 박성희
 *
 */
@Data
public class CollTuitFormDto {
	@NotNull
	@NotBlank
	@NotEmpty
	private College collegeId;
	@NotNull
	@NotEmpty
	private Integer amount;
}
