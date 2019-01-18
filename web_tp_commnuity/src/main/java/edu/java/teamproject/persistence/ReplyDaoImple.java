package edu.java.teamproject.persistence;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.java.teamproject.model.Reply;
import edu.java.teamproject.service.ReplyService;

@Repository
public class ReplyDaoImple implements ReplyDao {
   private final Logger logger = LoggerFactory.getLogger(ReplyDaoImple.class);
   private static final String REPLY_MAPPER = "edu.java.mappers.ReplyMapper";
   
   @Autowired private SqlSession session;

   @Override
   public int create(Reply reply) {
      logger.info("create(writer:{}, content: {}) 호출", reply.getWriter(), reply.getContent());
      return session.insert(REPLY_MAPPER + ".insertReply", reply);
   }

   @Override
   public List<Reply> read(int bno) {
      logger.info("reply(read) 호출");
      return session.selectList(REPLY_MAPPER + ".selectReplyByBno", bno);
   }

   @Override
   public int selectBno(int rno) {
      Map<String, Integer> map = new HashMap<String, Integer>();
      map.put("rno", rno);
      return session.selectOne(REPLY_MAPPER + ".selectBno", map);
   }


   @Override
   public int update(Reply reply) {
      
      return 0;
   }

   @Override
   public int delete(int rno) {
      logger.info("reply(delete) 호출");
      return session.delete(REPLY_MAPPER + ".deleteReplyByRno", rno) ;
   }
   


}