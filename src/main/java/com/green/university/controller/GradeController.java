package com.green.university.controller;

import java.time.Year;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.university.dto.response.GradeDto;
import com.green.university.dto.response.MyGradeDto;
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
		int stu_id = 2018000001;
		List<GradeDto> yearList = gradeService.readSubYear(stu_id);
		model.addAttribute("yearList",yearList);
		if (yearList.size() != 0) {
			List<GradeDto> gradeList = gradeService.readStuSubList(stu_id);
			model.addAttribute("gradeList",gradeList);
			MyGradeDto mygrade = gradeService.readSumAndAverageByGrade(stu_id);
			model.addAttribute("mygrade", mygrade);
			
		}
		
		// 금학기 성적조회 기능
		return "grade/thisgrade";
	}
	
	@GetMapping("/semetergrade")
	public String thisgrade(Model model) {
		//User principal = (User)session.getAttribute(Define.PRINCIPAL);
		int stu_id = 2018000001;
		List<GradeDto> gradeAllList = gradeService.findAll(stu_id);
		List<GradeDto> yearList = gradeService.readSubYear(stu_id);
		System.out.println(yearList);
			List<GradeDto> semesterList = gradeService.readSesmeter(stu_id);
			model.addAttribute("semesterList",semesterList);
			model.addAttribute("yearList",yearList);
			model.addAttribute("gradeList",gradeAllList);
		return "grade/semetergrade";
	}
	
	/**
	 *  작성자 : 편용림
	 *  년도 학기 전공 조회 기능
	 *  
	 * @param dto
	 * @param model
	 * @param httpServletRequest
	 * @return
	 */
	@PostMapping("/check")
	public String select(Model model, HttpServletRequest httpServletRequest) {
		int stu_id = 2018000001;
	
		//User principal = (User)session.getAttribute(Define.PRINCIPAL);
		List<GradeDto> yearList = gradeService.readSubYear(stu_id);
		List<GradeDto> semesterList = gradeService.readSesmeter(stu_id);
		String type = httpServletRequest.getParameter("type");
		int subYear = Integer.parseInt(httpServletRequest.getParameter("subYear"));
		int sesmeter = Integer.parseInt(httpServletRequest.getParameter("sesmeter"));
		
		// 전체일때 타입을 빼고 조회 그게 아닐시에 타입을 넣고 조회
		if (type.equals("전체")) {
			List<GradeDto> gradeList = gradeService.selectBygradeBytypeAll(stu_id, subYear, sesmeter);
			model.addAttribute("gradeList", gradeList);
		}else {
			List<GradeDto> gradeList = gradeService.selectBygrade(stu_id, subYear, sesmeter, type);
			model.addAttribute("gradeList", gradeList);
		}
		model.addAttribute("yearList", yearList);		
		model.addAttribute("semesterList", semesterList);
		return "grade/semetergrade";
	};
	
}
