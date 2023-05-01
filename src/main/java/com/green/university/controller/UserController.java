package com.green.university.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.university.dto.CreateProfessorDto;
import com.green.university.dto.CreateStaffDto;
import com.green.university.dto.CreateStudentDto;
import com.green.university.dto.StudentListForm;
import com.green.university.repository.model.Student;
import com.green.university.service.StudentService;
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
	private StudentService studentService;

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
	
	/**
	 * 학생 조회
	 * @param model
	 * @return 학생 조회 페이지
	 */
	@GetMapping("/studentList")
	public String showStudentList(Model model, @RequestParam(required = false) Integer studentId, @RequestParam(required = false) Integer deptId) {
		
		StudentListForm studentListForm = new StudentListForm();
		studentListForm.setPage(0);
		if(studentId != null) {
			studentListForm.setStudentId(studentId);
		} else if (deptId != null) {
			studentListForm.setDeptId(deptId);
		}
		Integer amount = studentService.readStudentAmount(studentListForm);
		if(studentId != null) {
			amount = 1;
		}
		System.out.println("amount: " + amount);
		System.out.println("listCount: " + Math.ceil(amount/20.0));
		List<Student> list = studentService.readStudentList(studentListForm);
		
		model.addAttribute("listCount", Math.ceil(amount/20.0));
		model.addAttribute("studentList", list);
		model.addAttribute("deptId", deptId);
		
		return "/user/studentList";
	}
	
	/**
	 * 학생 조회
	 * @param model
	 * @return 학생 조회 페이지
	 */
	@GetMapping("/studentList/{page}")
	public String showStudentListByPage(Model model, @PathVariable Integer page, @RequestParam(required = false) Integer deptId) {
		
		StudentListForm studentListForm = new StudentListForm();
		if (deptId != null) {
			studentListForm.setDeptId(deptId);
		}
		studentListForm.setPage((page - 1) * 20);
		Integer amount = studentService.readStudentAmount(studentListForm);
		System.out.println("amount: " + amount);
		System.out.println("listCount: " + Math.ceil(amount/20.0));
		List<Student> list = studentService.readStudentList(studentListForm);
		
		model.addAttribute("listCount", Math.ceil(amount/20.0));
		model.addAttribute("studentList", list);
		
		return "/user/studentList";
	}
	
	@GetMapping("/student/update")
	public String updateStudentGradeAndSemester() {
		studentService.updateStudentGradeAndSemester();
		return "redirect:/user/studentList";
	}
	

}
