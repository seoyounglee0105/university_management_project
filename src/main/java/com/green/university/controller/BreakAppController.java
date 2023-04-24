package com.green.university.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
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
	public String breakApplication() {
		
		return "break/application";
	}
	
	/**
	 * 휴복학 신청 (신청하면 교직원이 확인해서 승인하면 학적 변동)
	 * @return 휴복학 신청 내역 페이지
	 */
	@PostMapping("/application")
	public String breakApplicationProc(BreakAppFormDto breakAppFormDto) {
		
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
	 * @return 휴복학 신청 내역 페이지 (학생용)
	 */
	@GetMapping("/appList")
	public String breakAppListByStudentId(Model model) {
		
		// principal로 고치기
		List<BreakApp> breakAppList = breakAppService.readByStudentId(2018000001);
		
		model.addAttribute("breakAppList", breakAppList);
		
		return "break/appListStudent";
	}
	
	/**
	 * @return 처리되지 않은 휴복학 신청 내역 페이지 (교직원용)
	 */
	@GetMapping("/appListStaff")
	public String breakAppListByState(Model model) {
		
		List<BreakApp> breakAppList = breakAppService.readByStatus("처리중");
		
		model.addAttribute("breakAppList", breakAppList);
		
		return "break/appListStaff";
	}
	
	/**
	 * @return 휴복학 신청서 확인
	 * 학생 / 교직원에 따라 옆에 카테고리랑 밑에 버튼 바뀌어야 함
	 */
	@GetMapping("/detail/{id}")
	public String breakDetail(@PathVariable Integer id, Model model) {
		
		BreakApp breakApp = breakAppService.readById(id);
		
		model.addAttribute("breakApp", breakApp);
		
		return "break/appDetail";
	}
	
	/**
	 * 휴학 신청 취소 (학생)
	 */
	@GetMapping("/delete/{id}")
	public String deleteBreakApp(@PathVariable Integer id) {
		
		breakAppService.deleteById(id);
		
		return "redirect:/break/appList";
	}
	
	/**
	 * 휴학 신청 처리 (교직원
	 */
	@GetMapping("/update/{id}")
	public String updateBreakApp(@PathVariable Integer id) {
		
		// 현재 로그인된 아이디가 교직원인지 확인
		
		return "redirect:/break/appListStaff";
	}
	
	
}
