package edu.java.teamproject.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@RequestMapping(value = "all/{bno}", method=RequestMethod.GET)
	public ResponseEntity<List<Reply>> readAllReplyByBno(@PathVariable(name="bno") int bno) {
			logger.info("readReplies(bno={}) 호출", bno);
			logger.info("22");
			List<Reply> list = replyService.select(bno);
			logger.info("값" + list.toString());
			ResponseEntity<List<Reply>> entity = new ResponseEntity<List<Reply>>(list, HttpStatus.OK);
			
			return entity;
		
	}
}
