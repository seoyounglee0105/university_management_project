package com.green.university.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.university.dto.response.PrincipalDto;
import com.green.university.dto.response.SubjectForProfessorDto;
import com.green.university.dto.response.SubjectPeriodForProfessorDto;
import com.green.university.service.ProfessorService;
import com.green.university.utils.Define;

/**
 * 교수 행정 페이지 (자기과목 조회, 학생 성적 기입)
 * @author 김지현
 */
@Controller
@RequestMapping("/professor")
public class ProfessorController {
	
	@Autowired
	private ProfessorService professorService;
	@Autowired
	private HttpSession session;

	@GetMapping("/subject")
	public String subjectList(Model model) {
		
		PrincipalDto principal = (PrincipalDto)session.getAttribute(Define.PRINCIPAL);
		List<SubjectPeriodForProfessorDto> semesterList = professorService.selectSemester(principal.getId());
		SubjectPeriodForProfessorDto subjectPeriodForProfessorDto = new SubjectPeriodForProfessorDto();
		subjectPeriodForProfessorDto.setSubYear(Define.CURRENT_YEAR);
		subjectPeriodForProfessorDto.setSemester(Define.CURRENT_SEMESTER);
		subjectPeriodForProfessorDto.setId(principal.getId());
		List<SubjectForProfessorDto>  subjectList = professorService.selectSubjectBySemester(subjectPeriodForProfessorDto);
		model.addAttribute("semesterList", semesterList);
		model.addAttribute("subjectList", subjectList);
		
		return "/professor/professorSubjectList";
	}
	@PostMapping("/subject")
	public String subjectListProc(Model model, @RequestBody String period) {
		System.out.println(period);
		PrincipalDto principal = (PrincipalDto)session.getAttribute(Define.PRINCIPAL);
		List<SubjectPeriodForProfessorDto> semesterList = professorService.selectSemester(principal.getId());
		String[] strs = period.split("year");
		SubjectPeriodForProfessorDto subjectPeriodForProfessorDto = new SubjectPeriodForProfessorDto();
		subjectPeriodForProfessorDto.setSubYear(Integer.parseInt(strs[0]));
		subjectPeriodForProfessorDto.setSemester(Integer.parseInt(strs[1]));
		subjectPeriodForProfessorDto.setId(principal.getId());
		List<SubjectForProfessorDto>  subjectList = professorService.selectSubjectBySemester(subjectPeriodForProfessorDto);
		System.out.println(subjectList.get(0));
		model.addAttribute("semesterList", semesterList);
		model.addAttribute("subjectList", subjectList);
		
		return "/professor/professorSubjectList";
	}
	
}
