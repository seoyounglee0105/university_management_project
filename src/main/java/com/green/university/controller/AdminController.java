package com.green.university.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.university.dto.CollTuitFormDto;
import com.green.university.dto.CollegeFormDto;
import com.green.university.dto.DepartmentFormDto;
import com.green.university.dto.NoticeFormDto;
import com.green.university.dto.RoomFormDto;
import com.green.university.dto.SubjectFormDto;
import com.green.university.repository.model.College;
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
		return "/insertAdmin/college";
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
	 * 페이지 이동 시, 단과대학 조회 후 이동
	 */
	@GetMapping("/department")
	public String department(Model model) {
		List<College> collegeList = adminService.findCollege();
		if(collegeList.isEmpty()) {
			model.addAttribute("collegeList", null);
		} else {
			model.addAttribute("collegeList", collegeList);
		}
		return "/insertAdmin/department";
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
		return "/insertAdmin/room";
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
		return "/insertAdmin/subject";
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
		return "/insertAdmin/collTuit";
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
		return "/insertNotice/notice";
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
