package com.green.university.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

import com.green.university.dto.CreateProfessorDto;
import com.green.university.dto.FindIdFormDto;
import com.green.university.dto.FindPasswordFormDto;
import com.green.university.dto.UserUpdateDto;
import com.green.university.dto.response.ProfessorInfoDto;
import com.green.university.dto.response.UserInfoForUpdateDto;
import com.green.university.repository.model.Professor;
import com.green.university.repository.model.Staff;
import com.green.university.repository.model.User;

/**
 * Professor DAO
 * 
 * @author 김지현
 */
@Mapper
public interface ProfessorRepository {

	// staff_tb에 insert
	public int insertToProfessor(CreateProfessorDto createProfessorDto);

	// staff_tb에서 자동 생성된 id 받아오기
	public Integer selectIdByCreateProfessorDto(CreateProfessorDto createProfessorDto);

	// 업데이트용 정보 읽기
	public UserInfoForUpdateDto selectByUserId(Integer userId);

	// 유저정보 업데이트
	public int updateProfessor(UserUpdateDto userUpdateDto);

	// Professor model 정보 id로 조회
	public Professor selectProfessorById(Integer id);

	// ProfessorInfoDto id로 조회
	public ProfessorInfoDto selectProfessorInfoById(Integer id);

	// id 찾기
	public Integer selectIdByNameAndEmail(FindIdFormDto findIdFormDto);

	// password 발급용 model 확인
	public Integer selectProfessorByIdAndNameAndEmail(FindPasswordFormDto findPasswordFormDto);

}
