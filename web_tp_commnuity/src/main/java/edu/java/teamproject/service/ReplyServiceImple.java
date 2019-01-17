package edu.java.teamproject.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.java.teamproject.model.Reply;
import edu.java.teamproject.persistence.BoardDao;
import edu.java.teamproject.persistence.ReplyDao;

@Service
public class ReplyServiceImple implements ReplyService {
   
   @Autowired ReplyDao replyDao;
   @Autowired BoardDao boardDao;
   
   private Logger logger = LoggerFactory.getLogger(ReplyServiceImple.class);

   @Override
   public int insert(Reply reply) {
      logger.info("insert({}) 호출", reply.toString());
      
      int result = replyDao.create(reply);
      
      return result;
   }

   @Override
   public List<Reply> select(int bno) {
      logger.info("select(bno={}) 호출", bno);
      
      return replyDao.read(bno);
   }

   @Override
   public int update(Reply reply) {
      // TODO Auto-generated method stub
      return replyDao.update(reply);
   }

   @Override
   public int delete(int rno) {
      // TODO Auto-generated method stub
      return replyDao.delete(rno);
   }

}