package com.green.university.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.university.dto.AllSubjectSearchFormDto;
import com.green.university.dto.CurrentSemesterSubjectSearchFormDto;
import com.green.university.dto.response.PrincipalDto;
import com.green.university.dto.response.SubjectDto;
import com.green.university.repository.model.Department;
import com.green.university.repository.model.PreStuSub;
import com.green.university.service.CollegeService;
import com.green.university.service.PreStuSubService;
import com.green.university.service.SubjectService;
import com.green.university.utils.Define;

/**
 * @author 서영
 * 수강 신청 관련 (preStuSub 포함)
 * 강의 시간표는 SubjectController 대신 일부러 여기에 넣음
 */

@Controller
@RequestMapping("/stuSub")
public class StuSubController {

	@Autowired
	private HttpSession session;
	
	@Autowired
	private SubjectService subjectService;
	
	@Autowired
	private CollegeService collegeService;
	
	@Autowired
	private PreStuSubService preStuSubService;
	
	// 과목 조회 (현재 학기)
	@GetMapping("/list")
	public String readSubjectList(Model model) {

		// 강의 리스트
		List<SubjectDto> subjectList = subjectService.readSubjectListByCurrentSemester();
		model.addAttribute("subjectList", subjectList);
		
		// 필터에 사용할 전체 학과 정보
		List<Department> deptList = collegeService.readDeptAll();
		model.addAttribute("deptList", deptList);
		
		// 필터에 사용할 강의 이름 정보 (중복 값 제거)
		List<String> subNameList = new ArrayList<>();
		for (SubjectDto subject : subjectList) {
			if (subNameList.contains(subject.getName()) == false) {
				subNameList.add(subject.getName());
			}
		}
		model.addAttribute("subNameList", subNameList);
		
		return "/stuSub/subList";
	}
	
	// 전체 강의 목록에서 필터링
	@GetMapping("/list/Search")
	public String readSubjectListSearch(Model model, @Validated CurrentSemesterSubjectSearchFormDto currentSemesterSubjectSearchFormDto) {
		
		// 강의 리스트
		List<SubjectDto> subjectList = subjectService.readSubjectListSearchByCurrentSemester(currentSemesterSubjectSearchFormDto);
		model.addAttribute("subjectList", subjectList);
		
		// 필터에 사용할 전체 학과 정보
		List<Department> deptList = collegeService.readDeptAll();
		model.addAttribute("deptList", deptList);
		
		// 필터에 사용할 강의 이름 정보 (중복 값 제거)
		List<String> subNameList = new ArrayList<>();
		for (SubjectDto subject : subjectList) {
			if (subNameList.contains(subject.getName()) == false) {
				subNameList.add(subject.getName());
			}
		}
		model.addAttribute("subNameList", subNameList);
		
		
		return "/stuSub/subList";
	}
	
	/**
	 * @return 예비 수강 신청
	 */
	@GetMapping("/preApplication")
	public String preStuSubApplication(Model model) {
		
		PrincipalDto principal = (PrincipalDto) session.getAttribute(Define.PRINCIPAL);
		
		// 강의 리스트
		List<SubjectDto> subjectList = subjectService.readSubjectListByCurrentSemester();
		
		for (SubjectDto sub : subjectList) {
			// 현재 담겨 있는지 확인
			PreStuSub preStuSub = preStuSubService.readPreStuSub(principal.getId(), sub.getId());
			if (preStuSub != null) {
				sub.setStatus(true);
			} else {
				sub.setStatus(false);
			}
		}
		model.addAttribute("subjectList", subjectList);
		
		// 필터에 사용할 전체 학과 정보
		List<Department> deptList = collegeService.readDeptAll();
		model.addAttribute("deptList", deptList);
		
		// 필터에 사용할 강의 이름 정보 (중복 값 제거)
		List<String> subNameList = new ArrayList<>();
		for (SubjectDto subject : subjectList) {
			if (subNameList.contains(subject.getName()) == false) {
				subNameList.add(subject.getName());
			}
		}
		model.addAttribute("subNameList", subNameList);
		
		
		return "/stuSub/preApplication";
	}
	
