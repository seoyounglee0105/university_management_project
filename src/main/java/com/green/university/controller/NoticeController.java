package com.green.university.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.university.dto.NoticeFormDto;
import com.green.university.service.NoticeService;

/**
 * 
 * @author 박성희  Notice Controller
 *
 */
@Controller
@RequestMapping("/board")
public class NoticeController {
	@Autowired
	NoticeService noticeService;
	
	/**
	 * 
	 * @return 공지사항 페이지
	 */
	@GetMapping("/notice")
	public String notice() {
		return "/board/notice";
	}

	/**
	 * 
	 * @return 공지사항 입력 기능
	 */
	@PostMapping("/notice-proc")
	public String insertNotice(@Validated NoticeFormDto noticeFormDto) {
		noticeService.insertNotice(noticeFormDto);
		return "redirect:/board/notice";
	}
}
