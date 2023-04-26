package com.green.university.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.university.dto.response.SubjectDto;
import com.green.university.repository.interfaces.SubjectRepository;
import com.green.university.utils.Define;

/**
 * @author 서영
 */

@Service
public class SubjectService {
	
	@Autowired
	private SubjectRepository subjectRepository;

	/**
	 * @return 전체 강의 조회에 사용할 강의 정보 (학생용)
	 * 전체 연도-학기에 해당하는 강의가 출력됨
	 */
	@Transactional
	public List<SubjectDto> readSubjectList() {
		
		List<SubjectDto> subDtoList = subjectRepository.findDtoAll();
		
		System.out.println(subDtoList.get(0));
		
		return subDtoList;
	}
	
	/**
	 * @return 수강 신청에 사용할 강의 정보 (학생용)
	 * 현재 연도-학기에 해당하는 강의만 출력됨
	 */
	@Transactional
	public List<SubjectDto> readSubjectListByCurrentSemester() {
		
		List<SubjectDto> subDtoList = subjectRepository.findDtoByCurrentSemester(Define.CURRENT_YEAR, Define.CURRENT_SEMESTER);
		
		System.out.println(subDtoList.get(0));
		
		return subDtoList;
	}
	
	
}
