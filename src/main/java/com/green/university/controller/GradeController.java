package com.green.university.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
		List<GradeDto> gradeList = gradeService.readStuSubList(2018000002);
		//System.out.println(gradeDtoList);
		model.addAttribute("gradeList",gradeList);
				
		return "grade/semetergrade";
	}
}
