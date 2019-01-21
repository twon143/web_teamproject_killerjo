package edu.java.teamproject.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.java.teamproject.model.Board;
import edu.java.teamproject.model.User;
import edu.java.teamproject.service.ProfileService;

@Controller
@RequestMapping(value = "user")
public class ProfileController {

	@Autowired ProfileService profileService;

	@RequestMapping(value = "profile", method = RequestMethod.GET)
	public void myPostView (String id, Model model, HttpSession session) {
		User user = (User)session.getAttribute("login");
		String loginId = user.getId();
		if(loginId == null || loginId == "") {
			// 할일
		}
		else {
		List<Board> list = profileService.readByWriter(loginId);
		model.addAttribute("boardList", list);
		}
	}

	
}
