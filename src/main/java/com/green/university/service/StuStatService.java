package com.green.university.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.university.handler.exception.CustomRestfullException;
import com.green.university.repository.interfaces.StuStatRepository;
import com.green.university.repository.interfaces.StudentRepository;
import com.green.university.repository.model.StuStat;

/**
 * @author 서영
 *
 */
@Service
public class StuStatService {

	@Autowired
	private StuStatRepository stuStatRepository;
	
	@Autowired
	private StudentRepository studentRepository;
	
	/**
	 * @param studentId
	 * @return 해당 학생의 현재 학적 상태 (.getStatus())
	 */
	@Transactional
	public StuStat readCurrentStatus(Integer studentId) {

		StuStat stuStatEntity = stuStatRepository.findByStudentIdOrderbyToDateDesc(studentId);
		
		return stuStatEntity;
	}
	
	/**
	 * 임시로 여기서 만듦, 나중에 StudentService로 옮기기
	 */
	public List<Integer> readIdList() {
		
		List<Integer> idList = studentRepository.selectIdList();
		
		return idList;
	}
	
	/*
	 * 처음 학생이 생성될 때 학적 상태 지정 (재학)
	 *
	 * 첫 학적 상태 저장과 이후 변동 사항을 저장할 때의 메서드를 분리한 이유는
	 * 이후 변동 사항을 지정할 때에는 기존의 상태 데이터의 toDate를 현재 날짜로 
	 * 바꿔주는 작업이 추가로 필요하기 때문임
	 */
	@Transactional
	public void createFirstStatus(Integer studentId) {
		
		int resultRowCount = stuStatRepository.insertFirstStatus(studentId);
		
		if (resultRowCount != 1) {
			throw new CustomRestfullException("학적 상태 생성 실패", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
}
