package com.green.university.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.university.dto.response.StuSubAppDto;
import com.green.university.dto.response.StuSubDayTimeDto;
import com.green.university.dto.response.StuSubSumGradesDto;
import com.green.university.handler.exception.CustomRestfullException;
import com.green.university.repository.interfaces.PreStuSubRepository;
import com.green.university.repository.interfaces.StuSubRepository;
import com.green.university.repository.interfaces.SubjectRepository;
import com.green.university.repository.model.PreStuSub;
import com.green.university.repository.model.StuSub;
import com.green.university.repository.model.Subject;
import com.green.university.utils.Define;
import com.green.university.utils.StuSubUtil;

/**
 * @author 서영
 *
 */
@Service
public class StuSubService {

	@Autowired
	private StuSubRepository stuSubRepository;
	
	@Autowired
	private SubjectRepository subjectRepository;
	
	@Autowired
	private SubjectService subjectService;
	
	
	// 학생의 수강신청 내역에 해당 강의가 존재하는지 확인
	public StuSub readStuSub(Integer studentId, Integer subjectId) {
		
		StuSub stuSubEntity = stuSubRepository.selectByStudentIdAndSubjectId(studentId, subjectId);
		
		return stuSubEntity;
	}
	
	// 학생의 해당 학기 수강신청 내역 조회
	public List<StuSubAppDto> readStuSubList(Integer studentId) {
		
		List<StuSubAppDto> stuSubList = stuSubRepository.selectListByStudentIdAndSemester(studentId, Define.CURRENT_YEAR, Define.CURRENT_SEMESTER);
		
		return stuSubList;
	}
	
	// 학생의 수강신청 내역 추가
	@Transactional
	public void createStuSub(Integer studentId, Integer subjectId) {
		
		// 신청 대상 과목 정보
		Subject targetSubject = subjectRepository.selectSubjectById(subjectId);
		
		// 현재 총 신청 학점
		StuSubSumGradesDto stuSubSumGradesDto = stuSubRepository.selectSumGrades(studentId, Define.CURRENT_YEAR, Define.CURRENT_SEMESTER);
		
		// 최대 수강 가능 학점을 넘지 않는지 확인
		StuSubUtil.checkSumGrades(targetSubject, stuSubSumGradesDto);
		
		// 해당 학생의 예비 수강 신청 내역 시간표
		List<StuSubDayTimeDto> dayTimeList = stuSubRepository.selectDayTime(studentId, Define.CURRENT_YEAR, Define.CURRENT_SEMESTER);
		
		// 현재 학생의 시간표와 겹치지 않는지 확인
		StuSubUtil.checkDayTime(targetSubject, dayTimeList);
		
		// 수강신청 내역 추가
		int resultRowCount = stuSubRepository.insert(studentId, subjectId);
		
		// 신청 대상 과목의 정원이 다 찼다면 신청 불가
		if (targetSubject.getNumOfStudent() >= targetSubject.getCapacity()) {
			throw new CustomRestfullException("정원이 초과되었습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		// 해당 강의 현재인원 +1
		subjectService.updatePlusNumOfStudent(subjectId);
		
		if (resultRowCount != 1) {
			throw new CustomRestfullException("수강신청이 실패했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	// 학생의 수강신청 내역 삭제
	@Transactional
	public void deleteStuSub(Integer studentId, Integer subjectId) {
		
		// 수강신청 내역 삭제
		int resultRowCount = stuSubRepository.delete(studentId, subjectId);
		
		// 해당 강의 현재인원 -1
		subjectService.updateMinusNumOfStudent(subjectId);
		
		if (resultRowCount != 1) {
			throw new CustomRestfullException("예비 수강신청 취소가 실패했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
}
