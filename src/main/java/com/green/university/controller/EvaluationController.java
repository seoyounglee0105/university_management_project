package com.green.university.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.university.dto.EvaluationFormDto;
import com.green.university.dto.response.PrincipalDto;
import com.green.university.handler.exception.CustomRestfullException;
import com.green.university.service.EvaluationService;
import com.green.university.utils.Define;

@Controller
@RequestMapping("/evaluation")
public class EvaluationController {

	@Autowired
	private HttpSession session;
	@Autowired
	private EvaluationService evaluationService;
	
	/**
	 * 편용림
	 * 
	 * @return 강의평가 화면 클릭
	 */
	@GetMapping("")
	public String evaluation(Model model, Integer subjectId) {
		model.addAttribute("subjectId", subjectId);
		return "/grade/evaluation"; 
	}
	
	/*
	 *  강의평가 insert 기능
	 */
	@PostMapping("/insert/{subjectId}")
	public String evaluationCheck(@PathVariable Integer subjectId, EvaluationFormDto evaluationFormDto, Model model ) {
		PrincipalDto principal = (PrincipalDto)session.getAttribute(Define.PRINCIPAL);
		
		// 강의평가 접속한 studentId랑 신청한 과목값을 넣어줘서 insert
		
		evaluationFormDto.setStudentId(principal.getId());
		evaluationFormDto.setSubjectId(subjectId);
		
		if (evaluationFormDto.getQna1() == null) {
			throw new CustomRestfullException("질문에 모두 답 해주세요", HttpStatus.BAD_REQUEST);
		}else if(evaluationFormDto.getQna2() == null) {
			throw new CustomRestfullException("질문에 모두 답 해주세요", HttpStatus.BAD_REQUEST);
		}else if(evaluationFormDto.getQna3() == null) {
			throw new CustomRestfullException("질문에 모두 답 해주세요", HttpStatus.BAD_REQUEST);
		}else if(evaluationFormDto.getQna4() == null) {
			throw new CustomRestfullException("질문에 모두 답 해주세요", HttpStatus.BAD_REQUEST);
		}else if(evaluationFormDto.getQna5() == null) {
			throw new CustomRestfullException("질문에 모두 답 해주세요", HttpStatus.BAD_REQUEST);
		}else if(evaluationFormDto.getQna6() == null) {
			throw new CustomRestfullException("질문에 모두 답 해주세요", HttpStatus.BAD_REQUEST);
		}else if(evaluationFormDto.getQna7() == null) {
			throw new CustomRestfullException("질문에 모두 답 해주세요", HttpStatus.BAD_REQUEST);
		}else {
			evaluationService.createEvanluation(evaluationFormDto);
		}
		
		// 창을 닫을 때 post가 작동이 안하는거 방지
		model.addAttribute("type", 1);
		return "/grade/evaluation";
		
	}
	
}
