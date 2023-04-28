package com.green.university.handler;

import org.apache.ibatis.javassist.NotFoundException;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

import com.green.university.handler.exception.CustomPageException;

/*
 * view 렌더링 위해 ModelAndView
 * 객체를 반환하도록 기본 설정 되어있다.
 * 예외 페이지를 리턴하도록 활용 예정
 * */
@ControllerAdvice
public class MyPageExceptionHandler {
	
//	// 사용자 정의 클래스 활용
//	@ExceptionHandler(CustomPageException.class)
//	public ModelAndView handleRuntimePageException(CustomPageException e) {
//		System.out.println("dfdf~~");
//		// ModelAndView 활용 방법
//		ModelAndView modelAndView = new ModelAndView("/error/errorPage");
//		modelAndView.addObject("statusCode", HttpStatus.NOT_FOUND.value());
//		modelAndView.addObject("message", e.getMessage());
//		return modelAndView;
//	}
	
//	@ExceptionHandler(NoHandlerFoundException.class)
//	public String notFoundException(NoHandlerFoundException e) {
//		StringBuffer sb = new StringBuffer();
//		e.getMessage();
//		sb.append("<script>");
//		sb.append("location.href='/error/';");
//		sb.append("</script>");
//		return sb.toString();
//	}
	
	
//	/**
//	 * 마이바티스 제약 오류
//	 * @param e
//	 * @return 에러페이지
//	 */
//	@ExceptionHandler(DataIntegrityViolationException.class)
//	public ModelAndView dataIntegrityViolationException(DataIntegrityViolationException e) {
//		ModelAndView modelAndView = new ModelAndView("errorPage");
//		modelAndView.addObject("statusCode", HttpStatus.NOT_FOUND.value());
//		modelAndView.addObject("message", e.getMessage());
//		return modelAndView;
//	}
	
	
}
