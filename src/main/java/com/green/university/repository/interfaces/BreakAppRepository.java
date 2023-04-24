package com.green.university.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.university.dto.BreakAppFormDto;
import com.green.university.repository.model.BreakApp;

/**
 * @author 서영
 *
 */
@Mapper
public interface BreakAppRepository {

	// 휴학 신청하기
	public int insert(BreakAppFormDto breakAppFormDto);
	
	// 자신의 휴학 신청 조회하기
	public List<BreakApp> findByStudentId(Integer studentId);
	
	// 특정 휴학 신청서 조회하기
	public BreakApp findById(Integer id);
	
}
