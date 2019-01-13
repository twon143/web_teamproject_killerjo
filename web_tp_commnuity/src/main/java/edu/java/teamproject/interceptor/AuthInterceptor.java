package edu.java.teamproject.interceptor;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import edu.java.teamproject.model.User;

public class AuthInterceptor extends HandlerInterceptorAdapter{

	private final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("preHandle() 호출");
		
		
		// 로그인되어 있는 경우 -> board/register 컨트롤러를 실행
		// 로그인 되어 있지 않으면 -> 로그인 페이지로 이동
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("login"); 
		if (obj != null) {	
			logger.info("로그인 상태 : {}", (User)obj);
			
			return true;
		} else {
			logger.info("로그아웃 상태");
			
			String target = getRedirectTarget(request);
			response.sendRedirect(target);
			
			return false;

			
			
		} 
	}
	
	private String getRedirectTarget(HttpServletRequest request) throws UnsupportedEncodingException {
		// teamproject/user/user-login?url=http://... 로그인 페이지 주소 리턴
		
		String reqUrl = request.getRequestURL().toString();
		logger.info("요청 주소: {}", reqUrl);
		
		String queryString = request.getQueryString();
		logger.info("질의 문자열: {}", queryString);
		
		String targetUrl = "";
		if(queryString == null) {
			targetUrl = reqUrl;
		} else {
			targetUrl = reqUrl + "?" + queryString;
		}
		
		String target = "/teamproject/user/user-login?url=" + URLEncoder.encode(targetUrl, "utf-8");
		logger.info("target: {}", target);
		
		return target;
	}

	
}
