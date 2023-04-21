package com.green.university.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.university.dto.CreateStaffDto;

/**
 * 유저 페이지
 * @author 김지현
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {
	
	/**
	 * @return staff 입력 페이지
	 */
	@GetMapping("/staff")
	public String createStaff() {
		
		return "/user/createStaff";
	}
	
	/**
	 * staff 입력 post 처리
	 * @param createStaffDto
	 * @return 
	 */
	@PostMapping("/staff")
	public String createStaffProc(CreateStaffDto createStaffDto) {
		
		System.out.println(createStaffDto.toString());
		
		return "redirect:/user/staff";
	}
	

}
