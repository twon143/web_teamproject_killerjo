package edu.java.teamproject.interceptor;

import java.io.UnsupportedEncodingException;
import java.util.Date;

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

public class LogoutInterceptor extends HandlerInterceptorAdapter{

	
	private final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Autowired private UserService userService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		logger.info("preHandle() 호출");
		
		HttpSession session = request.getSession();
		
		Object obj = session.getAttribute("login");
		
		if(obj != null) {
			User user = (User) obj;
			
			session.invalidate(); // Session 객체를 삭제
			//쿠키를 가져와보고
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if(loginCookie != null) {
				// null이 아니면 (쿠키가 존재하면)
				loginCookie.setPath("/");
				// 쿠키는 없앨 때 유효시간을 0으로 설정하는 것 !!! invalidate같은거 없음.
				loginCookie.setMaxAge(0);
				// 쿠키 설정을 적용한다.
				response.addCookie(loginCookie);
				
				// 사용자 테이블에서도 유효기간을 현재시간으로 다시 세팅해줘야함.
				Date date = new Date(System.currentTimeMillis());
				userService.keepLogin(user.getId(), session.getId(), date);
				
			}
			
			if(request.getParameter("queryString") != null) {
				String target = getRedirectTarget(request);
				logger.info(target);
				response.sendRedirect(target);
				return false;
			} else {
				return true;
			}
			
		}
		return false;
			
	}
	
	private String getRedirectTarget(HttpServletRequest request) throws UnsupportedEncodingException {
		
		String reqUrl = request.getParameter("queryString");
		logger.info("이동할 페이지: {}", reqUrl);
		
		return reqUrl;
	}

	
}
