package com.green.university.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.university.repository.model.StuStat;

/**
 * @author 서영
 * 학적 변동
 */
@Mapper
public interface StuStatRepository {

	// 해당 학생의 현재 학적 상태 조회
	public StuStat findByStudentIdOrderbyToDateDesc(Integer studentId);
	
	// 학생의 학적 상태 생성
	public int insert(@Param("studentId") Integer studentId, @Param("status") String status, @Param("toDate") String toDate);

	// 학생의 기존 학적 상태의 to_date를 now()로 변경 
	public int updateOldStatus(Integer id);
	
}
