package com.green.university.dto;

import java.sql.Timestamp;

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
	private Integer id;
	private String category;
	@NotEmpty
	@Size(max = 50)
	private String title;
	@NotEmpty
	private String content;
	
	private String originFileName;
	
	private String uuidFileName;
	private Timestamp createdTime;
}
