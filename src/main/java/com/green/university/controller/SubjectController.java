package com.green.university.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.university.dto.response.SubjectDto;
import com.green.university.service.SubjectService;

/**
 * @author 서영
 * 
 */

@Controller
@RequestMapping("/subject")
public class SubjectController {

	@Autowired
	private SubjectService subjectService;
	
	// 과목 조회 (모든 연도-학기에 대해서)
	@GetMapping("/list")
	public String readSubjectList(Model model) {

		List<SubjectDto> subjectList = subjectService.readSubjectList();
		model.addAttribute("subjectList", subjectList);
		
		return "/subject/allSubList";
	}
	// 모든 강의 목록 조회
	
	
}
