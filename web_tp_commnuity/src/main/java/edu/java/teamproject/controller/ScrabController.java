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
      
      logger.info("1111 insertScrab({}) 호출", scrab);
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
   
   
   // 스크랩 버튼을 눌렀을 때 db에 있는지 검사
   //스크랩 중복 검사
   @RequestMapping(value = "checkScrab", method = RequestMethod.POST)
   public ResponseEntity<Integer> checkScrab(@RequestBody Scrab scrab){
      logger.info("checkScrab 호출");
      int checkResult = scrabService.check(scrab);
      logger.info("checkScrab 호출" + scrab);
      logger.info("checkResult : " + checkResult);
      ResponseEntity<Integer> entity = null;
      if(checkResult == 1) {
         entity = new ResponseEntity<Integer>(checkResult, HttpStatus.OK);
      }else {
         entity = new ResponseEntity<Integer>(checkResult, HttpStatus.BAD_REQUEST);
      }
      return entity;   
   }// end checkScrab
   
   // 스크랩 삭제
   @RequestMapping(value = "deleteScrab", method = RequestMethod.POST)
   public ResponseEntity<Integer> deleteScrab(@RequestBody Scrab scrab){
      logger.info("deleteScrab controller 호출 ");
      int deleteResult = scrabService.delete(scrab);
      logger.info("deleteScrab 호출 : " + scrab);
      logger.info("deleteResult : " + deleteResult);
      ResponseEntity<Integer> entity = null;
      if(deleteResult == 1) {
         entity = new ResponseEntity<Integer>(deleteResult, HttpStatus.OK);
      }else {
         entity = new ResponseEntity<Integer>(deleteResult, HttpStatus.BAD_REQUEST);
      }
      return entity;   
   }// end deleteScrab
   
   

}// end ScrabController
