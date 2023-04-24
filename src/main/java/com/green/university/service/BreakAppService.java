package com.green.university.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.university.dto.BreakAppFormDto;
import com.green.university.repository.interfaces.BreakAppRepository;
import com.green.university.repository.model.BreakApp;

/**
 * @author 서영
 *
 */

@Service
public class BreakAppService {

	@Autowired
	private BreakAppRepository breakAppRepository;
	
	/**
	 * @param breakAppFormDto
	 * 휴학 신청
	 */
	@Transactional
	public int createBreakApp(BreakAppFormDto breakAppFormDto) {
		
		// 학생이 재학 상태가 아니라면 신청 불가능
		
		
		
		// 이미 신청 내역이 있다면 신청 불가능
		
		
		int resultCount = breakAppRepository.insert(breakAppFormDto);
		
		return resultCount;
	}
	
	/**
	 * @param studentId
	 * 해당 학생의 휴학 신청 내역 조회
	 */
	public List<BreakApp> readByStudentId(Integer studentId) {
		
		List<BreakApp> breakAppEntityList = breakAppRepository.findByStudentId(studentId);
		
		return breakAppEntityList;
	}
	
	/**
	 * @param id
	 * 특정 휴학 신청서 조회
	 */
	public BreakApp readById(Integer id) {
		
		BreakApp breakAppEntity = breakAppRepository.findById(id);
		
		return breakAppEntity;
	}
	
	
}
