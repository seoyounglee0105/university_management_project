package com.green.university.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.university.dto.response.StudentInfoForProfessorDto;
import com.green.university.dto.response.SubjectForProfessorDto;
import com.green.university.dto.response.SubjectPeriodForProfessorDto;
import com.green.university.repository.interfaces.StuSubRepository;
import com.green.university.repository.interfaces.SubjectRepository;
import com.green.university.repository.model.Subject;
/**
 *  
 * @author 김지현
 */
@Service
public class ProfessorService {
	
	@Autowired
	private SubjectRepository subjectRepository;
	@Autowired
	private StuSubRepository stuSubRepository;
	
	/**
	 * 교수가 맡은 과목들의 학기 검색
	 * @param professorId
	 * @return SubjectPeriodForProfessorDto list
	 */
	@Transactional
	public List<SubjectPeriodForProfessorDto> selectSemester(Integer id) {
		List<SubjectPeriodForProfessorDto> list = subjectRepository.selectSemester(id);
		return list;
	}
	
	/**
	 * 년도와 학기, 교수 id를 이용하여 해당 과목의 정보 불러오기
	 * @param subjectPeriodForProfessorDto
	 * @return SubjectForProfessorDto list
	 */
	@Transactional
	public List<SubjectForProfessorDto> selectSubjectBySemester(SubjectPeriodForProfessorDto subjectPeriodForProfessorDto){
		List<SubjectForProfessorDto> list = subjectRepository.selectSubjectBySemester(subjectPeriodForProfessorDto);
		
		return list;
	}
	
	/**
	 * 해당 과목을 듣는 학생의 세부정보 리스트로 불러오기
	 * @param subjectId
	 * @return StudentInfoForProfessorDto list
	 */
	@Transactional
	public List<StudentInfoForProfessorDto> selectBySubjectId(Integer subjectId){
		List<StudentInfoForProfessorDto> list = stuSubRepository.selectBySubjectId(subjectId);
		
		return list;
	}
	
	/**
	 * 과목 id로 과목 Entity 불러오기
	 * @param id
	 * @return
	 */
	@Transactional
	public Subject selectSubjectById(Integer id) {
		Subject subjectEntity = subjectRepository.selectSubjectById(id);
		
		return subjectEntity;
	}

}
