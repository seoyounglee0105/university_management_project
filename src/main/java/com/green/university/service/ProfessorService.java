package com.green.university.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.university.dto.response.SubjectForProfessorDto;
import com.green.university.dto.response.SubjectPeriodForProfessorDto;
import com.green.university.repository.interfaces.SubjectRepository;

@Service
public class ProfessorService {
	
	@Autowired
	private SubjectRepository subjectRepository;
	
	@Transactional
	public List<SubjectPeriodForProfessorDto> selectSemester(Integer id) {
		List<SubjectPeriodForProfessorDto> list = subjectRepository.selectSemester(id);
		return list;
	}
	
	public List<SubjectForProfessorDto> selectSubjectBySemester(SubjectPeriodForProfessorDto subjectPeriodForProfessorDto){
		List<SubjectForProfessorDto> list = subjectRepository.selectSubjectBySemester(subjectPeriodForProfessorDto);
		
		return list;
	}

}
