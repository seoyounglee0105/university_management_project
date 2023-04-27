package com.green.university.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.university.dto.response.PreStuSubDayTimeDto;
import com.green.university.dto.response.PreStuSubSumGradesDto;
import com.green.university.handler.exception.CustomRestfullException;
import com.green.university.repository.interfaces.PreStuSubRepository;
import com.green.university.repository.interfaces.SubjectRepository;
import com.green.university.repository.model.PreStuSub;
import com.green.university.repository.model.Subject;
import com.green.university.utils.Define;

/**
 * @author 서영
 *
 */
@Service
public class PreStuSubService {

	@Autowired
	private PreStuSubRepository preStuSubRepository;
	
	@Autowired
	private SubjectRepository subjectRepository;
	
	@Autowired
	private SubjectService subjectService;
	
	
	// 학생의 예비 수강신청 내역에 해당 강의가 존재하는지 확인
	public PreStuSub readPreStuSub(Integer studentId, Integer subjectId) {
		
		PreStuSub preStuSubEntity = preStuSubRepository.selectByStudentIdAndSubjectId(studentId, subjectId);
		
		return preStuSubEntity;
	}
	
	// 학생의 전체 예비 수강신청 내역 조회
	public List<PreStuSub> readPreStuSubList(Integer studentId) {
		
		List<PreStuSub> preStuSubList = preStuSubRepository.selectListByStudentId(studentId);
		
		return preStuSubList;
	}
	
	// 학생의 예비 수강신청 내역 추가
	@Transactional
	public void createPreStuSub(Integer studentId, Integer subjectId) {
		
		// 신청 대상 과목 정보
		Subject targetSubject = subjectRepository.selectSubjectById(subjectId);
		
		// 최대 수강 가능 학점을 넘지 않는지 확인
		
		// 현재 총 신청 학점 구하기
		PreStuSubSumGradesDto preStuSubSumGradesDto = preStuSubRepository.selectSumGrades(studentId, Define.CURRENT_YEAR, Define.CURRENT_SEMESTER);
		// 신청 내역이 있다면
		if (preStuSubSumGradesDto != null) {
			int sumGrades = preStuSubSumGradesDto.getSumGrades();
			
			// 신청하려는 강의의 학점
			int subGrades = targetSubject.getGrades();
			
			// 현재 학점 + 신청 강의 학점이 최대 수강 가능 학점을 초과한다면
			if ((sumGrades + subGrades) > Define.MAX_GRADES) {
				throw new CustomRestfullException("신청 가능한 최대 학점을 초과했습니다.", HttpStatus.BAD_REQUEST);
			}
		}
		
		// 현재 학생의 시간표와 겹치지 않는지 확인
		// 예비 수강 신청 내역은 연도/학기를 체크하지 않아도 됨 (연도/학기별로 초기화시키므로)
		// start_time ~ end_time을 정수형 배열로 생성해서 contains로 확인하기 ?
		
		// 해당 학생의 예비 수강 신청 내역 시간표
		List<PreStuSubDayTimeDto> dayTimeList = preStuSubRepository.selectDayTime(studentId);
		
		// 신청 대상 과목의 시간 배열
		List<Integer> targetTimeList = new ArrayList<>();
		for (int i = targetSubject.getStartTime(); i <= targetSubject.getEndTime(); i++) {
			targetTimeList.add(i);
		}

		// 신청 내역 시간표를 돌면서, 신청 대상 과목의 요일과 겹치는지 확인
		
		List<Integer> checkDayList = new ArrayList<>();
		
		for (int i = 0; i < dayTimeList.size(); i++) {
			if (dayTimeList.get(i).equals(targetSubject.getSubDay())) {
				checkDayList.add(1);
				// 1이면 체크 대상
			} else {
				checkDayList.add(0);
			}
		}
		
		for (int i = 0; i < checkDayList.size(); i++) {
			
			// 요일이 겹쳐서 시간을 체크해야 함
			// i번째 값이 1이라면, dayTimeList에서 i번째 신청내역과목을 체크함
			if (checkDayList.get(i) == 1) {
				// 시작시간과 끝시간이 동일하다면 체크 X
				if (dayTimeList.get(i).getStartTime().intValue() == targetSubject.getEndTime().intValue()
					|| dayTimeList.get(i).getEndTime().intValue() == targetSubject.getStartTime().intValue()) {
					continue;
				}
				
				for (Integer j : targetTimeList) {
					if (dayTimeList.get(i).timeList().contains(j)) {
						throw new CustomRestfullException("이전에 신청한 강의와 시간이 중복됩니다.", HttpStatus.BAD_REQUEST);
					}
				}
			}
		}
		
		// 수강신청 내역 추가
		int resultRowCount = preStuSubRepository.insert(studentId, subjectId);
		
		// 해당 강의 현재인원 +1
		subjectService.updatePlusNumOfStudent(subjectId);
		
		if (resultRowCount != 1) {
			throw new CustomRestfullException("예비 수강신청이 실패했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	// 학생의 예비 수강신청 내역 삭제
	@Transactional
	public void deletePreStuSub(Integer studentId, Integer subjectId) {
		
		// 수강신청 내역 삭제
		int resultRowCount = preStuSubRepository.delete(studentId, subjectId);
		
		// 해당 강의 현재인원 -1
		subjectService.updateMinusNumOfStudent(subjectId);
		
		if (resultRowCount != 1) {
			throw new CustomRestfullException("예비 수강신청 취소가 실패했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
}
