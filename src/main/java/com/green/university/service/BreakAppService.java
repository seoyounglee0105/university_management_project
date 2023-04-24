package com.green.university.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.university.dto.BreakAppFormDto;
import com.green.university.handler.exception.CustomRestfullException;
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
	public void createBreakApp(BreakAppFormDto breakAppFormDto) {
		
		// 학생이 재학 상태가 아니라면 신청 불가능
		
		
		
		// 이미 신청 내역이 있다면 신청 불가능
		
		
		int resultRowCount = breakAppRepository.insert(breakAppFormDto);
		
		if (resultRowCount != 1) {
			throw new CustomRestfullException("휴학 신청이 실패했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	
	/**
	 * @param studentId
	 * 해당 학생의 휴학 신청 내역 조회
	 */
	@Transactional
	public List<BreakApp> readByStudentId(Integer studentId) {
		
		List<BreakApp> breakAppEntityList = breakAppRepository.findByStudentId(studentId);
		
		return breakAppEntityList;
	}
	
	/**
	 * @param status
	 * 처리하지 않은 휴학 신청 내역 조회 (교직원용)
	 */
	@Transactional
	public List<BreakApp> readByStatus(String status) {
		
		List<BreakApp> breakAppEntityList = breakAppRepository.findByStatus(status);
		
		return breakAppEntityList;
	}
	
	/**
	 * @param id
	 * 특정 휴학 신청서 조회
	 */
	@Transactional
	public BreakApp readById(Integer id) {
		
		BreakApp breakAppEntity = breakAppRepository.findById(id);
		
		return breakAppEntity;
	}
	
	/**
	 * 아직 처리되지 않은 휴학 신청 취소 (학생)
	 */
	@Transactional
	public void deleteById(Integer id) {
		
		// 신청서의 학번과 현재 로그인된 아이디가 일치하는지 확인
		
		// 처리중 상태인지 확인
		
		int resultRowCount = breakAppRepository.deleteById(id);
		
		if (resultRowCount != 1) {
			throw new CustomRestfullException("신청이 취소되지 않았습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	/**
	 * 휴학 신청 처리 (교직원)
	 */
	@Transactional
	public void updateById(Integer id, String status) {
		
		int resultRowCount = breakAppRepository.updateById(id, status);
		
		if (resultRowCount != 1) {
			throw new CustomRestfullException("신청이 처리되지 않았습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	
	
}
