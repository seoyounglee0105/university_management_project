package com.green.university.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.university.dto.CreateProfessorDto;
import com.green.university.dto.CreateStaffDto;
import com.green.university.dto.CreateStudentDto;
import com.green.university.dto.LoginDto;
import com.green.university.repository.model.User;
import com.green.university.service.UserService;
import com.green.university.utils.Define;

/**
 * 유저 페이지
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
	 * @param createStaffDto
	 * @return "redirect:/user/staff"
	 */
	@PostMapping("/staff")
	public String createStaffProc(CreateStaffDto createStaffDto) {
		
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
	 * @param createProfessorDto
	 * @return "redirect:/user/professor"
	 */
	@PostMapping("/professor")
	public String createProfessorProc(CreateProfessorDto createProfessorDto) {
		
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
	 * @param createStudentDto
	 * @return "redirect:/user/student"
	 */
	@PostMapping("/student")
	public String createStudentProc(CreateStudentDto createStudentDto) {
		
		userService.createStudentToStudentAndUser(createStudentDto);
		
		return "redirect:/user/student";
	}
	
	/**
	 * 로그인 폼, 메인페이지
	 * @return login.jsp
	 */
	@GetMapping("")
	public String login() {

		return "/user/login";
	}
	
	/*
	 * 로그인 post 처리
	 * @param loginDto
	 * @return 메인 페이지 이동(수정 예정)
	 */
	@PostMapping("/login")
	public String signInProc(LoginDto loginDto) {
		
		User principal = userService.login(loginDto);
		session.setAttribute(Define.PRINCIPAL, principal);
		User user = (User)session.getAttribute(Define.PRINCIPAL);
		System.out.println(user.getUserRole());
		
		return "redirect:/test";
	}

}
