package com.green.university.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.university.dto.BreakAppFormDto;
import com.green.university.dto.response.PrincipalDto;
import com.green.university.handler.exception.CustomRestfullException;
import com.green.university.repository.model.BreakApp;
import com.green.university.repository.model.College;
import com.green.university.repository.model.Student;
import com.green.university.service.BreakAppService;
import com.green.university.service.CollegeService;
import com.green.university.service.StuStatService;
import com.green.university.service.UserService;
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
	
	@Autowired
	private StuStatService stuStatService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CollegeService collegeService;
	
	/**
	 * @return 휴복학 신청 페이지
	 */
	@GetMapping("/application")
	public String breakApplication(Model model) {
		
		PrincipalDto principal = (PrincipalDto) session.getAttribute(Define.PRINCIPAL);
		Student studentInfo = userService.readStudent(principal.getId());
		model.addAttribute("student", studentInfo);
		
		// 학과 이름
		String deptName = collegeService.readDeptById(studentInfo.getDeptId()).getName();
		model.addAttribute("deptName", deptName);
		
		// 단과대 이름
		String collName = collegeService.readCollById(collegeService.readDeptById(studentInfo.getDeptId()).getCollegeId()).getName();
		model.addAttribute("collName", collName);
		
		
		// principal로 바꾸기
		// 학생이 재학 상태가 아니라면 신청 불가능
		if (stuStatService.readCurrentStatus(principal.getId()).getStatus().equals("재학") == false) {
			throw new CustomRestfullException("휴학 신청 대상이 아닙니다.", HttpStatus.BAD_REQUEST);
		}
		
		return "break/application";
	}
	
	/**
	 * 휴복학 신청 (신청하면 교직원이 확인해서 승인하면 학적 변동)
	 * @return 휴복학 신청 내역 페이지
	 */
	@PostMapping("/application")
	public String breakApplicationProc(@Validated BreakAppFormDto breakAppFormDto) {
		
		PrincipalDto principal = (PrincipalDto) session.getAttribute(Define.PRINCIPAL);
		
		// 선택한 종료 연도-학기가 시작 연도-학기보다 이전이라면 신청 불가능
		// ex) 시작 연도-학기 : 2023-2 / 종료 연도-학기 2023-1
		if (Define.CURRENT_YEAR == breakAppFormDto.getToYear() && Define.CURRENT_SEMESTER > breakAppFormDto.getToSemester()) {
			throw new CustomRestfullException("종료 학기가 시작 학기 이전입니다.", HttpStatus.BAD_REQUEST);
		}
		// principal로 고치기
		breakAppFormDto.setStudentId(principal.getId());
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
		
		PrincipalDto principal = (PrincipalDto) session.getAttribute(Define.PRINCIPAL);
		
		// principal로 고치기
		List<BreakApp> breakAppList = breakAppService.readByStudentId(principal.getId());
		
		model.addAttribute("breakAppList", breakAppList);
		
		return "break/appListStudent";
	}
	
	/**
	 * @return 처리되지 않은 휴복학 신청 내역 페이지 (교직원용)
	 */
	@GetMapping("/appListStaff")
	public String breakAppListByState(Model model) {
		
		PrincipalDto principal = (PrincipalDto) session.getAttribute(Define.PRINCIPAL);
		
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
		
		Student studentInfo = userService.readStudent(breakApp.getStudentId());
		model.addAttribute("student", studentInfo);
		
		// 학과 이름
		String deptName = collegeService.readDeptById(studentInfo.getDeptId()).getName();
		model.addAttribute("deptName", deptName);
		
		// 단과대 이름
		String collName = collegeService.readCollById(collegeService.readDeptById(studentInfo.getDeptId()).getCollegeId()).getName();
		model.addAttribute("collName", collName);
		
		return "break/appDetail";
	}
	
	/**
	 * 휴학 신청 취소 (학생)
	 */
	@PostMapping("/delete/{id}")
	public String deleteBreakApp(@PathVariable Integer id) {
		
		PrincipalDto principal = (PrincipalDto) session.getAttribute(Define.PRINCIPAL);
		
		breakAppService.deleteById(id);
		
		return "redirect:/break/appList";
	}
	
	/**
	 * 휴학 신청 처리 (교직원)
	 */
	@PostMapping("/update/{id}")
	public String updateBreakApp(@PathVariable Integer id, String status) {	
		
		PrincipalDto principal = (PrincipalDto) session.getAttribute(Define.PRINCIPAL);
		
		breakAppService.updateById(id, status);
		
		return "redirect:/break/appListStaff";
	}
	
	
}