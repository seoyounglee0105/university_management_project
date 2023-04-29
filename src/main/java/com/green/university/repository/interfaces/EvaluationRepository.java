package com.green.university.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.university.dto.EvaluationFormDto;
import com.green.university.dto.MyEvaluationDto;
import com.green.university.repository.model.Evaluation;

/**
 * 
 * @author 편용림
 *
 */
@Mapper
public interface EvaluationRepository {
	
	// 강의 평가 제출하기 
	public int insert(EvaluationFormDto evaluationFormDto);
	
	// 강의평가 했는지 조회
	public Evaluation checkevaluationBystudentIdAndsubjectId(Integer studentId);
	
	//교수 강의평가 조회
	public List<MyEvaluationDto> selectEvaluationFormDtoByprofessorId(Integer professorId);

}
