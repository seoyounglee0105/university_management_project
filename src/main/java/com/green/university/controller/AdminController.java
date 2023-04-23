package com.green.university.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.university.dto.CollTuitFormDto;
import com.green.university.dto.CollegeFormDto;
import com.green.university.dto.DepartmentFormDto;
import com.green.university.dto.NoticeFormDto;
import com.green.university.dto.RoomFormDto;
import com.green.university.dto.SubjectFormDto;
import com.green.university.service.AdminService;

/**
 * 
 * @author 박성희 Admin 관련 Controller
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService adminService;

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
	 * @return 단과대학 입력 기능
	 */
	@PostMapping("/college-proc")
	public String insertCollege(CollegeFormDto collegeFormDto) {
		adminService.insertCollege(collegeFormDto);
		return "redirect:/test";
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
	 * @return 학과 입력 기능
	 */
	@GetMapping("/department-proc")
	public String insertDepartment(DepartmentFormDto departmentFormDto) {
		adminService.insertDepartment(departmentFormDto);
		return "redirect:/test";
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
	 * @return 강의실 입력 기능
	 */
	@PostMapping("/room-proc")
	public String insertRoom(RoomFormDto roomFormDto) {
		adminService.insertRoom(roomFormDto);
		return "redirect:/test";
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
	 * @return 강의 입력 기능
	 */
	@PostMapping("/subject-proc")
	public String insertSubject(SubjectFormDto subjectFormDto) {
		adminService.insertSubject(subjectFormDto);
		return "redirect:/test";
	}

	/**
	 * 
	 * @return 단과대별 등록금 페이지
	 */
	@GetMapping("/collTuit")
	public String collTuit() {
		return "/admin/collTuit";
	}

	/**
	 * 
	 * @return 단과대별 등록금 입력 기능
	 */
	@PostMapping("/collTuit-proc")
	public String insertcollTuit(CollTuitFormDto collTuitFormDto) {
		adminService.insertCollTuit(collTuitFormDto);
		return "redirect:/test";
	}

	/**
	 * 
	 * @return 공지사항 페이지
	 */
	@GetMapping("/notice")
	public String notice() {
		return "/notice/notice";
	}

	/**
	 * 
	 * @return 공지사항 입력 기능
	 */
	@PostMapping("/notice-proc")
	public String insertNotice(NoticeFormDto noticeFormDto) {
		adminService.insertNotice(noticeFormDto);
		return "redirect:/test";
	}
}
