package com.green.university.handler;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.NoHandlerFoundException;

import com.green.university.handler.exception.CustomPathException;
import com.green.university.handler.exception.CustomRestfullException;
import com.green.university.handler.exception.UnAuthorizedException;

@RestControllerAdvice // IoC 대상 + AoP 기반
public class MyRestFullExceptionHandler {

	@ExceptionHandler(Exception.class)
	public void exception(Exception e) {
		System.out.println(e.getClass().getName());
		System.out.println(e.getMessage());
	}
	

	
	// 사용자 정의 예외 클래스 활용
	@ExceptionHandler(CustomRestfullException.class)
	public String basicException(CustomRestfullException e) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("alert('"+ e.getMessage() +"');"); 
		sb.append("history.back();");
		sb.append("</script>");
		return sb.toString();
	}
	
	@ExceptionHandler(UnAuthorizedException.class)
	public String unAuthorizedException(UnAuthorizedException e) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("alert('"+ e.getMessage() +"');"); 
		sb.append("history.back();");
		sb.append("</script>");
		return sb.toString();
	}
	
	/**
	 * @author 서영
	 * 경로를 지정해서 던지는 예외 클래스 활용
	 */
	@ExceptionHandler(CustomPathException.class)
	public String unAuthorizedException(CustomPathException e) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("alert('"+ e.getMessage() +"');");
		sb.append("location.href='" + e.getPath() + "';");
		sb.append("</script>");
		return sb.toString();
	}
	
	@ExceptionHandler(NoHandlerFoundException.class)
	public String notFoundException(NoHandlerFoundException e) {
		System.out.println(e.getMessage());
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("location.href='/error/';");
		sb.append("</script>");
		return sb.toString();
	}
	
}
