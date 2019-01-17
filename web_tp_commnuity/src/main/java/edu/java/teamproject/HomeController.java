package edu.java.teamproject;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.java.teamproject.service.BoardService;
import edu.java.teamproject.util.Criteria;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired private BoardService boardService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session, Criteria criteria) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		logger.info("session 값 확인 : {}", session.getAttribute("login"));
		
//		criteria.setPerPageNum(12);
		
		model.addAttribute("popularQuestionList", boardService.listCriteria(criteria, "all", "question", "popular"));
		model.addAttribute("popularWritingList", boardService.listCriteria(criteria, "all", "writing", "popular"));
		
		logger.info("criteria : {}", criteria);
		
		model.addAttribute("criteria", criteria);
		model.addAttribute("category", "all");
		model.addAttribute("sort", "popular");
		/*model.addAttribute("category", "all");
		model.addAttribute("type", "all");*/
		
		
		return "main";
	}
	
}
