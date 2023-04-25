package com.green.university.controller;

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
import com.green.university.service.AdminService;

/**
 * 
 * @author 박성희 Admin 수업 수정/삭제 Controller
 */
@Controller
@RequestMapping("/updAdmin")
public class UpDeAdminController {
	@Autowired
	private AdminService adminService;

	/**
	 * 
	 * @return 단과대학 삭제 기능
	 */
	@GetMapping("/deCollege")
	public String deleteCollege(Model model, @RequestParam Integer id) {
		model.addAttribute("id", id);
		adminService.deleteCollege(id);
		return "redirect:/admin/college";
	}
	
	/**
	 * 
	 * @return 학과 삭제 기능
	 */
	@GetMapping("/deDepartment")
	public String deleteDepartment(Model model, @RequestParam Integer collegeId) {
		model.addAttribute("collegeId", collegeId);
		adminService.deleteDepartment(collegeId);
		return "redirect:/admin/department";
	}
	
	/**
	 * 
	 * @return 학과 수정 기능
	 */
	@PostMapping("/upDepartment")
	public String updateDepartment(DepartmentFormDto departmentFormDto) {
		adminService.updateDepartment(departmentFormDto);
		return "redirect:/admin/department";
	}
	
	@GetMapping("/updateTest")
	public String update(Model model, @RequestParam String name) {
		model.addAttribute("name", name);
		return "redirect:admin/department?crud=updateById";
	}
	
	/**
	 * 
	 * @return 강의 삭제 기능
	 */
	@GetMapping("/deSubject")
	public String deleteSubject(Model model, @RequestParam Integer id) {
		model.addAttribute("id", id);
		adminService.deleteSubject(id);
		return "redirect:/admin/subject";
	}
	
	/**
	 * 
	 * @return 강의실 삭제 기능
	 */
	@GetMapping("/deRoom")
	public String deleteRoom(Model model, @RequestParam String id) {
		model.addAttribute("id", id);
		adminService.deleteRoom(id);
		return "redirect:/admin/room";
	}
	
	/**
	 * 
	 * @return 단과대 등록금 삭제 기능
	 */
	@GetMapping("/deCollTuit")
	public String deleteCollTuit(Model model, @RequestParam Integer collegeId) {
		model.addAttribute("collegeId", collegeId);
		adminService.deleteCollTuit(collegeId);
		return "redirect:/admin/collTuit";
	}
	
	/**
	 * 
	 * @return 단과대 등록금 수정 기능
	 */
	@PostMapping("/upCollTuit")
	public String updateCollTuit(CollTuitFormDto collTuitFormDto) {
		adminService.updateCollTuit(collTuitFormDto);
		return "redirect:/admin/collTuit";
	}
}
