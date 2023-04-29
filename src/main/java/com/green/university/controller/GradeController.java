package com.green.university.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.university.dto.response.GradeDto;
import com.green.university.dto.response.MyGradeDto;
import com.green.university.dto.response.PrincipalDto;
import com.green.university.repository.model.Evaluation;
import com.green.university.service.EvaluationService;
import com.green.university.service.GradeService;
import com.green.university.utils.Define;

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
	@GetMapping("/thisSemester")
	public String grade(Model model) {
		PrincipalDto principal = (PrincipalDto)session.getAttribute(Define.PRINCIPAL);
		
		//내가 수강 신청한 연도가 있는지 검사할려고 추가한 기능
		List<GradeDto> yearList = gradeService.readSubYear(principal.getId());
		
		model.addAttribute("yearList",yearList);
		if (yearList.size() != 0) {
			// 금학기 성적조회 기능
			List<GradeDto> gradeList = gradeService.readStuSubList(principal.getId());
			model.addAttribute("gradeList",gradeList);
			// 누계 성적 조회
			MyGradeDto mygradeList = gradeService.readSumAndAverageByGrade(principal.getId());
			model.addAttribute("mygrade", mygradeList);
			
		}
		return "grade/thisgrade";
	}
	
	
	/**
	 * 
	 * @param 
	 * @return 학기별 성적조회
	 */
	@GetMapping("/semester")
	public String thisgrade(Model model) {
		
		PrincipalDto principal = (PrincipalDto)session.getAttribute(Define.PRINCIPAL);
			
			// 조회하는 기능
			List<GradeDto> gradeAllList = gradeService.findAll(principal.getId());
			// 학생이 신청한 연도가 있는지 찾는 기능
			List<GradeDto> yearList = gradeService.readSubYear(principal.getId());
			// 학생이 신청한 학기가 있는지 찾는 기능
			List<GradeDto> semesterList = gradeService.readSesmeter(principal.getId());
			
			
			model.addAttribute("semesterList",semesterList);
			model.addAttribute("yearList",yearList);
			model.addAttribute("gradeList",gradeAllList);
		return "grade/semetergrade";
	}
	
	/**
	 *  작성자 : 편용림
	 *  년도 학기 전공 조회 기능
	 *  
	 * @return
	 */
	@PostMapping("/read")
	public String select(Model model, HttpServletRequest httpServletRequest) {
		
		PrincipalDto principal = (PrincipalDto)session.getAttribute(Define.PRINCIPAL);
		
	
		List<GradeDto> yearList = gradeService.readSubYear(principal.getId());
		List<GradeDto> semesterList = gradeService.readSesmeter(principal.getId());
		String type = httpServletRequest.getParameter("type");
		int subYear = Integer.parseInt(httpServletRequest.getParameter("subYear"));
		int sesmeter = Integer.parseInt(httpServletRequest.getParameter("sesmeter"));
		// 전체일때 타입을 빼고 조회 그게 아닐시에 타입을 넣고 조회
		if (type.equals("전체")) {
			List<GradeDto> gradeList = gradeService.selectBygradeBytypeAll(principal.getId(), subYear, sesmeter);
			model.addAttribute("gradeList", gradeList);
		}else {
			List<GradeDto> gradeList = gradeService.selectBygrade(principal.getId(), subYear, sesmeter, type);
			model.addAttribute("gradeList", gradeList);
		}
		model.addAttribute("yearList", yearList);		
		model.addAttribute("semesterList", semesterList);
		return "grade/semetergrade";
	};
	
	
	/**
	 * 
	 * @param 
	 * @return 토탈 누계성적 조회
	 */
	@GetMapping("total")
	public String totalgrade(Model model) {
		
		PrincipalDto principal = (PrincipalDto)session.getAttribute(Define.PRINCIPAL);
		
		List<MyGradeDto> mygradeList = gradeService.readgradeinquiryList(principal.getId());
		model.addAttribute("mygradeList", mygradeList);
		return "grade/totalgrade";
	}
	
}
