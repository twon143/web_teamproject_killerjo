package edu.java.teamproject.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.java.teamproject.model.Scrab;
import edu.java.teamproject.persistence.ScrabDao;

@Service
public class ScrabServiceImple implements ScrabService {
   Logger logger = LoggerFactory.getLogger(ScrabServiceImple.class); 

   @Autowired ScrabDao scrabDao;
   
   @Override
   public int insert(Scrab scrab) {
      logger.info("2222 insertScrabService(user_id: {}, board_num : {} )",scrab.getUser_id(), scrab.getBoard_num());
      
      int result = scrabDao.insert(scrab);
      return result;
   }
   
   @Override
   public int delete(Scrab scrab) {
      logger.info("ScrabServiceImple  delete 호출()");
      int result = scrabDao.delete(scrab);
      return result;
   }
   
   // 스크랩 넣기 and 중복검사
   @Override
   public int check(Scrab scrab) {
      logger.info("ScrabServiceImple  check 호출()" + scrab);
      int result = scrabDao.check(scrab); 
      logger.info("ScrabServiceImple Result : " + result); 
      int a;
      if(result == 1) {
         a = 0; 
      }else {
         a = scrabDao.insert(scrab);
      }
      return a;
   }

}
