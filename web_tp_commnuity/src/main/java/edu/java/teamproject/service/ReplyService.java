package edu.java.teamproject.service;

import java.util.List;

import edu.java.teamproject.model.Reply;



public interface ReplyService {

   int insert(Reply reply);
   List<Reply> select(int bno, String type);
   int update(Reply reply);
   int delete(int rno);
   int insertAnswerReply(Reply reply);
   List<Reply> readAllAnswerReply(int ano, String type);
}