package com.green.university.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.green.university.dto.LoginDto;
import com.green.university.dto.UserUpdateDto;
import com.green.university.dto.response.UserInfoForUpdateDto;
import com.green.university.repository.model.User;
import com.green.university.service.UserService;
import com.green.university.utils.Define;

/**
 * User 로그인, 정보수정
 * 
 * @author 김지현
 */
@Controller
public class PersonalController {

	@Autowired
	private UserService userService;
	@Autowired
	private HttpSession session;

	/**
	 * 로그인 폼, 메인페이지
	 * 
	 * @return login.jsp
	 */
	@GetMapping("")
	public String login() {

		return "/user/login";
	}

	/*
	 * 로그인 post 처리
	 * 
	 * @param loginDto
	 * 
	 * @return 메인 페이지 이동(수정 예정)
	 */
	@PostMapping("/login")
	public String signInProc(LoginDto loginDto) {

		User principal = userService.login(loginDto);
		session.setAttribute(Define.PRINCIPAL, principal);
		User user = (User) session.getAttribute(Define.PRINCIPAL);
		System.out.println(user.getUserRole());

		return "redirect:/test";
	}

	/**
	 * 개인정보 수정 페이지
	 * 
	 * @param model
	 * @return updateUser.jsp
	 */
	@GetMapping("/update")
	public String updateUser(Model model) {

		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		UserInfoForUpdateDto userInfoForUpdateDto = null;
		if ("staff".equals(principal.getUserRole())) {
			userInfoForUpdateDto = userService.readStaffInfo(principal.getId());
		}
		if ("student".equals(principal.getUserRole())) {
			userInfoForUpdateDto = userService.readStudentInfo(principal.getId());
		}
		if ("professor".equals(principal.getUserRole())) {
			userInfoForUpdateDto = userService.readProfessorInfo(principal.getId());
		}
		model.addAttribute("userInfo", userInfoForUpdateDto);

		return "/user/updateUser";
	}

	/**
	 * 개인정보 수정 페이지
	 * 
	 * @param model
	 * @return updateUser.jsp
	 */
	@PostMapping("/update")
	public String updateUserProc(UserInfoForUpdateDto userInfoForUpdateDto) {

		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		UserUpdateDto updateDto = new UserUpdateDto();
		updateDto.setUserId(principal.getId());
		updateDto.setAddress(userInfoForUpdateDto.getAddress());
		updateDto.setEmail(userInfoForUpdateDto.getEmail());
		updateDto.setTel(userInfoForUpdateDto.getTel());
		if ("staff".equals(principal.getUserRole())) {
			userService.updateStaff(updateDto);
		}
		if ("student".equals(principal.getUserRole())) {
			userService.updateStudent(updateDto);
		}
		if ("professor".equals(principal.getUserRole())) {
			userService.updateProfessor(updateDto);
		}

		return "redirect:/update";
	}

}
