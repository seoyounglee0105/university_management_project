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
import org.springframework.web.bind.annotation.RequestParam;

import com.green.university.dto.AllSubjectSearchFormDto;
import com.green.university.dto.CurrentSemesterSubjectSearchFormDto;
import com.green.university.dto.response.PrincipalDto;
import com.green.university.dto.response.StuSubAppDto;
import com.green.university.dto.response.SubjectDto;
import com.green.university.repository.model.BreakApp;
import com.green.university.repository.model.Department;
import com.green.university.repository.model.PreStuSub;
import com.green.university.repository.model.StuStat;
import com.green.university.repository.model.StuSub;
import com.green.university.repository.model.Student;
import com.green.university.service.BreakAppService;
import com.green.university.service.CollegeService;
import com.green.university.service.PreStuSubService;
import com.green.university.service.StuStatService;
import com.green.university.service.StuSubService;
import com.green.university.service.SubjectService;
import com.green.university.service.UserService;
import com.green.university.utils.Define;
import com.green.university.utils.StuStatUtil;

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
	
	@Autowired
	private StuSubService stuSubService;
	
	@Autowired
	private StuStatService stuStatService;
	
	@Autowired
	private BreakAppService breakAppService;
	
	@Autowired
	private UserService userService;
	
	
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
		
		// 이번 학기에 재학 상태가 되지 않는 학생이라면 진입 불가
		PrincipalDto principal = (PrincipalDto) session.getAttribute(Define.PRINCIPAL);
		Student studentInfo = userService.readStudent(principal.getId());
		
		StuStat stuStatEntity = stuStatService.readCurrentStatus(studentInfo.getId());
		List<BreakApp> breakAppList = breakAppService.readByStudentId(studentInfo.getId()); // 최근 순으로 정렬되어 있음
		
		StuStatUtil.checkStuStat("수강신청", stuStatEntity, breakAppList);
		
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
	public String insertPreStuSubAppProc(@PathVariable Integer subjectId, @RequestParam Integer type) {
		
		Integer studentId = ((PrincipalDto) session.getAttribute(Define.PRINCIPAL)).getId();
		preStuSubService.createPreStuSub(studentId, subjectId);
		
		if (type == 0) {
			return "redirect:/stuSub/preApplication";
		} else {
			return "redirect:/stuSub/preAppList";
		}
	}
	
	/**
	 * 예비 수강 신청 처리 (취소)
	 */
	@DeleteMapping("/deletePreApp/{subjectId}")
	public String deletePreStuSubAppProc(@PathVariable Integer subjectId, @RequestParam Integer type) {
		
		Integer studentId = ((PrincipalDto) session.getAttribute(Define.PRINCIPAL)).getId();
		preStuSubService.deletePreStuSub(studentId, subjectId);
		
		if (type == 0) {
			return "redirect:/stuSub/preApplication";
		} else {
			return "redirect:/stuSub/preAppList";
		}
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
	
		// 이번 학기에 재학 상태가 되지 않는 학생이라면 진입 불가
		PrincipalDto principal = (PrincipalDto) session.getAttribute(Define.PRINCIPAL);
		Student studentInfo = userService.readStudent(principal.getId());
		
		StuStat stuStatEntity = stuStatService.readCurrentStatus(studentInfo.getId());
		List<BreakApp> breakAppList = breakAppService.readByStudentId(studentInfo.getId()); // 최근 순으로 정렬되어 있음
		StuStatUtil.checkStuStat("수강신청", stuStatEntity, breakAppList);
		
		// 강의 리스트
		List<SubjectDto> subjectList = subjectService.readSubjectListByCurrentSemester();
		for (SubjectDto sub : subjectList) {
			// 현재 담겨 있는지 확인
			StuSub stuSub = stuSubService.readStuSub(principal.getId(), sub.getId());
			if (stuSub != null) {
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
		
		
		return "stuSub/application";
	}
	
	// 수강 신청 강의 목록에서 필터링
	@GetMapping("/application/Search")
	public String stuSubApplicationSearch(Model model, @Validated CurrentSemesterSubjectSearchFormDto currentSemesterSubjectSearchFormDto) {
		
		PrincipalDto principal = (PrincipalDto) session.getAttribute(Define.PRINCIPAL);
		
		// 강의 리스트
		List<SubjectDto> subjectList = subjectService.readSubjectListSearchByCurrentSemester(currentSemesterSubjectSearchFormDto);
		for (SubjectDto sub : subjectList) {
			// 현재 담겨 있는지 확인
			StuSub stuSub = stuSubService.readStuSub(principal.getId(), sub.getId());
			if (stuSub != null) {
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
		
		return "/stuSub/application";
	}
	
	/**
	 * 수강 신청 처리 (신청)
	 */
	@PostMapping("/insertApp/{subjectId}")
	public String insertStuSubAppProc(@PathVariable Integer subjectId, @RequestParam Integer type) {
		
		Integer studentId = ((PrincipalDto) session.getAttribute(Define.PRINCIPAL)).getId();
		stuSubService.createStuSub(studentId, subjectId);
		
		if (type == 0) {
			return "redirect:/stuSub/application";
		} else {
			return "redirect:/stuSub/appList";
		}
	}
	
	/**
	 * 수강 신청 처리 (취소)
	 */
	@DeleteMapping("/deleteApp/{subjectId}")
	public String deleteStuSubAppProc(@PathVariable Integer subjectId, @RequestParam Integer type) {
		
		Integer studentId = ((PrincipalDto) session.getAttribute(Define.PRINCIPAL)).getId();
		stuSubService.deleteStuSub(studentId, subjectId);
		
		if (type == 0) {
			return "redirect:/stuSub/application";
		} else {
			return "redirect:/stuSub/appList";
		}
	}
	
	/**
	 * @return 예비 수강 신청 내역
	 */
	@GetMapping("/preAppList")
	public String preStuSubAppList(Model model, @RequestParam Integer type) {
		
		// 이번 학기에 재학 상태가 되지 않는 학생이라면 진입 불가
		PrincipalDto principal = (PrincipalDto) session.getAttribute(Define.PRINCIPAL);
		Student studentInfo = userService.readStudent(principal.getId());
		
		StuStat stuStatEntity = stuStatService.readCurrentStatus(studentInfo.getId());
		List<BreakApp> breakAppList = breakAppService.readByStudentId(studentInfo.getId()); // 최근 순으로 정렬되어 있음
		StuStatUtil.checkStuStat("수강신청", stuStatEntity, breakAppList);
		
		model.addAttribute("type", type);

		// 예비 수강 신청 기간에 조회 시
		if (type == 0) {
			List<StuSubAppDto> preStuSubList = preStuSubService.readPreStuSubList(principal.getId());
			model.addAttribute("stuSubList", preStuSubList);
			
			return "/stuSub/preAppList";
		}
		
		// 수강 신청 기간에 조회 시 (예비 수강 신청 목록에서 수강 신청으로 자동으로 넘어간 강의와, 직접 신청해야 하는 강의를 분리해서 보여줄 것)
		
		return "/stuSub/preAppList";
	}
	
	/**
	 * @return 수강 신청 내역
	 */
	@GetMapping("/appList")
	public String stuSubAppList(Model model) {
	
		// 이번 학기에 재학 상태가 되지 않는 학생이라면 진입 불가
		// 해당 학생의 학적 상태가 '졸업' 또는 '자퇴'라면 X
		// 해당 학생이 이번 학기 휴학을 승인받은 상태라면 X
		PrincipalDto principal = (PrincipalDto) session.getAttribute(Define.PRINCIPAL);
		Student studentInfo = userService.readStudent(principal.getId());
		
		StuStat stuStatEntity = stuStatService.readCurrentStatus(studentInfo.getId());
		List<BreakApp> breakAppList = breakAppService.readByStudentId(studentInfo.getId()); // 최근 순으로 정렬되어 있음
		StuStatUtil.checkStuStat("수강신청", stuStatEntity, breakAppList);
		
		List<StuSubAppDto> stuSubList = stuSubService.readStuSubList(principal.getId());
		model.addAttribute("stuSubList", stuSubList);
		
		return "stuSub/appList";
	}
	
}
