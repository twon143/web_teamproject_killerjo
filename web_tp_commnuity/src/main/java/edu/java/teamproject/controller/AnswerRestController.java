package edu.java.teamproject.controller;

import java.util.List;

import javax.swing.text.html.parser.Entity;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.java.teamproject.model.Answer;
import edu.java.teamproject.service.AnswerServiceDao;

@RestController
@RequestMapping(value = "answer")
public class AnswerRestController {

   private final Logger logger = LoggerFactory.getLogger(AnswerRestController.class);
   @Autowired private AnswerServiceDao answerServiceDao;
   
   // 답변 리스트 불러오기
   @RequestMapping(value = "all/{board_num}" , method=RequestMethod.GET)
   public ResponseEntity<List<Answer>> readAllAnswer(@PathVariable(name="board_num") int board_num) {
	  logger.info("readAllAnswer(board_num: {}) 호출", board_num);
	  
	  List<Answer> list = answerServiceDao.readAllAnswer(board_num);
	  ResponseEntity<List<Answer>> entity = new ResponseEntity<List<Answer>>(list, HttpStatus.OK);
	 
      return entity;
   }
   
   
   
   @RequestMapping(method=RequestMethod.POST)
   public ResponseEntity<Integer> insertAnswer(@RequestBody Answer answer) {
      
      logger.info("insertAnswer({})", answer.toString());
      
      int result = answerServiceDao.insertAnswer(answer);
      
  
      ResponseEntity<Integer> entity = null;
      
      // TODO: insert 결과를 받아서 jsp로 보내줌
      if(result == 1) {
         entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
      }
      
      else {
    	  entity = new ResponseEntity<Integer>(result, HttpStatus.BAD_REQUEST);
      }
      
      return entity;
   }

}