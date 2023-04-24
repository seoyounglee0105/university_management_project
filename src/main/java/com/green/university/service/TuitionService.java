package com.green.university.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.university.handler.exception.CustomRestfullException;
import com.green.university.repository.interfaces.ScholarshipRepository;
import com.green.university.repository.interfaces.TuitionRepository;
import com.green.university.repository.model.BreakApp;
import com.green.university.repository.model.Scholarship;
import com.green.university.repository.model.StuStat;
import com.green.university.repository.model.Tuition;
import com.green.university.utils.Define;

/**
 * @author 서영
 */

@Service
public class TuitionService {

	@Autowired
	private TuitionRepository tuitionRepository;
	
	@Autowired
	private ScholarshipRepository scholarshipRepository;

	@Autowired
	private StuStatService stuStatService;
	
	@Autowired
	private BreakAppService breakAppService;
	
	/**
	 * @param studentId (principal의 id와 동일)
	 * @return 해당 학생의 모든 등록금 납부 내역
	 */
	@Transactional
	public List<Tuition> readTuitionList(Integer studentId) {
		
		List<Tuition> tuitionEntityList = tuitionRepository.findByStudentId(studentId);
		
		return tuitionEntityList;
	}
	
	/**
	 * @param studentId (principal의 id와 동일)
	 * @return 해당 학생의 납부 여부에 따른 등록금 납부 내역
	 */
	@Transactional
	public List<Tuition> readTuitionListByStatus(Integer studentId, Boolean status) {
		
		List<Tuition> tuitionEntityList = tuitionRepository.findByStudentIdAndStatus(studentId, status);
		
		return tuitionEntityList;
	}
	
	/**
	 * @return 해당 학생의 현재 학기 등록금 고지서
	 */
	@Transactional
	public Tuition readByStudentIdAndSemester(Integer studentId, Integer tuiYear, Integer semester) {
		
		Tuition tuitionEntity = tuitionRepository.findByStudentIdAndSemester(studentId, tuiYear, semester);
		
		return tuitionEntity;
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
		
		// 해당 학생의 학적 상태가 '졸업' 또는 '자퇴'라면 생성하지 않음
		StuStat stuStatEntity = stuStatService.readCurrentStatus(studentId);
		if (stuStatEntity.getStatus().equals("졸업") || stuStatEntity.getStatus().equals("자퇴")) {
			return;
		}
		
		// 해당 학생이 현재 학기 휴학을 승인받은 상태라면 생성하지 않음
		List<BreakApp> breakAppList = breakAppService.readByStudentId(studentId); // 최근 순으로 정렬되어 있음
		for (BreakApp b : breakAppList) {
			// 휴학 신청이 승인된 상태일 때
			if (b.getStatus().equals("승인")) {
				// 휴학 종료 연도가 현재 연도보다 이후라면 생성하지 않음
				if (b.getToYear() > Define.CURRENT_YEAR) {
					return;
				// 휴학 종료 연도가 현재 연도와 같을 경우
				} else if (b.getToYear() == Define.CURRENT_YEAR) {
					// 현재 학기 == 1 && 종료 학기 == 1이면 생성하지 않음
					// 현재 학기 == 1 && 종료 학기 == 2이면 생성하지 않음
					// 현재 학기 == 2 && 종료 학기 == 1이면 생성함
					// 현재 학기 == 2 && 종료 학기 == 2이면 생성하지 않음
					if (b.getToSemester() >= Define.CURRENT_SEMESTER) {
						return;
					}
				}
			}
		}
		
		// 이미 해당 학기의 등록금 고지서가 존재한다면 생성하지 않음
		if (readByStudentIdAndSemester(studentId, Define.CURRENT_YEAR, Define.CURRENT_SEMESTER) != null) {
			return;
		}
		
		// 등록금액
		Integer tuiAmount = tuitionRepository.findTuiAmount(studentId).getAmount();
		
		// 장학금 유형과 최대 장학금액
		Scholarship scholarshipEntity = scholarshipRepository.findByStudentIdAndSemester(studentId, Define.CURRENT_YEAR, Define.CURRENT_SEMESTER);

		// 학생의 해당 학기 장학금 유형이 정해져 있지 않으면 생성하지 않음
		if (scholarshipEntity == null) {
			return;
		}
		
		// 장학금액
		Integer schAmount = scholarshipEntity.getMaxAmount();
		
		// 등록금액보다 최대 장학금액이 더 크다면
		if (tuiAmount < schAmount) {
			schAmount = tuiAmount;
		}
		
		// 등록금 고지서 생성
		Tuition tuition = new Tuition(studentId, Define.CURRENT_YEAR, Define.CURRENT_SEMESTER, tuiAmount, scholarshipEntity.getType(), schAmount); 
		System.out.println(tuition);
		
		int resultRowCount = tuitionRepository.insert(tuition);
		
	}
	
	@Transactional
	public void updateStatus(Integer studentId) {
		
		int resultRowCount = tuitionRepository.updateStatus(studentId, Define.CURRENT_YEAR, Define.CURRENT_SEMESTER);
		
		if (resultRowCount != 1) {
			throw new CustomRestfullException("납부 실패", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
}
