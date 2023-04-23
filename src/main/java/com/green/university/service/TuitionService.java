package com.green.university.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.university.handler.exception.CustomRestfullException;
import com.green.university.repository.interfaces.ScholarshipRepository;
import com.green.university.repository.interfaces.TuitionRepository;
import com.green.university.repository.model.Scholarship;
import com.green.university.repository.model.Tuition;

/**
 * @author 서영
 * todo : develop에서 Define에 현재 연도/학기 상수 선언해서 하드코딩된 값 바꾸기
 */

@Service
public class TuitionService {

	@Autowired
	private TuitionRepository tuitionRepository;
	
	@Autowired
	private ScholarshipRepository scholarshipRepository;
	
	private final Integer CURRENT_YEAR = 2023;
	private final Integer CURRENT_SEMESTER = 1;
	
	/**
	 * @param studentId (principal의 id와 동일)
	 * @return 해당 학생의 등록금 납부 내역
	 */
	@Transactional
	public List<Tuition> readTuitionList(Integer studentId) {
		
		List<Tuition> tuitionEntityList = tuitionRepository.findByStudentId(studentId);
		
		return tuitionEntityList;
	}
	
	/**
	 * 등록금 고지서 생성
	 * 장학금 유형이 미리 정해져 있어야 함
	 * 교직원 탭에서 사용하도록 할 것
	 * 값은 모두 DB에서 받아오기 때문에 해당 과정에 대한 form 태그는 필요 없음 (장학금 유형 결정에는 필요)
	 * @param studentId (principal의 id와 동일)
	 */
	@Transactional
	public void createTuition(Integer studentId) {
		
		// 해당 학생의 학적 상태가 '재학'이 아니라면 생성하지 않음
		
		
		// 이미 해당 학기의 등록금 고지서가 존재한다면 생성하지 않음
		if (tuitionRepository.findByStudentIdAndSemester(studentId, CURRENT_YEAR, CURRENT_SEMESTER) != null) {
			throw new CustomRestfullException("이미 이번 학기의 등록금 고지서가 존재합니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		// 등록금액
		Integer tuiAmount = tuitionRepository.findTuiAmount(studentId).getAmount();
		
		// 장학금 유형과 최대 장학금액
		Scholarship scholarshipEntity = scholarshipRepository.findByStudentIdAndSemester(studentId, CURRENT_YEAR, CURRENT_SEMESTER);

		// 학생의 해당 학기 장학금 유형이 정해져 있지 않으면 생성하지 않음
		if (scholarshipEntity == null) {
			throw new CustomRestfullException("해당 학생의 장학금 유형이 확정되지 않았습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		// 장학금액
		Integer schAmount = scholarshipEntity.getMaxAmount();
		
		// 등록금액보다 최대 장학금액이 더 크다면
		if (tuiAmount < schAmount) {
			schAmount = tuiAmount;
		}
		
		// 등록금 고지서 생성
		Tuition tuition = new Tuition(studentId, CURRENT_YEAR, CURRENT_SEMESTER, tuiAmount, scholarshipEntity.getType(), schAmount); 
		System.out.println(tuition);
		
		int resultRowCount = tuitionRepository.insert(tuition);
		
		if (resultRowCount != 1) {
			throw new CustomRestfullException("등록금 고지서 생성 실패", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
}
