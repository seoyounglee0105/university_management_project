package com.green.university.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/scheule")
public class ScheduleController {

	
	@GetMapping("/main")
	public String scheule() {
		return "/grade/schedule";
	}
}
