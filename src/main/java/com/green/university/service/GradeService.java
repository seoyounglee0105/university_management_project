package com.green.university.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.university.dto.response.GradeDto;
import com.green.university.repository.interfaces.GradeRespository;

@Service
public class GradeService {
	
	@Autowired
	private GradeRespository gradeRespository;
	
	private final Integer CURRENT_YEAR = 2023;
	private final Integer CURRENT_SEMESTER = 1;
	
	@Transactional
	public List<GradeDto> readStuSubList(Integer studentId){
		List<GradeDto> gradeEntityList = gradeRespository.findByStudentId(studentId);
		return gradeEntityList;
	}
}
