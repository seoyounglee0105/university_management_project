package com.green.university.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.university.repository.interfaces.CollegeRepository;
import com.green.university.repository.interfaces.DepartmentRepository;
import com.green.university.repository.model.College;
import com.green.university.repository.model.Department;

/**
 * 
 * @author 서영
 *
 */

@Service
public class CollegeService {
	
	@Autowired
	private CollegeRepository collegeRepository;

	@Autowired
	private DepartmentRepository departmentRepository;
	
	/**
	 * @param id
	 * @return id로 단과대 정보 가져옴
	 */
	public College readCollById(Integer id) {
		
		College collEntity = collegeRepository.findById(id);
		return collEntity;
	}
	
	public Department readDeptById(Integer id) {
		
		Department deptEntity = departmentRepository.selectById(id);
		return deptEntity;
	}
	
}
