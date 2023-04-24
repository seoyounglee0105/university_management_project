package com.green.university.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

import com.green.university.dto.CreateStaffDto;
import com.green.university.dto.UserUpdateDto;
import com.green.university.dto.response.UserInfoForUpdateDto;
import com.green.university.repository.model.User;

/**
 * Staff DAO
 * 
 * @author 김지현
 */
@Mapper
public interface StaffRepository {

	// staff_tb에 insert
	public int insertToStaff(CreateStaffDto createStaffDto);

	// staff_tb에서 자동 생성된 id 받아오기
	public Integer selectIdByCreateStaffDto(CreateStaffDto createStaffDto);

	// id 이용해서 user_tb에 insert
	public int insertToUser(User user);

	// 업데이트용 정보 읽기
	public UserInfoForUpdateDto selectByUserId(Integer userId);

	// 유저정보 업데이트
	public int updateStaff(UserUpdateDto userUpdateDto);

}