	/**
	 * 예비 수강 신청 처리 (신청)
	 */
	@PostMapping("/insertPreApp/{subjectId}")
	public String insertPreStuSubAppProc(@PathVariable Integer subjectId) {
		
		Integer studentId = ((PrincipalDto) session.getAttribute(Define.PRINCIPAL)).getId();
		
		preStuSubService.createPreStuSub(studentId, subjectId);
		
		return "redirect:/stuSub/preApplication";
	}
	
	/**
	 * 예비 수강 신청 처리 (취소)
	 */
	@DeleteMapping("/deletePreApp/{subjectId}")
	public String deletePreStuSubAppProc(@PathVariable Integer subjectId) {
		
		Integer studentId = ((PrincipalDto) session.getAttribute(Define.PRINCIPAL)).getId();
		
		preStuSubService.deletePreStuSub(studentId, subjectId);
		
		return "redirect:/stuSub/preApplication";
	}
	
	// 예비 수강 신청 강의 목록에서 필터링
	@GetMapping("/preApplication/Search")
	public String preStuSubApplicationSearch(Model model, @Validated CurrentSemesterSubjectSearchFormDto currentSemesterSubjectSearchFormDto) {
		
		PrincipalDto principal = (PrincipalDto) session.getAttribute(Define.PRINCIPAL);
		
		// 강의 리스트
		List<SubjectDto> subjectList = subjectService.readSubjectListSearchByCurrentSemester(currentSemesterSubjectSearchFormDto);
		
		for (SubjectDto sub : subjectList) {
			// 현재 담겨 있는지 확인
			PreStuSub preStuSub = preStuSubService.readPreStuSub(principal.getId(), sub.getId());
			if (preStuSub != null) {
				sub.setStatus(true);
			} else {
				sub.setStatus(false);
			}
		}
		model.addAttribute("subjectList", subjectList);
		
		// 필터에 사용할 전체 학과 정보
		List<Department> deptList = collegeService.readDeptAll();
		model.addAttribute("deptList", deptList);
		
		// 필터에 사용할 강의 이름 정보 (중복 값 제거)
		List<String> subNameList = new ArrayList<>();
		for (SubjectDto subject : subjectList) {
			if (subNameList.contains(subject.getName()) == false) {
				subNameList.add(subject.getName());
			}
		}
		model.addAttribute("subNameList", subNameList);
		
		
		return "/stuSub/preApplication";
	}
	
	
	/**
	 * @return 수강 신청
	 */
	@GetMapping("/application")
	public String stuSubApplication(Model model) {
	
		// 강의 리스트
		List<SubjectDto> subjectList = subjectService.readSubjectListByCurrentSemester();
		model.addAttribute("subjectList", subjectList);
		
		// 필터에 사용할 전체 학과 정보
		List<Department> deptList = collegeService.readDeptAll();
		model.addAttribute("deptList", deptList);
		
		// 필터에 사용할 강의 이름 정보 (중복 값 제거)
		List<String> subNameList = new ArrayList<>();
		for (SubjectDto subject : subjectList) {
			if (subNameList.contains(subject.getName()) == false) {
				subNameList.add(subject.getName());
			}
		}
		model.addAttribute("subNameList", subNameList);
		
		
		return "stuSub/application";
	}
	
	// 수강 신청 강의 목록에서 필터링
	@GetMapping("/application/Search")
	public String stuSubApplicationSearch(Model model, @Validated CurrentSemesterSubjectSearchFormDto currentSemesterSubjectSearchFormDto) {
		
		// 강의 리스트
		List<SubjectDto> subjectList = subjectService.readSubjectListSearchByCurrentSemester(currentSemesterSubjectSearchFormDto);
		model.addAttribute("subjectList", subjectList);
		
		// 필터에 사용할 전체 학과 정보
		List<Department> deptList = collegeService.readDeptAll();
		model.addAttribute("deptList", deptList);
		
		// 필터에 사용할 강의 이름 정보 (중복 값 제거)
		List<String> subNameList = new ArrayList<>();
		for (SubjectDto subject : subjectList) {
			if (subNameList.contains(subject.getName()) == false) {
				subNameList.add(subject.getName());
			}
		}
		model.addAttribute("subNameList", subNameList);
		
		
		return "/stuSub/application";
	}
	
	/**
	 * @return 수강 신청 내역
	 */
	@GetMapping("/appList")
	public String stuSubAppList(Model model) {
	
		
		return "stuSub/appList";
	}
	
}
