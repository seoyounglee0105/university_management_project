package com.green.university.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.university.repository.model.Tuition;

@Mapper
public interface TuitionRepository {

	// 특정 학생의 등록금 내역 조회
	public List<Tuition> findByStudentId(Integer studentId);

}
