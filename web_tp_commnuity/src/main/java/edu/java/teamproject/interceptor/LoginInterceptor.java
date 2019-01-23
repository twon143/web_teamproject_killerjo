package edu.java.teamproject.interceptor;

import java.net.URLEncoder;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.mvc.method.annotation.RequestResponseBodyMethodProcessor;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.java.teamproject.model.User;
import edu.java.teamproject.persistence.UserDao;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	private final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Autowired private UserDao userDao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// loginPost() 컨트롤러가 실행되기 전
		logger.info("preHandle() 호출");
		
		// 세션에 혹시라도 남아있을 지 모르는 loginId 속성을 지움
		HttpSession session = request.getSession();

		logger.info("clear session attribute about \'login\'");
		
		// 기존에 login이란 세션 값이 존재한다면 기존 값을 제거한다.
		session.removeAttribute("login");
		
		return true;
	}

	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		// loginPost() 컨트롤러가 리턴한 이후
		logger.info("postHandle() 호출");
		
		HttpSession session = request.getSession();
//		String use_cookie = request.getParameter("use_cookie");
		
//		logger.info("use_cookie : {}", use_cookie);
	
		// request에는 targetUrl(로그인 후 이동할 페이지) 요청 파라미터가 있음
		String target = request.getParameter("queryString");
		logger.info("target: {}", target);
		
		// 컨트롤러에서는 로그인 결과(User/null)를 Model의 attribute로 실었음
//		Map<String, Object> model = modelAndView.getModel();
		ModelMap modelMap = modelAndView.getModelMap();
		
		User result = (User) modelMap.get("loginResult");
		
		
		if(result != null && result.getVerify() == 1) { // 로그인 성공
			logger.info("로그인 성공");
			// 세션에 로그인 아이디 정보를 저장
			session.setAttribute("login", result);
			
            /*************************
             *  [   세션 추가되는 부분     ]  *
             *************************/
			// 1. 로그인이 성공하면, 그 다음으로 로그인 폼에서 쿠키가 체크된 상태로 로그인 요청이 왔는지를 확인한다.
			if(request.getParameter("use_cookie") != null) { 
				logger.info("remember me...");
				// 쿠키를 생성하고 현재 로그인되어 있을 때 생성되었던 세션의 id를 쿠키에 저장한다.
				Cookie cookie = new Cookie("loginCookie", session.getId());
				// 쿠키를 찾을 경로를 컨텍스트 경로로 변경해 주고...
				cookie.setPath("/");
				int amount = 60*60*24*7;
				cookie.setMaxAge(amount); // 단위는 (초)임으로 7일정도로 유효시간을 설정해 준다.
				
				// 쿠키를 적용해 준다.
                response.addCookie(cookie);
                
                // currentTimeMills()가 1/1000초 단위임으로 1000곱해서 더해야함
                Date sessionLimit = new Date(System.currentTimeMillis() + (1000*amount));

                if(userDao.keepLogin(result.getId(), session.getId(), sessionLimit) == 1) {
                	logger.info("현재 세션ID({})와 유효시간({}) 사용자 테이블 저장 success");
                } else {
                	logger.info("현재 세션ID({})와 유효시간({}) 사용자 테이블 저장 fail");
                }


			}
			
			// 로그인 성공 후에는 target URL로 이동(redirect)
			response.sendRedirect(target);
		} else if(result != null && result.getVerify() == 0) { // 회원정보는 있지만 메일인증이 되지 않은 경우
			logger.info("메일인증이 안된 회원 >> 메일인증을 하라고 알림");
			response.sendRedirect("/teamproject/user/notifyEmailConfirm?queryString=" + URLEncoder.encode(target, "utf-8"));
			
		} else { // 로그인 실패
			logger.info("로그인 실패");
			response.sendRedirect("/teamproject/user/user-login?queryString=" + URLEncoder.encode(target, "utf-8"));
		}
		
	}

}
