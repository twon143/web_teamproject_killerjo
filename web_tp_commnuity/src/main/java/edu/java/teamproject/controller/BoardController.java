package edu.java.teamproject.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "board")
public class BoardController {
	
	private final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping(value="/write-question")
	public void postRegister() {
		logger.info("BoardController--postRegister() 호출");
		
	}
}