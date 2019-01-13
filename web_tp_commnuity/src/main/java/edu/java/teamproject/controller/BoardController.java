package edu.java.teamproject.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.java.teamproject.service.BoardService;
import edu.java.teamproject.util.Criteria;

@Controller
@RequestMapping(value = "board")
public class BoardController {
   
   private final Logger logger = LoggerFactory.getLogger(BoardController.class);
   
   @Autowired private BoardService boardService;
   
   @RequestMapping(value="write-form", method = RequestMethod.GET)
   public void postRegister() {
      logger.info("BoardController--postRegister() 호출");
      
   }
   
   /* !!!테스트용!!! */
   @RequestMapping(value="post-write-test", method = RequestMethod.GET)
   public void postTest() {
      logger.info("글쓰기 테스트 호출 ");
   }
   
   @RequestMapping(value = "listCriteria", method = RequestMethod.GET)
   public void listCriteria(Model model, Criteria criteria) {
	   logger.info("listCriteria({})", criteria);
	   model.addAttribute("boardList", boardService.listCriteria(criteria));
	   
   }
}