package edu.java.teamproject.persistence;

import java.util.List;

import edu.java.teamproject.model.Reply;



public interface ReplyDao {
   int create(Reply reply);
   List<Reply> read(int bno, String type);
   int update(Reply reply);
   int delete(int rno);
   int selectBno(int rno);
   int insertAnswerReply(Reply reply);
   List<Reply> readAllAnswerReply(int ano, String type);

}