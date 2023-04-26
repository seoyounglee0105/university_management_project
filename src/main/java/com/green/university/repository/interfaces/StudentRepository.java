package com.green.university.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.university.dto.CreateStudentDto;
import com.green.university.dto.UserUpdateDto;
import com.green.university.dto.response.UserInfoForUpdateDto;
import com.green.university.repository.model.Student;
import com.green.university.repository.model.User;

/**
 * Student DAO
 * 
 * @author 김지현
 */
@Mapper
public interface StudentRepository {

	// student_tb에 insert
	public int insertToStudent(CreateStudentDto createStudentDto);

	// staff_tb에서 자동 생성된 id 받아오기
	public Integer selectIdByCreateStudentDto(CreateStudentDto createStudentDto);
	
	/**
	 * @author 서영
	 * 전체 학생의 id만 가져오기
	 */
	public List<Integer> selectIdList();
	
	/**
	 * @author 서영
	 * 특정 학생의 정보 가져오기
	 */
	public Student selectByStudentId(Integer studentId);

	// 업데이트용 정보 읽기
	public UserInfoForUpdateDto selectByUserId(Integer userId);

	// 유저 정보 업데이트
	public int updateStudent(UserUpdateDto userUpdateDto);

}
