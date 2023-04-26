package com.green.university.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.university.dto.response.SubjectDto;
import com.green.university.service.SubjectService;

@Controller
@RequestMapping("/stuSub")
public class StuSubController {

	@Autowired
	private HttpSession session;
	
	@Autowired
	private SubjectService subjectService;
	
	// 과목 조회 (현재 학기)
	@GetMapping("/list")
	public String readSubjectList(Model model) {

		List<SubjectDto> subjectList = subjectService.readSubjectListByCurrentSemester();
		model.addAttribute("subjectList", subjectList);
		
		return "/stuSub/subList";
	}
	
}
