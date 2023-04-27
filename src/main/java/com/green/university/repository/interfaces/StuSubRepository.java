package com.green.university.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.university.dto.UpdateStudentGradeDto;
import com.green.university.dto.response.StudentInfoForProfessorDto;

@Mapper
public interface StuSubRepository {
	
	/**
	 * 과목으로 학생 상세정보 뽑기
	 * @author 김지현
	 * @param subjectId
	 * @return StudentInfoForProfessorDto 리스트
	 */
	List<StudentInfoForProfessorDto> selectBySubjectId(Integer subjectId);
	
	/**
	 * stu_sub_tb의 grade 컬럼에 성적 입력
	 * @author 김지현
	 * @return 실행 결과 row 수
	 */
	int updateGradeByStudentIdAndSubjectId(UpdateStudentGradeDto updateStudentGradeDto);

}
