package edu.java.teamproject.controller;

import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.java.teamproject.model.Board;
import edu.java.teamproject.model.User;
import edu.java.teamproject.persistence.UserDao;
import edu.java.teamproject.service.ProfileService;
import edu.java.teamproject.service.ScrabService;


@Controller
@RequestMapping(value = "user")
public class ProfileController {

	@Autowired ProfileService profileService;
	@Autowired UserDao userDao;
	@Autowired ScrabService scrabService;

	@RequestMapping(value = "profile", method = RequestMethod.GET)
	public void myPostView (Model model, HttpSession session) {
		User user = (User)session.getAttribute("login");
		String loginId = user.getId();
		
		User login_user = userDao.loginCheck(user);
		List<Board> list = profileService.readByWriter(loginId);

		model.addAttribute("login_user", login_user);
		model.addAttribute("boardList", list);
		
	}
	
	@RequestMapping(value = "scrab", method = RequestMethod.GET)
	public void myScrabView(Model model, HttpSession session) {
		User user = (User)session.getAttribute("login");
		String loginId = user.getId();
		
		User login_user = userDao.loginCheck(user);
		List<Board> list = scrabService.myScrabList(loginId);

		model.addAttribute("login_user", login_user);
		model.addAttribute("boardList", list);
	}

	@RequestMapping(value = "profile-edit", method = RequestMethod.GET)
	public void myProfileEdit (HttpSession session, Model model) {
		User user = (User)session.getAttribute("login");
		String loginId = user.getId();
		
		User user1 = profileService.getUserInfo(loginId);
		model.addAttribute("user", user1);
	}
}
