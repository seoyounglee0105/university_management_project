package com.green.university.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 서영
 * 학적 변동 테이블 컨트롤러
 */
@Controller
@RequestMapping("/stuStat")
public class StuStatController {

	@Autowired
	private HttpSession session;
	
	
	
	/**
	 * @return 휴복학 신청 페이지
	 */
	@GetMapping("/application")
	public String stuStatApplication() {
		
		return "stuStat/application";
	}
	
	/**
	 * 휴복학 신청 (신청하면 교직원이 확인해서 승인하면 학적 변동)
	 * @return 
	 */
	@PostMapping("/application")
	public String stuStatApplicationProc() {
		
		return "redirect:stuStat/applicationList";
	}
	
	/**
	 * @return 휴복학 신청 내역 페이지
	 */
	@GetMapping("/list")
	public String stuStatList() {
		
		return "stuStat/appList";
	}
	
	/**
	 * @return 휴복학 신청서 확인
	 */
	@GetMapping("/detail/{id}")
	public String stuStatDetail(@PathVariable Integer id, Model model) {
		
		// 아이디에 따라 신청서 볼 수 있게 수정할 예정
		
		return "stuStat/appDatail";
	}
	
	/*
	 * 테스트용
	 */
	@GetMapping("/detail")
	public String stuStatDetailTest() {
		
		
		return "stuStat/appDetail";
	}
	
}
