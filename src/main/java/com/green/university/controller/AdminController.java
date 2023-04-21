package com.green.university.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 
 * @author 박성희
 * Admin 관련 Controller
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

	/**
	 * 
	 * @return 단과대 페이지
	 */
	@GetMapping("/college")
	public String college() {
		return "/admin/college";
	}
	/**
	 * 
	 * @return 학과 페이지
	 */
	@GetMapping("/department")
	public String department() {
		return "/admin/department";
	}
	/**
	 * 
	 * @return 강의실 페이지
	 */
	@GetMapping("/room")
	public String room() {
		return "/admin/room";
	}
	/**
	 * 
	 * @return 강의 페이지
	 */
	@GetMapping("/subject")
	public String subject() {
		return "/admin/subject";
	}
	/**
	 * 
	 * @return 등록금 페이지
	 */
	@GetMapping("/tuition")
	public String tuition() {
		return "/admin/tuition";
	}
	/**
	 * 
	 * @return 공지사항 페이지
	 */
	@GetMapping("/notice")
	public String notice() {
		return "/notice/notice";
	}
}
