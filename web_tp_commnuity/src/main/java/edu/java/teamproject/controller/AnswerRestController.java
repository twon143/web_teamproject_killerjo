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
import edu.java.teamproject.model.Reply;
import edu.java.teamproject.service.AnswerServiceDao;
import edu.java.teamproject.service.ReplyService;

@RestController
@RequestMapping(value = "answer")
public class AnswerRestController {

   private final Logger logger = LoggerFactory.getLogger(AnswerRestController.class);
   @Autowired private AnswerServiceDao answerServiceDao;
   @Autowired private ReplyService replyService;
   
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
   @RequestMapping(value = "insertAnswerReply", method = RequestMethod.POST)
   public ResponseEntity<Integer> insertAnswerReply(@RequestBody Reply reply) {
	   logger.info("insertAnswerReply({}) 호출", reply);
	   ResponseEntity<Integer> entity = null;
	   int result = replyService.insertAnswerReply(reply);
	   if(result == 1) {
		   entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
	   }
	   
	   else {
		   entity = new ResponseEntity<Integer>(result, HttpStatus.BAD_REQUEST);
	   }
	   return entity;
   }
   
   @RequestMapping(value = "readAllAnswerReply/{ano}", method = RequestMethod.GET)
   public ResponseEntity<List<Reply>> readAllAnswerReply(@PathVariable(name="ano") int ano) {
	   String type = "answer";
	   logger.info("readAllAnswerReply({}) 호출", ano);
	   List<Reply> list = replyService.readAllAnswerReply(ano, type);
	   ResponseEntity<List<Reply>> entity = new ResponseEntity<List<Reply>>(list, HttpStatus.OK);
	   return entity;
   }
}