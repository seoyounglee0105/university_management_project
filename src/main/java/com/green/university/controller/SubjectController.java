package com.green.university.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.university.dto.AllSubjectSearchFormDto;
import com.green.university.dto.response.SubjectDto;
import com.green.university.repository.model.Department;
import com.green.university.service.CollegeService;
import com.green.university.service.SubjectService;

/**
 * @author 서영
 * 강의 목록
 */

@Controller
@RequestMapping("/subject")
public class SubjectController {

	@Autowired
	private SubjectService subjectService;
	
	@Autowired
	private CollegeService collegeService;
	
	
	// 모든 강의 조회 (모든 연도-학기에 대해서)
	@GetMapping("/list")
	public String readSubjectList(Model model) {
		
		// 강의 리스트
		List<SubjectDto> subjectList = subjectService.readSubjectList();
		model.addAttribute("subjectList", subjectList);
		
		// 필터에 사용할 전체 학과 정보
		List<Department> deptList = collegeService.readDeptAll();
		model.addAttribute("deptList", deptList);
		
		// 필터에 사용할 강의 이름 정보 (중복 값 제거)
		List<String> subNameList = new ArrayList<>();
		for (SubjectDto subject : subjectList) {
			if (subNameList.contains(subject.getName()) == false) {
				subNameList.add(subject.getName());
			}
		}
		model.addAttribute("subNameList", subNameList);
		
		return "/subject/allSubList";
	}
	
	// 전체 강의 목록에서 필터링
	@GetMapping("/list/Search")
	public String readSubjectListSearch(Model model, @Validated AllSubjectSearchFormDto allSubjectSearchFormDto) {
		
		// 강의 리스트
		List<SubjectDto> subjectList = subjectService.readSubjectListSearch(allSubjectSearchFormDto);
		model.addAttribute("subjectList", subjectList);
		
		// 필터에 사용할 전체 학과 정보
		List<Department> deptList = collegeService.readDeptAll();
		model.addAttribute("deptList", deptList);
		
		// 필터에 사용할 강의 이름 정보 (중복 값 제거)
		List<String> subNameList = new ArrayList<>();
		for (SubjectDto subject : subjectList) {
			if (subNameList.contains(subject.getName()) == false) {
				subNameList.add(subject.getName());
			}
		}
		model.addAttribute("subNameList", subNameList);
		
		
		return "/subject/allSubList";
	}
	
	
}
