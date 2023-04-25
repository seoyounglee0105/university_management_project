package com.green.university.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.university.dto.LoginDto;
import com.green.university.dto.UserUpdateDto;
import com.green.university.dto.response.UserInfoForUpdateDto;
import com.green.university.handler.exception.UnAuthorizedException;
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
	@Autowired
	private PasswordEncoder passwordEncoder;

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
	public String signInProc(@Valid LoginDto loginDto) {

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
	 * @param userInfoForUpdateDto, password
	 * @return updateUser.jsp
	 */
	@PostMapping("/update")
	public String updateUserProc(@Valid UserInfoForUpdateDto userInfoForUpdateDto, @RequestParam String password) {
		
		passwordEncoder = new BCryptPasswordEncoder();
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		System.out.println(principal.getPassword());
		System.out.println(password);
		// 패스워드 인코더 적용 후
//		if(!passwordEncoder.matches(password, principal.getPassword())) {
//			throw new UnAuthorizedException(Define.WRONG_PASSWORD, HttpStatus.BAD_REQUEST);
//		}
		// 패스워드 인코더 적용 전
		if(!password.equals(principal.getPassword())) {
			System.out.println("비밀번호 틀림");
			throw new UnAuthorizedException(Define.WRONG_PASSWORD, HttpStatus.BAD_REQUEST);
		}
		
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

	/**
	 * 개인정보 수정 페이지
	 * 
	 * @param model
	 * @return updateUser.jsp
	 */
	@GetMapping("/password")
	public String updatePassword(Model model) {

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

		return "/user/updatePassword";
	}

	/**
	 * 개인정보 수정 페이지
	 * 
	 * @param userInfoForUpdateDto, password
	 * @return updateUser.jsp
	 */
	@PostMapping("/password")
	public String updatePasswordProc(@Valid UserInfoForUpdateDto userInfoForUpdateDto, @RequestParam String password) {

		passwordEncoder = new BCryptPasswordEncoder();
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		System.out.println(principal.getPassword());
		System.out.println(password);
		// 패스워드 인코더 적용 후
//		if(!passwordEncoder.matches(password, principal.getPassword())) {
//			throw new UnAuthorizedException(Define.WRONG_PASSWORD, HttpStatus.BAD_REQUEST);
//		}
		// 패스워드 인코더 적용 전
		if (!password.equals(principal.getPassword())) {
			System.out.println("비밀번호 틀림");
			throw new UnAuthorizedException(Define.WRONG_PASSWORD, HttpStatus.BAD_REQUEST);
		}

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
