package com.green.university.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

import com.green.university.dto.UpdateStudentGradeDto;

/**
 * stu_sub_detail_tb DAO
 * @author 김지현
 *
 */
@Mapper
public interface StuSubDetailRepository {
	
	// 학생 성적 업데이트
	int updateGrade(UpdateStudentGradeDto updateStudentGradeDto);

}
