package edu.java.teamproject.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import edu.java.teamproject.model.Answer;
import edu.java.teamproject.persistence.AnswerDao;
import edu.java.teamproject.persistence.BoardDao;

@Service
public class AnswerServiceDaoImple implements AnswerServiceDao {
   
   @Autowired AnswerDao answerDao;
   @Autowired BoardDao boardDao;
   private final Logger logger = LoggerFactory.getLogger(AnswerServiceDaoImple.class);
   
   @Override
   public List<Answer> readAllAnswer(int board_num) {
      // TODO Auto-generated method stub
      return null;
   }

   @Override
   public int insertAnswer(Answer answer) {
      logger.info("[service]insertAnswer({}) 호출", answer);
      return answerDao.insertAnswer(answer);
   }

   @Override
   public int updateAnswer(Answer answer) {
      // TODO Auto-generated method stub
      return 0;
   }

   @Override
   public int deleteAnswer(Answer answer) {
      // TODO Auto-generated method stub
      return 0;
   }

}