package com.green.university.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

import com.green.university.dto.ChangePasswordDto;
import com.green.university.repository.model.User;

@Mapper
public interface UserRepository {
	
	// 로그인용
	public User selectById(Integer userId);
	
	public int updatePassword(ChangePasswordDto changePasswordDto);

}
