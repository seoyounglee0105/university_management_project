package com.green.university.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**todo 삭제
 * 
 * 페이지 테스트용
 * 
 * return에 jsp 파일 이름 적고 
 * localhost/test로 접근
 */

@Controller
@RequestMapping("/test")
public class TestController {

	@GetMapping("")
	public String mainTest() {
		
		// 파일 이름
		return "layout/main";
	}
	
	@GetMapping("/page")
	public String pageTest() {
		return "admin/department";
	}
}
