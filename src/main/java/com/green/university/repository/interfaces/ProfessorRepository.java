package com.green.university.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

import com.green.university.dto.CreateProfessorDto;
import com.green.university.repository.model.User;

/**
 * Professor DAO
 * @author 김지현
 */
@Mapper
public interface ProfessorRepository {

	// staff_tb에 insert
	public int insertToProfessor(CreateProfessorDto createProfessorDto);
	// staff_tb에서 자동 생성된 id 받아오기
	public Integer selectIdByCreateProfessorDto(CreateProfessorDto createProfessorDto);
	// id 이용해서 user_tb에 insert
	public int insertToUser(User user);
	

}