package edu.java.teamproject.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import edu.java.teamproject.model.User;
import edu.java.teamproject.service.UserService;

public class RememberMeInterceptor extends HandlerInterceptorAdapter{

	private final Logger logger = LoggerFactory.getLogger(RememberMeInterceptor.class);
	
	@Autowired UserService userService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// 메인 페이지를 열기 전에 쿠키에 저장해놨던 세션 아이디와 DB의 유저 테이블에 저장된 session_key 값과 비교한후 
		// 비교한 값이 같으면 현재 세션에 해당 유저 정보를 저장함.
		HttpSession session = request.getSession();
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		if(loginCookie != null) {
			User user = userService.checkUserWithSessionKey(loginCookie.getValue());
			if(user != null) {
				session.setAttribute("login", user);
			}
		}
		return true;
	}

	
}
