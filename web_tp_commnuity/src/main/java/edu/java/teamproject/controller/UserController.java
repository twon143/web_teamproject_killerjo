package edu.java.teamproject.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void login(String url, Model model) {
		logger.info("login() 호출");
		
		// url : 로그인 페이지 이동 전의 페이지 url >> 로그인 후 해당 페이지로 이동하기 위함
		
		if(url != null) {
			model.addAttribute("targetUrl", url);
		}
	}
	
	@RequestMapping(value = "login-post", method = RequestMethod.POST)
	public void login(User user, Model model) {
		logger.info("loginPost({})", user);
		
		User result = userService.signIn(user);
		model.addAttribute("loginResult", result);
	}
	
	@RequestMapping(value = "logout")
	public String logout(HttpSession session) {
		logger.info("logout() 호출");
		logger.info("loginId: {}", session.getAttribute("loginId"));
		
		session.invalidate(); // Session 객체를 삭제
		
		return "redirect:/"; // 메인 페이지로 이동
	}
}
