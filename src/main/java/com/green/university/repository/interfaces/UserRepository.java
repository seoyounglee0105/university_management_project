package com.green.university.repository.interfaces;

import org.springframework.stereotype.Repository;

import com.green.university.dto.CreateStaffDto;

/**
 * 유저 DAO
 * @author 김지현
 */
@Repository
public interface UserRepository {

	// 스태프 생성
	public int insertStaff(CreateStaffDto createStaffDto);
	
	

}
