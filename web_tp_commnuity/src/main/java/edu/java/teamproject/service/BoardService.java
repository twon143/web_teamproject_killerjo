package edu.java.teamproject.service;

import java.util.List;

import edu.java.teamproject.model.Board;
import edu.java.teamproject.util.Criteria;

public interface BoardService {
	List<Board> listCriteria(Criteria criteria);
	
	int countBoards(Criteria criteria);
}
