package com.green.university.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.university.dto.NoticeFormDto;
import com.green.university.repository.model.Notice;
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
	public String notice(Model model, @RequestParam(defaultValue = "select") String crud) {
		model.addAttribute("crud", crud);
		List<Notice> noticeList = noticeService.findNotice();
		if (noticeList.isEmpty()) {
			model.addAttribute("noticeList", null);
		} else {
			model.addAttribute("noticeList", noticeList);
		}
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
	
	/**
	 * 
	 * @return 공지사항 상세 조회 기능
	 */
	@GetMapping("/notice-proc-detail")
	public String findByIdNotice(Model model, @RequestParam Integer id) {		
		model.addAttribute("crud", "selectDetail");
		model.addAttribute("id", id);
		Notice notice = noticeService.findByIdNotice(id);
		if (notice == null) {
			model.addAttribute("notice", null);
		} else {
			model.addAttribute("notice", notice);
		}
		return "/board/notice";
	}
	
	/**
	 * 
	 * @return 공지사항 수정 페이지
	 */
	@GetMapping("/notice-update-page")
	public String update(Model model, @RequestParam Integer id) {		
		model.addAttribute("crud", "update");
		model.addAttribute("id", id);

		Notice notice = noticeService.findByIdNotice(id);
		model.addAttribute("notice", notice);
		return "/board/notice";
	}
	
	
	/**
	 * 
	 * @return 공지사항 수정 기능
	 */
	@PostMapping("/notice-update")
	public String update(@Validated NoticeFormDto noticeFormDto) { 
		System.out.println(noticeFormDto);
		noticeService.updateNotice(noticeFormDto);
		return "redirect:/board/notice";
	}
	
	
	/**
	 * 
	 * @return 공지사항 삭제 조회 기능
	 */
	@GetMapping("/notice-delete")
	public String delete(Model model, @RequestParam Integer id) {		

		return "/board/notice";
	}
	
}
