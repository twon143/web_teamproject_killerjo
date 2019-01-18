package edu.java.teamproject.service;

import java.util.List;

import edu.java.teamproject.model.Answer;
import edu.java.teamproject.model.Reply;

public interface AnswerServiceDao {
   
   List<Answer> readAllAnswer(int board_num); 
   int insertAnswer(Answer answer);
   int updateAnswer(Answer answer);
   int deleteAnswer(Answer answer);

}