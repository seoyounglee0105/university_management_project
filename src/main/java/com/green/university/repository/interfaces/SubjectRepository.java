package com.green.university.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.university.dto.DepartmentFormDto;
import com.green.university.dto.SubjectFormDto;
import com.green.university.dto.response.SubjectDto;
import com.green.university.repository.model.Department;
import com.green.university.repository.model.Subject;

/*
 *  박성희
 *  강의 repository
 */

@Mapper
public interface SubjectRepository {
	public Integer insert(SubjectFormDto subjectFormDto);
	public List<Subject> findAll();
	public int delete(Integer id);
	public int update(SubjectFormDto subjectFormDto);
	
	/**
	 * @author 서영
	 * @return 수강 신청에 사용할 강의 정보
	 */
	public List<SubjectDto> findDtoByCurrentSemester(@Param("subYear") Integer subYear, @Param("semester") Integer semester);
	
	/**
	 * @author 서영
	 * @return 전체 강의 정보
	 */
	public List<SubjectDto> findDtoAll();
}
