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
		List<GradeDto> gradeEntityList = gradeRespository.findByStudentIdAndsemester(studentId,CURRENT_SEMESTER,CURRENT_YEAR);
		return gradeEntityList;
	}
	
	public List<GradeDto> findAll(Integer studentId){
		List<GradeDto> gradeEntityAllList = gradeRespository.findByAll(studentId);
		return gradeEntityAllList;
	}
	
	public List<GradeDto> selectBygrade(Integer studentId,Integer subYear, Integer grade, String type){
		List<GradeDto> selectgradeList = gradeRespository.chioceByGrade(studentId, subYear, grade, type);
		return selectgradeList;
	}
	
	
	@Transactional
	public List<GradeDto> readGradeListBySubYear(Integer studentId, Integer subYear){
		List<GradeDto> gradeEntityList = gradeRespository.findBysubYear(studentId, subYear);
		return gradeEntityList;
	}
	
	@Transactional
	public List<GradeDto> readGradeListBysemester(Integer studentId, Integer semester){
		List<GradeDto> gradeEntityList = gradeRespository.findBysemester(studentId, semester);
		return gradeEntityList;
	}
	
	@Transactional
	public List<GradeDto> readGradeListByType(Integer studentId, String type){
		List<GradeDto> gradeEntityList = gradeRespository.findByType(studentId, type);
		return gradeEntityList;
	}
	
	@Transactional
	public List<GradeDto> readSubYear(Integer StudentId){
		List<GradeDto> yearEntityList = gradeRespository.findByyear(StudentId);
		return yearEntityList;
	}
}
