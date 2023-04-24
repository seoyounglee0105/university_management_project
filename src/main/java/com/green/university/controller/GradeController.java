package com.green.university.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.university.dto.GradecheckFormDto;
import com.green.university.dto.response.GradeDto;
import com.green.university.service.GradeService;

/**
 * 
 * @author 편용림
 * 금학기,학기별 성적 조회
 */

@Controller
@RequestMapping("/grade")
public class GradeController {
	
	@Autowired
	private HttpSession session;
	@Autowired
	private GradeService gradeService;
	
	/**
	 * 
	 * @return 성적조회
	 */
	@GetMapping("/thisgrade")
	public String grade(Model model) {
		
		//User principal = (User)session.getAttribute(Define.PRINCIPAL);
		List<GradeDto> gradeList = gradeService.readStuSubList(2018000002);
		//System.out.println(gradeDtoList);
		model.addAttribute("gradeList",gradeList);
		
		return "grade/thisgrade";
	}
	
	@GetMapping("/semetergrade")
	public String thisgrade(Model model) {
		//User principal = (User)session.getAttribute(Define.PRINCIPAL);
		List<GradeDto> gradeAllList = gradeService.findAll(2018000002);
		List<GradeDto> yearList = gradeService.readSubYear(2018000002);
		System.out.println(yearList);
		//System.out.println(gradeDtoList);
		model.addAttribute("yearList",yearList);
		model.addAttribute("gradeList",gradeAllList);
		return "grade/semetergrade";
	}
	
	@PostMapping("/check")
	public String select(GradecheckFormDto dto, Model model) {
		//User principal = (User)session.getAttribute(Define.PRINCIPAL);
		List<GradeDto> gradeList = gradeService.selectBygrade(2018000002, dto.getSubYear(), dto.getSemeter(), dto.getType());
		model.addAttribute("gradeList", gradeList);
		
		return "grade/checkgrade";
	};
	
}
