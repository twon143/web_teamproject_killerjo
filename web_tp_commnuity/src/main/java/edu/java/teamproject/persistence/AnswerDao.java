package edu.java.teamproject.persistence;

import java.util.List;

import edu.java.teamproject.model.Answer;

public interface AnswerDao {

   List<Answer> readAllAnswer();
   
   int insertAnswer(Answer answer); 
}