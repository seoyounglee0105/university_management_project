package com.green.university.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.university.repository.interfaces.TuitionRepository;
import com.green.university.repository.model.Tuition;

/**
 * @author 서영
 */

@Service
public class TuitionService {

	@Autowired
	private TuitionRepository tuitionRepository;
	
	/**
	 * @param studentId (principal의 id와 동일)
	 * @return 해당 학생의 등록금 납부 내역
	 */
	@Transactional
	public List<Tuition> readTuitionList(Integer studentId) {
		
		List<Tuition> list = tuitionRepository.findByStudentId(studentId);
		
		return list;
	}
	
	
}
