package com.green.university.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

import com.green.university.dto.DepartmentFormDto;
import com.green.university.repository.model.Department;

/*
 *  박성희
 *  학과 repository
 */

@Mapper
public interface DepartmentRepository {
	public int insert(DepartmentFormDto departmentFormDto);
	
	public Department selectById(Integer id);
}
