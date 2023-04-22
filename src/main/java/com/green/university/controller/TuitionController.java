package com.green.university.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.university.repository.model.Tuition;
import com.green.university.repository.model.User;
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
	
	/**
	 * @return 등록금 내역 조회 페이지
	 */
	@GetMapping("/list")
	public String tuitionList(Model model) {
		
		// todo 로그인 기능 추가 시 이걸로 수정
//		 User principal = (User) session.getAttribute(Define.PRINCIPAL);
		
		// principal.getId()를 매개변수로
		List<Tuition> rawTuitionList = tuitionService.readTuitionList(2018000001);

		// 납부 완료한 등록금 내역만 보내기 위해 새 리스트 생성
		ArrayList<Tuition> tuitionList = null;
		if (rawTuitionList.isEmpty() == false) {
			tuitionList = new ArrayList<>();
			for (Tuition t : rawTuitionList) {
				if (t.getStatus() == true) {
					tuitionList.add(t);					
				}
			}
		}
		
		// 담긴 값이 없다면 null
		model.addAttribute("tuitionList", tuitionList);
		
		return "tuition/list";	
	}
	
	/**
	 * 해당 학기 (2023-1)에 등록금을 납부한 기록이 없으며,
	 * 현재 '재학' 상태인 사용자만 진입 가능하게 할 예정
	 * @return 등록금 납부 고지서 조회 페이지
	 */
	@GetMapping("/payment")
	public String tuitionPayment(Model model) {
		
		return "tuition/payment";
	}
	
	/**
	 * 등록금 납부 고지서 생성 테스트용
	 */
	@GetMapping("/test")
	public String tuitionTest(Model model) {
		tuitionService.createTuition(2018000001);
		
		return "tuition/test";
	}
}
