package com.green.university.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.green.university.handler.exception.UnAuthorizedException;
import com.green.university.repository.model.User;
import com.green.university.utils.Define;

@Component
public class AuthIntercepter implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		if (session.getAttribute(Define.PRINCIPAL) == null) {
			throw new UnAuthorizedException("접근 권한이 없습니다. 로그인이 필요합니다.", HttpStatus.UNAUTHORIZED);
			// return false;
		}
		return true;
	}



}