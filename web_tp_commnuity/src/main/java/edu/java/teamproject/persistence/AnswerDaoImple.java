package edu.java.teamproject.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.java.teamproject.model.Answer;

@Repository
public class AnswerDaoImple implements AnswerDao {
   private final Logger logger = LoggerFactory.getLogger(AnswerDaoImple.class);
   private static final String ANSWER_MAPPER = "edu.java.mappers.AnswerMapper";
   
   @Autowired private SqlSession session;
   
   @Override
   public List<Answer> readAllAnswer(int board_num) {
      logger.info("[Persistence]readAllAnswer({}) 호출", board_num);
      
      return session.selectList(ANSWER_MAPPER + ".selectAllAnswerByBoard_num", board_num);
   }

   @Override
   public int insertAnswer(Answer answer) {
      logger.info("[Persistence] insert(answer: {}) 호출", answer);
      
      return session.insert(ANSWER_MAPPER + ".insertAnswer", answer);
   }

}