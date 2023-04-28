package com.green.university.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.university.dto.ChangePasswordDto;
import com.green.university.dto.LoginDto;
import com.green.university.dto.UserUpdateDto;
import com.green.university.dto.response.PrincipalDto;
import com.green.university.dto.response.ProfessorInfoDto;
import com.green.university.dto.response.StudentInfoDto;
import com.green.university.dto.response.UserInfoForUpdateDto;
import com.green.university.handler.exception.UnAuthorizedException;
import com.green.university.repository.model.Staff;
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

		PrincipalDto principal = userService.login(loginDto);
		session.setAttribute(Define.PRINCIPAL, principal);

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

		PrincipalDto principal = (PrincipalDto) session.getAttribute(Define.PRINCIPAL);
		UserInfoForUpdateDto userInfoForUpdateDto = null;
		if ("staff".equals(principal.getUserRole())) {
			userInfoForUpdateDto = userService.readStaffInfoForUpdate(principal.getId());
		}
		if ("student".equals(principal.getUserRole())) {
			userInfoForUpdateDto = userService.readStudentInfoForUpdate(principal.getId());
		}
		if ("professor".equals(principal.getUserRole())) {
			userInfoForUpdateDto = userService.readProfessorInfoForUpdate(principal.getId());
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
	@PutMapping("/update")
	public String updateUserProc(@Valid UserInfoForUpdateDto userInfoForUpdateDto, @RequestParam String password) {
		
		PrincipalDto principal = (PrincipalDto)session.getAttribute(Define.PRINCIPAL);
		// 패스워드 인코더 적용 후
//		if(!passwordEncoder.matches(password, principal.getPassword())) {
//			throw new UnAuthorizedException(Define.WRONG_PASSWORD, HttpStatus.BAD_REQUEST);
//		}
		// 패스워드 인코더 적용 전
		if(!password.equals(principal.getPassword())) {
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
	 * 비밀번호 수정 페이지
	 * 
	 * @param model
	 * @return updatePasword.jsp
	 */
	@GetMapping("/password")
	public String updatePassword() {


		return "/user/updatePassword";
	}

	/**
	 * 비밀번호 수정 post 페이지
	 * 
	 * @param userInfoForUpdateDto, password
	 * @return updateUser.jsp
	 */
	@PutMapping("/password")
	public String updatePasswordProc(@Valid ChangePasswordDto changePasswordDto) {

		PrincipalDto principal = (PrincipalDto) session.getAttribute(Define.PRINCIPAL);
		// 패스워드 인코더 적용 후
//		if(!passwordEncoder.matches(password, principal.getPassword())) {
//			throw new UnAuthorizedException(Define.WRONG_PASSWORD, HttpStatus.BAD_REQUEST);
//		}
		// 패스워드 인코더 적용 전
		if (!changePasswordDto.getBeforePassword().equals(principal.getPassword())) {
			throw new UnAuthorizedException(Define.WRONG_PASSWORD, HttpStatus.BAD_REQUEST);
		}
		if(!changePasswordDto.getAfterPassword().equals(changePasswordDto.getPasswordCheck())) {
			throw new UnAuthorizedException("변경할 비밀번호와 비밀번호 확인은 같아야합니다.", HttpStatus.BAD_REQUEST);
		}
		changePasswordDto.setId(principal.getId());
		userService.updatePassword(changePasswordDto);

		return "redirect:/password";
	}
	
	/**
	 * 로그아웃
	 * @return 로그인 페이지
	 */
	@GetMapping("/logout")
	public String logout() {
		session.invalidate();
		
		return "redirect:/";
	}
	
	/**
	 * 학생 정보 조회
	 * @param model
	 * @return 학생 정보 조회 페이지
	 */
	@GetMapping("/info/student")
	public String readStudentInfo(Model model) {
		
		PrincipalDto principal = (PrincipalDto)session.getAttribute(Define.PRINCIPAL);
		StudentInfoDto student = userService.readStudentInfo(principal.getId());
		model.addAttribute("student", student);
		
		return "/user/studentInfo";
	}
	/**
	 * 직원 정보 조회
	 * @param model
	 * @return 직원 정보조회 페이지
	 */
	@GetMapping("/info/staff")
	public String readStaffInfo(Model model) {
		
		PrincipalDto principal = (PrincipalDto)session.getAttribute(Define.PRINCIPAL);
		Staff staff = userService.readStaff(principal.getId());
		model.addAttribute("staff", staff);
		
		return "/user/staffInfo";
	}
	/**
	 * 교수 정보 조회
	 * @param model
	 * @return 교수 정보 조회 페이지
	 */
	@GetMapping("/info/professor")
	public String readProfessorInfo(Model model) {
		PrincipalDto principal = (PrincipalDto)session.getAttribute(Define.PRINCIPAL);
		ProfessorInfoDto professor = userService.readProfessorInfo(principal.getId());
		model.addAttribute("professor", professor);
		return "/user/professorInfo";
	}
}
