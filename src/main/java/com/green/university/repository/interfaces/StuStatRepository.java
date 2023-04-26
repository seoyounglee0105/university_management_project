package com.green.university.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

import com.green.university.repository.model.StuStat;

/**
 * @author 서영
 * 학적 변동
 */
@Mapper
public interface StuStatRepository {

	// 해당 학생의 현재 학적 상태 조회
	public StuStat findByStudentIdOrderbyToDateDesc(Integer studentId);
	
	// 학생의 첫 학적 상태 생성
	public int insertFirstStatus(Integer studentId);
}
