package com.green.university.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

		StuStat stuStatEntity = stuStatRepository.findByStudentIdOrderbyToDateDESC(studentId);
		
		return stuStatEntity;
	}
	
	/**
	 * 임시로 여기서 만듦, 나중에 StudentService로 옮기기
	 */
	public List<Integer> readIdList() {
		
		List<Integer> idList = studentRepository.selectIdList();
		
		return idList;
	}
	
}
