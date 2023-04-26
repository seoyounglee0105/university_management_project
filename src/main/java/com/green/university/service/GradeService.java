package com.green.university.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.university.dto.GradecheckFormDto;
import com.green.university.dto.response.GradeDto;
import com.green.university.dto.response.MyGradeDto;
import com.green.university.repository.interfaces.GradeRespository;

@Service
public class GradeService {
	
	
	
	@Autowired
	private GradeRespository gradeRespository;
	
	private final Integer CURRENT_YEAR = 2023;
	private final Integer CURRENT_SEMESTER = 1;
	
	// 금학기 성적 조회
	@Transactional
	public List<GradeDto> readStuSubList(Integer studentId){
		List<GradeDto> gradeEntityList = gradeRespository.findByStudentIdAndsemester(studentId, CURRENT_SEMESTER, CURRENT_YEAR);
		return gradeEntityList;
	}
	
	// 누계성적 조회
	@Transactional
	public MyGradeDto readSumAndAverageByGrade(Integer studentId) {
		System.out.println(studentId);
		System.out.println(CURRENT_YEAR);
		System.out.println(CURRENT_SEMESTER);
		MyGradeDto mygradeEntity = gradeRespository.SumAndAverageBymyGrade(studentId, CURRENT_YEAR, CURRENT_SEMESTER);
		System.out.println(mygradeEntity.toString());
		return mygradeEntity;
	}
	
	// 학기별성적조회 처음에 전부 조회
	@Transactional
	public List<GradeDto> findAll(Integer studentId){
		List<GradeDto> gradeEntityAllList = gradeRespository.findByAll(studentId);
		return gradeEntityAllList;
	}
	
	// 학기별성적조회 조회하면 찾는 거
	@Transactional
	public List<GradeDto> selectBygrade(Integer studentId, Integer subYear, Integer semeter, String type){
		List<GradeDto> selectgradeList = gradeRespository.chioceByGrade(studentId,subYear,semeter,type);
		return selectgradeList;
	}
	
	// 만약에 타입 전체 선택하면 조회
	@Transactional
	public List<GradeDto> selectBygradeBytypeAll(Integer studentId, Integer subYear, Integer semeter){
		List<GradeDto> selectgradeList = gradeRespository.chioceByGradeAlltype(studentId, subYear, semeter);
		return selectgradeList;
	}
	
	// 학생이 수강 신청한 연도 조회
	@Transactional
	public List<GradeDto> readSubYear(Integer StudentId){
		List<GradeDto> yearEntityList = gradeRespository.findByyear(StudentId);
		return yearEntityList;
	}
	
	// 학생이 수강 신청한 학기 조회
	@Transactional
	public List<GradeDto> readSesmeter(Integer StudentId){
		List<GradeDto> semesterEntityList = gradeRespository.findsemester(StudentId);
		return semesterEntityList;
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
	
	
}
