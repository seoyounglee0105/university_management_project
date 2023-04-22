package com.green.university.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.university.repository.model.CollTuit;
import com.green.university.repository.model.Tuition;

/**
 * @author 서영
 *
 */

@Mapper
public interface TuitionRepository {

	// 특정 학생의 등록금 내역 조회
	public List<Tuition> findByStudentId(Integer studentId);
	
	// 학생의 학과-단과대를 기준으로 등록금액 조회
	public CollTuit findTuiAmount(Integer studentId);
	
	// 등록금 고지서 생성 --> 학생 추가할 때 생기게 할지 ?..
	public int insert(Tuition tuition);

	// 등록금 고지서 생성 여부 확인
	public Tuition findByStudentIdAndSemester(@Param("studentId") Integer studentId, @Param("tuiYear") Integer tuiYear, @Param("semester") Integer semester);
	
}