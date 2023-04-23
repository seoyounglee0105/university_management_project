package com.green.university.dto;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
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
public class SubjectFormDto {
	@NotNull
	@NotEmpty
	@Size(min=2, max=20)
	private String name;
	@NotNull
	@NotEmpty
	@Min(10000000)
	@Max(99999999)
	private Integer professorId;
	@Size(max = 5)
	private String roomId;
	@NotNull
	@NotEmpty
	private Integer deptId;
	@NotNull
	@NotEmpty
	@Size(max = 2)
	private String type;
	@NotNull
	@NotEmpty
	@Min(4)
	@Max(4)
	private Integer subYear;
	@NotNull
	@NotEmpty
	@Min(1)
	@Max(2)
	private Integer semester;
	@NotNull
	@NotEmpty
	@Size(max = 30)
	private String time;
	@NotNull
	@NotEmpty
	private Integer grades;
	@NotNull
	@NotEmpty
	private Integer capacity;
	@NotNull
	@NotEmpty
	private Integer numOfStudent;
}
