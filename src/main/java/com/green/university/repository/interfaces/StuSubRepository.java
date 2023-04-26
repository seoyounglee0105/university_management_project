package com.green.university.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.university.dto.response.StudentInfoForProfessorDto;

@Mapper
public interface StuSubRepository {
	
	/**
	 * 과목으로 학생 상세정보 뽑기
	 * @param subjectId
	 * @return StudentInfoForProfessorDto 리스트
	 */
	List<StudentInfoForProfessorDto> selectBySubjectId(Integer subjectId);

}
