package com.green.university.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.university.dto.EvaluationFormDto;
import com.green.university.dto.response.LuationCheckDto;
import com.green.university.handler.exception.CustomRestfullException;
import com.green.university.repository.interfaces.EvaluationRepository;
import com.green.university.repository.model.Evaluation;

@Service
public class EvaluationService {

	@Autowired
	private EvaluationRepository evaluationRepository;
	
	@Transactional
	public void createEvanluation(EvaluationFormDto evaluationFormDto) {
		
		int resultRowcount = evaluationRepository.insert(evaluationFormDto);
		
		if (resultRowcount != 1) {
			throw new CustomRestfullException("강의평가 등록이 실패하였습니다", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@Transactional
	public Evaluation readEvaluationByStudentIdAndSubjectId(Integer studentId) {
		Evaluation evaluation = evaluationRepository.checkevaluationBystudentIdAndsubjectId(studentId);
		return evaluation;
	}
}
