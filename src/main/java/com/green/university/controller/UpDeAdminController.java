package com.green.university.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.university.dto.NoticeFormDto;
import com.green.university.service.AdminService;

/**
 * 
 * @author 박성희 Admin 수업 수정/삭제 Controller
 */
@Controller
@RequestMapping("/updAdmin")
public class UpDeAdminController {
	@Autowired
	private AdminService adminService;


	


	





	


	


	/**
	 * 
	 * @return 공지사항 입력 기능
	 */
	@PostMapping("/notice-proc")
	public String insertNotice(NoticeFormDto noticeFormDto) {
		adminService.insertNotice(noticeFormDto);
		return "redirect:/test";
	}
}
