package com.green.university.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.university.dto.ScheduleDto;
import com.green.university.dto.ScheduleFormDto;
import com.green.university.dto.response.PrincipalDto;
import com.green.university.repository.model.Schedule;
import com.green.university.service.ScheuleService;
import com.green.university.utils.Define;

/**
 * 
 * @author 편용림
 *
 */

@Controller
@RequestMapping("/schedule")
public class ScheduleController {

	@Autowired
	private HttpSession session;
	
	@Autowired
	private ScheuleService scheuleService;
	
	/**
	 * 학사일정 페이지
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping("")
	public String schedule(Model model) {
		// 전체조회
		List<Schedule> schedule = scheuleService.readSchedule();
		// 월에 일정 수 조회
		model.addAttribute("schedule",schedule);
		return "/schedule/schedule";
		
	}
	
	@GetMapping("/list")
	public String ScheduleList(Model model, @RequestParam(defaultValue = "select") String crud) {
		model.addAttribute("crud", crud);
		List<Schedule> schedule = scheuleService.readSchedule();
		model.addAttribute("schedule", schedule);
		
		return "/schedule/scheduleList";
	}
	
	@PostMapping("/write")
	public String ScheduleProc(Model model, ScheduleFormDto scheduleFormDto) {
		System.out.println(scheduleFormDto);
		PrincipalDto principal = (PrincipalDto) session.getAttribute(Define.PRINCIPAL);
		scheuleService.createSchedule(principal.getId(), scheduleFormDto);
		
		return "/schedule/scheduleList";
	}
	
	
}
