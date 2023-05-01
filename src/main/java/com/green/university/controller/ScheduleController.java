package com.green.university.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.university.dto.ScheduleDto;
import com.green.university.repository.model.Schedule;
import com.green.university.service.ScheuleService;

@Controller
@RequestMapping("/scheule")
public class ScheduleController {

	@Autowired
	private ScheuleService scheuleService;
	
	@GetMapping("/main")
	public String scheule(Model model) {
		// 전체조회
		List<Schedule> schedule = scheuleService.readSchedule();
		// 월에 일정 수 조회
		List<ScheduleDto> mouths = scheuleService.readScheduleDto();
		model.addAttribute("mouth", mouths);
		model.addAttribute("schedule",schedule);
		return "/grade/schedule";
		
		
	}
}
