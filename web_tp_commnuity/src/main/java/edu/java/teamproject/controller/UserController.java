package edu.java.teamproject.controller;


import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import edu.java.teamproject.model.User;
import edu.java.teamproject.service.UserService;

@Controller
@RequestMapping(value = "user")
public class UserController {

	private final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public void register() {
		logger.info("register() 호출");
	}
	
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(User user) {
		logger.info("register({}) 호출", user);
		
		try {
			userService.signUp(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/teamproject/";
	}

	
	@RequestMapping(value = "emailConfirm", method = RequestMethod.GET)
	public void emailConfirm(String user_email, Model model) {
		userService.enableUserLogin(user_email);
		model.addAttribute("user_email", user_email);
		
	}
	
	@RequestMapping(value = "user-login", method = RequestMethod.GET)
	public void login(String url, Model model) {
		logger.info("login() 호출");
		
		// url : 로그인 페이지 이동 전의 페이지 url >> 로그인 후 해당 페이지로 이동하기 위함
		if(url != null) {
			model.addAttribute("targetUrl", url);
		}
	}
	
	@RequestMapping(value = "login-post", method = RequestMethod.POST)
	public void loginPost(User user, Model model) {
		logger.info("loginPost({})", user);
		
		User result = userService.signIn(user);
		model.addAttribute("loginResult", result);
	}
	
	@RequestMapping(value = "logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		logger.info("logout() 호출");
		Object obj = session.getAttribute("login");
		
		logger.info("login: {}", obj);
		
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
			
		}
		
		return "redirect:/"; // 메인 페이지로 이동
	}
}
