package edu.java.teamproject.interceptor;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

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

public class AuthInterceptor extends HandlerInterceptorAdapter{

	private final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Autowired private UserService userService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("preHandle() 호출");
		
		// 로그인되어 있는 경우 -> board/register 컨트롤러를 실행
		// 로그인 되어 있지 않으면 -> 로그인 페이지로 이동
		
		// session 객체를 가져옴
		HttpSession session = request.getSession();
		
		String target = getRedirectTarget(request);
		
		// login처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴
		Object obj = session.getAttribute("login"); 
		if (obj == null) {	// 로그인된 세션이 없는 경우...
			logger.info("로그인된 세션이 없는 경우...");
			
			// 우리가 만들어 논 쿠키를 꺼내온다.
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if(loginCookie != null) { // 쿠키가 존재하는 경우(이전에 로그인때 생성된 쿠키가 존재한다는 것)
				// loginCookie의 값을 꺼내오고 -> 즉, 저장해논 세션Id를 꺼내오고
				String sessionId = loginCookie.getValue();
				// 세션Id를 checkUserWithSessionKey에 전달해 이전에 로그인한적이 있는지 체크하는 메서드를 거쳐서
                // 유효시간이 > now() 인 즉 아직 유효시간이 지나지 않으면서 해당 sessionId 정보를 가지고 있는 사용자 정보를 반환한다.
				User user = userService.checkUserWithSessionKey(sessionId);
				
				if(user != null) { // 그런 사용자가 있다면
					// 세션을 생성한다.
					session.setAttribute("login", user);
					return true;
					
				}
			}
			
			// 이제 아래는 로그인도 안되있고 쿠키도 존재하지 않는 경우니까 다시 로그인 폼으로 돌려보내면 된다.
            // 로그인이 안되어 있는 상태임으로 로그인 폼으로 다시 돌려보냄(redirect)
			response.sendRedirect(target);
			return false;

			
			
		} 
		// preHandle의 return은 컨트롤러 요청 uri로 가도 되냐 안되냐를 허가하는 의미임
        // 따라서 true로하면 컨트롤러 uri로 가게 됨.
		return true;

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
