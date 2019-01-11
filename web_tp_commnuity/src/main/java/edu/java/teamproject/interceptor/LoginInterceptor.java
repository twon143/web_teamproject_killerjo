package edu.java.teamproject.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import edu.java.teamproject.model.User;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	private final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// loginPost() 컨트롤러가 실행되기 전
		logger.info("preHandle() 호출");
		
		// 세션에 혹시라도 남아있을 지 모르는 loginId 속성을 지움
		HttpSession session = request.getSession();

		session.removeAttribute("loginId");
		
		return true;
	}

	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		// loginPost() 컨트롤러가 리턴한 이후
		logger.info("postHandle() 호출");
	
		// request에는 targetUrl(로그인 후 이동할 페이지) 요청 파라미터가 있음
		String target = request.getParameter("queryString");
		logger.info("target: {}", target);
		
		// 컨트롤러에서는 로그인 결과(User/null)를 Model의 attribute로 실었음
		Map<String, Object> model = modelAndView.getModel();
		
		User result = (User) model.get("loginResult");
		
		if(result != null) { // 로그인 성공
			logger.info("로그인 성공");
			// 세션에 로그인 아이디 정보를 저장
			request.getSession().setAttribute("loginId", result.getId());
			
			// 로그인 성공 후에는 target URL로 이동(redirect)
			response.sendRedirect(target);
		} else { // 로그인 실패
			logger.info("로그인 실패");
			response.sendRedirect("/teamproject/user/login?url=" + target);
		}
		
	}

}
