package edu.java.teamproject.interceptor;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

public class PostInterceptor extends HandlerInterceptorAdapter {

	private Logger logger = LoggerFactory.getLogger(PostInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("[PostInterceptor]preHandle() 호출");
		
		
		/*
		Cookie[] cookies = request.getCookies();
		Cookie haveBnoCookie = WebUtils.getCookie(request, "haveBnoCookie");
		*/
		
		/*
		// 조회수 쿠키 없을때
		if (WebUtils.getCookie(request, "haveBnoCookie") == null) {
			logger.info("haveBnoCookie 없음");
			
			// bno의 값을 가지는 haveBnoCookie 이름의 쿠키생성
			Cookie readCntCookie = new Cookie("haveBnoCookie", request.getParameter("bno"));

			// 생성된 쿠키의 유효시간 설정 60 * 60 * 24
			readCntCookie.setMaxAge(60 * 60 * 24);

			// 조회수를 증가시킴
			// TODO:
			response.addCookie(readCntCookie);

		}
		// 조회수 쿠키 있을 때
		else {
			logger.info("haveBnoCookie 있음");
			
		}
		
		*/

		return super.preHandle(request, response, handler);
	}

}
