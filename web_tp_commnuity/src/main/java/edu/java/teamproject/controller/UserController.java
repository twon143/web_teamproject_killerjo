package edu.java.teamproject.controller;


import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.java.teamproject.model.User;
import edu.java.teamproject.service.UserService;

@Controller
@RequestMapping(value = "user")
public class UserController {

	private final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private UserService userService;

	// 아이디 중복 검사
	@ResponseBody
	@RequestMapping(value = "checkId", method = RequestMethod.POST)
	public int checkId(String id) {
		logger.info("checkId() 호출");
		int result = userService.checkId(id);
		logger.info("result2 : " + result);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "checkNickname", method = RequestMethod.POST)
	public int checkNickname(String nickname) {
		logger.info("checkNickname() 호출");
		int result = userService.checkNickname(nickname);
		return result;
	}

	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(User user, HttpServletRequest request) throws UnsupportedEncodingException {
		logger.info("register(user : {}, queryString : {}) 호출", user, request.getParameter("queryString"));

		try {
			userService.signUp(user, request.getParameter("queryString"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

//		redirectAttributes.addFlashAttribute("signUpMsg", "REGISTERED");

		return "redirect:/user/notifyEmailConfirm?queryString=" + URLEncoder.encode(request.getParameter("queryString"), "utf-8");
	}

	@RequestMapping(value = "notifyEmailConfirm", method = RequestMethod.GET)
	public void notifyEmailConfirm(@ModelAttribute("queryString") String queryString) {
		logger.info("notifyEmailConfirm(queryString : {})", queryString);
	}

	@RequestMapping(value = "emailConfirm", method = RequestMethod.GET)
	public void emailConfirm(@ModelAttribute("user_id") String user_id, @ModelAttribute("queryString") String queryString) {
		logger.info("emailConfirm(user_id : {}, queryString : {})", user_id, queryString);
		userService.enableUserLogin(user_id);
//		model.addAttribute("user_Id", user_id);

	}

	@RequestMapping(value = "user-login", method = RequestMethod.GET)
	public void login(@ModelAttribute("queryString") String queryString, RedirectAttributes redirectAttributes) {
		logger.info("login() 호출");
		
		// queryString : 로그인 페이지 이동 전의 페이지 url >> 로그인 후 해당 페이지로 이동하기 위함
	}

	@RequestMapping(value = "login-post", method = RequestMethod.POST)
	public void loginPost(User user, Model model, RedirectAttributes redirectAttributes) {
		logger.info("loginPost({})", user);

		// 로그인 결과를 리턴함
		
		User result = userService.signIn(user);
		if(result == null) {
			redirectAttributes.addFlashAttribute("loginResult", "fail");
		}
		
		model.addAttribute("loginResult", result);
	}

	@RequestMapping(value = "logout", method = RequestMethod.POST)
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		logger.info("logout() 호출");

		return "redirect:/"; // 메인 페이지로 이동
	}
}
