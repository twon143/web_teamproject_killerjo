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
      
      if(result == 1) {
    	  logger.info("updateReplyCnt: ({}),  호출", reply.getParent_num());
    	  boardDao.updateReplyCnt(reply.getParent_num(), 1);
      }

		return result;
	}

	@Override
	public List<Reply> select(int bno, String type) {
		logger.info("select(bno={}) 호출", bno);

		return replyDao.read(bno, type);
	}

	@Override
	public int update(Reply reply) {
		// TODO Auto-generated method stub
		return replyDao.update(reply);
	}

	@Override
	public int delete(int rno) {
		int bno = replyDao.selectBno(rno);

		int result = replyDao.delete(rno);

		if (result == 1) {
			boardDao.updateReplyCnt(bno, -1);
		}
		return result;
	}

	@Override
	public int insertAnswerReply(Reply reply) {
		logger.info("[Service]insertAnswerReply 호출");
		return replyDao.insertAnswerReply(reply);
	}

	@Override
	public List<Reply> readAllAnswerReply(int ano, String type) {
		logger.info("readAllAnswerReply({})", ano);
		return replyDao.readAllAnswerReply(ano, type);
	}

}