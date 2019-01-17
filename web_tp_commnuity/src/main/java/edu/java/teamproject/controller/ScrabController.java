package edu.java.teamproject.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import edu.java.teamproject.model.Scrab;
import edu.java.teamproject.service.ScrabService;

@RestController
@RequestMapping(value = "scrab")
public class ScrabController {
	private final Logger logger = LoggerFactory.getLogger(ScrabController.class);
	
	@Autowired private ScrabService scrabService;

	//스크랩 등록
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Integer> insertScrab(@RequestBody Scrab scrab){
		
		logger.info("insertScrab({}) 호출", scrab);
		int insertResult = scrabService.insert(scrab);
		logger.info("result : " + insertResult);
		
	ResponseEntity<Integer> entity = null;
	if(insertResult == 1) {
		entity = new ResponseEntity<Integer>(insertResult, HttpStatus.OK);
	}else {
		entity = new ResponseEntity<Integer>(insertResult, HttpStatus.BAD_REQUEST);
	}
	return entity;
	}//end insertScrab

}// end ScrabController
