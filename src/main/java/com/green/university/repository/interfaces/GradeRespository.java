package com.green.university.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.hibernate.validator.constraints.ParameterScriptAssert;

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
	public List<GradeDto> findByStudentIdAndsemester(@Param("studentId") Integer studentId, @Param("semester") Integer semester, @Param("subYear") Integer subYear);	
	public List<GradeDto> findBysubYear(@Param("studentId") Integer studentId, @Param("subYear") Integer subYear);
	public List<GradeDto> findBysemester(@Param("studentId") Integer studentId, @Param("semester") Integer semester);
	public List<GradeDto> findByType(@Param("studentId") Integer studentId, @Param("type") String type);
	public List<GradeDto> findByyear(Integer studentId);
	public List<GradeDto> findByAll(Integer studentId);
	public List<GradeDto> chioceByGrade(@Param("studentId") Integer studentId,@Param("subYear") Integer subYear,@Param("grade") Integer grade,@Param("type") String type);
}
