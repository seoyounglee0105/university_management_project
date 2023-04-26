package com.green.university.dto;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Data;
/**
 * 
 * @author 박성희
 *
 */
@Data
public class NoticeFormDto {
	@NotEmpty
	@Size(max = 50)
	private String title;
	@NotEmpty
	private String content;
	@NotEmpty
	private String originFileName;
	@NotEmpty
	private String uuidFileName;
}
