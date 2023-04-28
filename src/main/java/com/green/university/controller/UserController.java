package com.green.university.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.university.dto.CreateProfessorDto;
import com.green.university.dto.CreateStaffDto;
import com.green.university.dto.CreateStudentDto;
import com.green.university.service.UserService;

/**
 * 유저 페이지
 * 
 * @author 김지현
 */
@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private HttpSession session;

	/**
	 * @return staff 입력 페이지
	 */
	@GetMapping("/staff")
	public String createStaff() {

		return "/user/createStaff";
	}

	/**
	 * staff 입력 post 처리
	 * 
	 * @param createStaffDto
	 * @return "redirect:/user/staff"
	 */
	@PostMapping("/staff")
	public String createStaffProc(@Valid CreateStaffDto createStaffDto) {

		System.out.println(createStaffDto.toString());
		userService.createStaffToStaffAndUser(createStaffDto);

		return "redirect:/user/staff";
	}

	/**
	 * @return professor 입력 페이지
	 */
	@GetMapping("/professor")
	public String createProfessor() {

		return "/user/createProfessor";
	}

	/**
	 * staff 입력 post 처리
	 * 
	 * @param createProfessorDto
	 * @return "redirect:/user/professor"
	 */
	@PostMapping("/professor")
	public String createProfessorProc(@Valid CreateProfessorDto createProfessorDto) {

		userService.createProfessorToProfessorAndUser(createProfessorDto);

		return "redirect:/user/professor";
	}

	/**
	 * @return student 입력 페이지
	 */
	@GetMapping("/student")
	public String createStudent() {

		return "/user/createStudent";
	}

	/**
	 * student 입력 post 처리
	 * 
	 * @param createStudentDto
	 * @return "redirect:/user/student"
	 */
	@PostMapping("/student")
	public String createStudentProc(@Valid CreateStudentDto createStudentDto) {

		userService.createStudentToStudentAndUser(createStudentDto);

		return "redirect:/user/student";
	}
	
	

}
