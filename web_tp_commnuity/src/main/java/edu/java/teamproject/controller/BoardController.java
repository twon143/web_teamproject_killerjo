package edu.java.teamproject.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "board")
public class BoardController {
   
   private final Logger logger = LoggerFactory.getLogger(BoardController.class);
   
   @RequestMapping(value="write-form", method = RequestMethod.GET)
   public void postRegister() {
      logger.info("BoardController--postRegister() 호출");
      
   }
   
   /* !!!테스트용!!! */
   @RequestMapping(value="post-write-test", method = RequestMethod.GET)
   public void postTest() {
      logger.info("글쓰기 테스트 호출 ");
   }
}