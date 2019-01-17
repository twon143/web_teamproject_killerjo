package edu.java.teamproject.controller;

import java.util.List;

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

import edu.java.teamproject.model.Reply;
import edu.java.teamproject.persistence.ReplyDao;
import edu.java.teamproject.service.ReplyService;

@RestController
@RequestMapping(value = "reply")
public class ReplyRestController {
   private final Logger logger = LoggerFactory.getLogger(ReplyRestController.class);
   
   @Autowired private ReplyService replyService;
   @Autowired private ReplyDao replyDao;
   
   // 댓글 리스트 부르기
   @RequestMapping(value = "all/{bno}", method=RequestMethod.GET)
   public ResponseEntity<List<Reply>> readAllReplyByBno(@PathVariable(name="bno") int bno) {
         logger.info("readReplies(bno={}) 호출", bno);
         logger.info("22");
         List<Reply> list = replyService.select(bno);
         logger.info("값" + list.toString());
         ResponseEntity<List<Reply>> entity = new ResponseEntity<List<Reply>>(list, HttpStatus.OK);
         
         return entity;
      
   }
   // 댓글 등록
   @RequestMapping(method=RequestMethod.POST)
   public ResponseEntity<Integer> writeReply(@RequestBody Reply reply) {
      
      logger.info("writeReply({}) 호출", reply);
      
      int writeResult = replyService.insert(reply);
      logger.info("result 결괴: " + writeResult);
      
      ResponseEntity<Integer> entity = null;
      
      if(writeResult == 1) {
         entity = new ResponseEntity<Integer>(writeResult, HttpStatus.OK);
      }
      else {
         entity = new ResponseEntity<Integer>(writeResult, HttpStatus.BAD_REQUEST);
      }
      
      return entity;
   }
   
   @RequestMapping(value = "/{rno}", method = RequestMethod.DELETE)
   public ResponseEntity<Integer> deleteReply(@PathVariable(name="rno") int rno) {
      
      logger.info("deleteReply({}) 호출", rno);
      
      int deleteResult = replyService.delete(rno);
      
      ResponseEntity<Integer> entity = null;
      
      if(deleteResult == 1) {
         entity = new ResponseEntity<Integer>(deleteResult, HttpStatus.OK);
      }
      
      else {
         entity = new ResponseEntity<Integer>(deleteResult, HttpStatus.BAD_REQUEST);
      }
      
      return entity;
   }
}