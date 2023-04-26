package com.green.university.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.university.dto.CollTuitFormDto;
import com.green.university.dto.CollegeFormDto;
import com.green.university.dto.DepartmentFormDto;
import com.green.university.dto.NoticeFormDto;
import com.green.university.dto.RoomFormDto;
import com.green.university.dto.SubjectFormDto;
import com.green.university.repository.model.CollTuit;
import com.green.university.repository.model.College;
import com.green.university.repository.model.Department;
import com.green.university.repository.model.Room;
import com.green.university.repository.model.Subject;
import com.green.university.service.AdminService;

/**
 * 
 * @author 박성희 Admin 수업 조회/입력 관련 Controller
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
	public String college(Model model, @RequestParam(defaultValue = "select") String crud) {
		model.addAttribute("crud", crud);
		List<College> collegeList = adminService.findCollege();
		if (collegeList.isEmpty()) {
			model.addAttribute("collegeList", null);
		} else {
			model.addAttribute("collegeList", collegeList);
		}
		return "/admin/college";
	}

	/**
	 * 
	 * @return 단과대학 입력 기능
	 */
	@PostMapping("/college-proc")
	public String insertCollege(CollegeFormDto collegeFormDto) {
		adminService.insertCollege(collegeFormDto);
		return "redirect:/admin/college";
	}

	/**
	 * 
	 * @return 학과 페이지 페이지 이동 시, 단과대학 조회 후 이동
	 */
	@GetMapping("/department")
	public String department(Model model, @RequestParam(defaultValue = "select") String crud) {
		model.addAttribute("crud", crud);
		List<Department> departmentList = adminService.findDepartment();
		List<College> collegeList = adminService.findCollege();
		if (collegeList.isEmpty()) {
			model.addAttribute("collegeList", null);
		} else {
			model.addAttribute("collegeList", collegeList);
		}
		if (departmentList.isEmpty()) {
			model.addAttribute("departmentList", null);
		} else {
			model.addAttribute("departmentList", departmentList);
		}
		return "/admin/department";
	}

	/**
	 * 
	 * @return 학과 입력 기능
	 */
	@GetMapping("/department-proc")
	public String insertDepartment(DepartmentFormDto departmentFormDto) {
		adminService.insertDepartment(departmentFormDto);
		return "redirect:/admin/department";
	}

	/**
	 * 
	 * @return 강의실 페이지
	 */
	@GetMapping("/room")
	public String room(Model model, @RequestParam(defaultValue = "select") String crud) {
		model.addAttribute("crud", crud);
		List<Room> roomList = adminService.findRoom();
		List<College> collegeList = adminService.findCollege();
		if (collegeList.isEmpty()) {
			model.addAttribute("collegeList", null);
		} else {
			model.addAttribute("collegeList", collegeList);
		}
		if (roomList.isEmpty()) {
			model.addAttribute("roomList", null);
		} else {
			model.addAttribute("roomList", roomList);
		}
		return "/admin/room";
	}

	/**
	 * 
	 * @return 강의실 입력 기능
	 */
	@PostMapping("/room-proc")
	public String insertRoom(RoomFormDto roomFormDto) {
		adminService.insertRoom(roomFormDto);
		return "redirect:/admin/room";
	}

	/**
	 * 
	 * @return 강의 페이지
	 */
	@GetMapping("/subject")
	public String subject(Model model, @RequestParam(defaultValue = "select") String crud) {
		model.addAttribute("crud", crud);
		List<Subject> subjectList = adminService.findSubject();
		List<College> collegeList = adminService.findCollege();
		if (collegeList.isEmpty()) {
			model.addAttribute("collegeList", null);
		} else {
			model.addAttribute("collegeList", collegeList);
		}
		if (subjectList.isEmpty()) {
			model.addAttribute("subjectList", null);
		} else {
			model.addAttribute("subjectList", subjectList);
		}
		return "/admin/subject";
	}

	/**
	 * 
	 * @return 강의 입력 기능
	 */
	@PostMapping("/subject-proc")
	public String insertSubject(SubjectFormDto subjectFormDto) {
		adminService.insertSubject(subjectFormDto);
		return "redirect:/admin/subject";
	}

	/**
	 * 
	 * @return 단과대별 등록금 페이지
	 */
	@GetMapping("/collTuit")
	public String collTuit(Model model, @RequestParam(defaultValue = "select") String crud) {
		model.addAttribute("crud", crud);
		List<CollTuit> collTuitList = adminService.findCollTuit();
		List<College> collegeList = adminService.findCollege();
		if (collegeList.isEmpty()) {
			model.addAttribute("collegeList", null);
		} else {
			model.addAttribute("collegeList", collegeList);
		}
		if (collTuitList.isEmpty()) {
			model.addAttribute("collTuitList", null);
		} else {
			model.addAttribute("collTuitList", collTuitList);
		}
		return "/admin/collTuit";
	}

	/**
	 * 
	 * @return 단과대별 등록금 입력 기능
	 */
	@PostMapping("/collTuit-proc")
	public String insertcollTuit(CollTuitFormDto collTuitFormDto) {
		adminService.insertCollTuit(collTuitFormDto);
		return "redirect:/admin/collTuit";
	}

}
