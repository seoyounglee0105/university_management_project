package com.green.university.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.university.dto.DepartmentFormDto;
import com.green.university.repository.model.CollTuit;
import com.green.university.repository.model.Department;

/*
 *  박성희
 *  학과 repository
 */

@Mapper
public interface DepartmentRepository {
	public int insert(DepartmentFormDto departmentFormDto);
	
	public Department selectById(Integer id);
	public List<Department> findAll();
	public int delete(Integer id);
	public int update(DepartmentFormDto departmentFormDto);
}
