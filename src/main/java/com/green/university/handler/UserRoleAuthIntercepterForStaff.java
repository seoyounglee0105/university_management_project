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
public class UserRoleAuthIntercepterForStaff implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		if (!"staff".equals(principal.getUserRole())) {
			throw new UnAuthorizedException("접근 권한이 없습니다. 관리자 전용 페이지", HttpStatus.UNAUTHORIZED);
			// return false;
		}
		return true;
	}



}