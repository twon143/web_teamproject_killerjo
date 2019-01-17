package edu.java.teamproject.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
   @RequestMapping(value = "all/{}")
   public ResponseEntity<List<Answer>> readAllAnswer() {

      return null;
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