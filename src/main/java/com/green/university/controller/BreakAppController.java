package com.green.university.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.university.dto.BreakAppFormDto;
import com.green.university.handler.exception.CustomRestfullException;
import com.green.university.repository.model.BreakApp;
import com.green.university.service.BreakAppService;
import com.green.university.utils.Define;

/**
 * @author 서영
 * 휴학 신청 관련 컨트롤러
 */
@Controller
@RequestMapping("/break")
public class BreakAppController {

	@Autowired
	private HttpSession session;
	
	@Autowired
	private BreakAppService breakAppService;
	
	
	/**
	 * @return 휴복학 신청 페이지
	 */
	@GetMapping("/application")
	public String stuStatApplication() {
		
		return "break/application";
	}
	
	/**
	 * 휴복학 신청 (신청하면 교직원이 확인해서 승인하면 학적 변동)
	 * @return 휴복학 신청 내역 페이지
	 */
	@PostMapping("/application")
	public String stuStatApplicationProc(BreakAppFormDto breakAppFormDto) {
		
		// 선택한 종료 연도-학기가 시작 연도-학기보다 이전이라면 신청 불가능
		// ex) 시작 연도-학기 : 2023-2 / 종료 연도-학기 2023-1
		if (Define.CURRENT_YEAR == breakAppFormDto.getToYear() && Define.CURRENT_SEMESTER > breakAppFormDto.getToSemester()) {
			throw new CustomRestfullException("종료 학기가 시작 학기 이전입니다.", HttpStatus.BAD_REQUEST);
		}
		// principal로 고치기
		breakAppFormDto.setStudentId(2018000001);
		breakAppFormDto.setFromYear(Define.CURRENT_YEAR);
		breakAppFormDto.setFromSemester(Define.CURRENT_SEMESTER);
		
		breakAppService.createBreakApp(breakAppFormDto);
		
		return "redirect:/break/appList";
	}
	
	/**
	 * @return 휴복학 신청 내역 페이지
	 */
	@GetMapping("/appList")
	public String stuStatList(Model model) {
		
		// principal로 고치기
		List<BreakApp> breakAppList = breakAppService.readByStudentId(2018000001);
		
		model.addAttribute("breakAppList", breakAppList);
		
		return "break/appList";
	}
	
	/**
	 * @return 휴복학 신청서 확인
	 */
	@GetMapping("/detail/{id}")
	public String stuStatDetail(@PathVariable Integer id, Model model) {
		
		BreakApp breakApp = breakAppService.readById(id);
		
		model.addAttribute("breakApp", breakApp);
		
		return "break/appDetail";
	}
	
}
