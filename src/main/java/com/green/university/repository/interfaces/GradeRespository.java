package com.green.university.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.university.dto.response.GradeDto;
import com.green.university.repository.model.StuSub;

/**
 * 
 * @author 편용림
 *
 */

@Mapper
public interface GradeRespository {
	// 성적 조회
	public List<GradeDto> findByStudentId(Integer studentId);
	
}
