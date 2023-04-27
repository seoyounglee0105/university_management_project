package com.green.university.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.hibernate.validator.constraints.ParameterScriptAssert;

import com.green.university.dto.response.GradeDto;
import com.green.university.dto.response.GradeForScholarshipDto;
import com.green.university.dto.response.MyGradeDto;
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
	
	// 내가 신청한 학기 나오는거
	public List<GradeDto> findsemester(Integer studentId);
	// 내가 신청한 연도 나오는거
	public List<GradeDto> findByyear(Integer studentId);
	// 학기별 성적조회 할때 전체 나오는거
	public List<GradeDto> findByAll(Integer studentId);
	

	// 전체 찾는거
	public List<GradeDto> chioceByGradeAlltype(@Param("studentId") Integer studentId, @Param("subYear") Integer subYear, @Param("semester") Integer semester);


	/**
	 * @author 서영
	 * 장학금 유형 결정을 위한 성적 평균을 가져옴
	 */
	public GradeForScholarshipDto findAvgGradeByStudentIdAndSemester(@Param("studentId") Integer studentId, @Param("subYear") Integer subYear, @Param("semester") Integer semester);
	

	
	
	// 전공,교양 각자 찾는거
	public List<GradeDto> chioceByGrade(@Param("studentId") Integer studentId,@Param("subYear") Integer subYear,@Param("semester") Integer semester,@Param("type") String type);

	// 누계성적 조회
	public MyGradeDto  sumAndAverageBymyGrade(@Param("studentId") Integer studentId, @Param("subYear") Integer subYear, @Param("semester") Integer semester);
	
	// 전체 누계성적 조회
	public List<MyGradeDto> gradeinquiryBystudentId(Integer studentId);
	
	// 연도 누계성적 조회
	public List<MyGradeDto> gradeinquiryBysubYear(@Param("studentId") Integer studentId, @Param("subYear") Integer subYear);

}
