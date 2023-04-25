package com.green.university.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.university.dto.CreateStudentDto;
import com.green.university.repository.model.User;

/**
 * Student DAO
 * @author 김지현
 */
@Mapper
public interface StudentRepository {

	// student_tb에 insert
	public int insertToStudent(CreateStudentDto createStudentDto);
	// student_tb에서 자동 생성된 id 받아오기
	public Integer selectIdByCreateStudentDto(CreateStudentDto createStudentDto);
	// id 이용해서 user_tb에 insert
	public int insertToUser(User user);
	
	/**
	 * @author 서영
	 * 전체 학생의 id만 가져오기
	 */
	public List<Integer> selectIdList();

}
