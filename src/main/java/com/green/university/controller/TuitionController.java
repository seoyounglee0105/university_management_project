package com.green.university.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.university.handler.exception.CustomRestfullException;
import com.green.university.repository.model.Tuition;
import com.green.university.service.StuStatService;
import com.green.university.service.TuitionService;
import com.green.university.utils.Define;

/**
 * 
 * @author 서영
 * 등록금, 장학금 관련
 *
 */

@Controller
@RequestMapping("/tuition")
public class TuitionController {

	@Autowired
	private HttpSession session;
	
	@Autowired
	private TuitionService tuitionService;
	
	@Autowired
	private StuStatService stuStatService;
	
	/**
	 * @return 납부된 등록금 내역 조회 페이지
	 */
	@GetMapping("/list")
	public String tuitionList(Model model) {
		
		// todo 로그인 기능 추가 시 이걸로 수정
//		 User principal = (User) session.getAttribute(Define.PRINCIPAL);
		
		// principal.getId()를 매개변수로
		List<Tuition> tuitionList = tuitionService.readTuitionListByStatus(2018000001, true);
		
		model.addAttribute("tuitionList", tuitionList);
		
		return "tuition/tuiList";	
	}
	
	/**
	 * 해당 학기 (2023-1)에 등록금을 납부한 기록이 있다면 납부하기 버튼 제거
	 * 
	 * 현재 '재학' 상태인 사용자만 진입 가능하게 할 예정
	 * @return 등록금 납부 고지서 조회 페이지
	 */
	@GetMapping("/payment")
	public String tuitionPayment(Model model) {
		
		// todo 로그인 기능 추가 시 이걸로 수정
//		 User principal = (User) session.getAttribute(Define.PRINCIPAL);
		
		// 재학 상태의 사용자만 들어올 수 있게 함
//		if () {
//			throw new CustomRestfullException("등록금 납부 대상이 아닙니다.", null);
//		}
		
		// principal.getId()를 매개변수로
		Tuition tuitionEntity = tuitionService.readByStudentIdAndSemester(2018000001, Define.CURRENT_YEAR, Define.CURRENT_SEMESTER);
		
		// 등록금 고지서가 생성되어 있지 않다면 들어올 수 없음
		if (tuitionEntity == null) {               // 이거 Http 상태 코드 다른 거 해야 할 것 같은데 임시로 이거
			throw new CustomRestfullException("등록금 납부 기간이 아닙니다.", HttpStatus.BAD_REQUEST);
		}
		
		model.addAttribute("tuition", tuitionEntity);
		
		return "tuition/payment";
	}
	
	/**
	 * 등록금 납부
	 * @return 등록금 납부 페이지로 다시 돌아가서 납부 완료됨을 보여주기
	 */
	@PostMapping("/payment")
	public String tuitionPaymentProc() {
		// principal.getId()를 매개변수로
		tuitionService.updateStatus(2018000001);
		
		return "redirect:/tuition/payment";
	}
	
	/**
	 * 장학금 유형 설정 + 등록금 납부 고지서 생성 페이지
	 */
	@GetMapping("/create")
	public String CreatePayment(Model model) {
		
		return "tuition/createPayment";
	}
	
	/**
	 * 등록금 납부 고지서 생성
	 */
	@GetMapping("/createTui")
	public String CreateTuiProc(Model model) {
		
		List<Integer> studentIdList = stuStatService.readIdList();
		
		// 고지서 생성 개수 반환
		int insertCount = 0;
		
		// 일괄 생성 (고지서 생성 대상인지는 서비스에서 확인)
		for (Integer studentId : studentIdList) {
			System.out.println(studentId);
			// 생성될 때마다 +1됨
			insertCount += tuitionService.createTuition(studentId);
		}
		
		// jsp로 값 보내기
		model.addAttribute("insertCount", insertCount);
		System.out.println(insertCount);
		
		return "tuition/createPayment";
	}
	
	
	
}
