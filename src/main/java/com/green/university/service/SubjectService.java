package com.green.university.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.university.dto.AllSubjectSearchFormDto;
import com.green.university.dto.CurrentSemesterSubjectSearchFormDto;
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
		
		List<SubjectDto> subDtoList = subjectRepository.selectDtoAll();
		
		return subDtoList;
	}
	
	/**
	 * @param allSubjectSearchFormDto
	 * @return 전체 강의 목록에서 필터링할 때 출력할 강의
	 */
	@Transactional
	public List<SubjectDto> readSubjectListSearch(AllSubjectSearchFormDto allSubjectSearchFormDto) {
		
		List<SubjectDto> subDtoList = subjectRepository.selectDtoBySemesterAndDeptAndName(allSubjectSearchFormDto);
		
		return subDtoList;
	}
	
	
	/**
	 * @return 수강 신청에 사용할 강의 정보 (학생용)
	 * 현재 연도-학기에 해당하는 강의만 출력됨
	 */
	@Transactional
	public List<SubjectDto> readSubjectListByCurrentSemester() {
		
		List<SubjectDto> subDtoList = subjectRepository.selectDtoBySemester(Define.CURRENT_YEAR, Define.CURRENT_SEMESTER);
		
		return subDtoList;
	}
	
	/**
	 * @return 강의 시간표에서 필터링할 때 출력할 강의
	 */
	@Transactional
	public List<SubjectDto> readSubjectListSearchByCurrentSemester(CurrentSemesterSubjectSearchFormDto dto) {
		
		List<SubjectDto> subDtoList = subjectRepository.selectDtoBySemesterAndAndTypeAndDeptAndName(dto);
		
		return subDtoList;
	}
	
	
	
}
