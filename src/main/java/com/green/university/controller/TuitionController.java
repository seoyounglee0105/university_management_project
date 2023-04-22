package com.green.university.controller;

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
		
		List<Tuition> tuitionList = tuitionService.readTuitionList(2018000001);
		System.out.println(tuitionList);
		
		// 담긴 값이 없다면 null
		model.addAttribute("tuitionList", tuitionList);
		
		return "tuition/list";	
	}
	
}
