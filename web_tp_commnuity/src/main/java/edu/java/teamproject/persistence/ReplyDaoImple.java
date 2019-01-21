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
   public List<Reply> read(int bno, String type) {
      logger.info("reply(read) 호출");
      Map<String, Object> params = new HashMap<String, Object>();
      params.put("bno", bno);
      params.put("type", type);
      return session.selectList(REPLY_MAPPER + ".selectReplyByBno", params);
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
		return session.delete(REPLY_MAPPER + ".deleteReplyByRno", rno);
	}

	@Override
	public int insertAnswerReply(Reply reply) {
		logger.info("[Persistence]insertAnswerReply 호출");
		return session.insert(REPLY_MAPPER + ".insertAnswerReply", reply);
	}

	@Override
	public List<Reply> readAllAnswerReply(int ano, String type) {
		logger.info("readAllAnswerReply({}) 호출", ano);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("ano", ano);
		params.put("type", type);
		return session.selectList(REPLY_MAPPER + ".readAllAnswerReply", params);
	}

}