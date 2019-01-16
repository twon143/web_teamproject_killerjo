package edu.java.teamproject.service;

import java.util.List;

import edu.java.teamproject.model.Board;
import edu.java.teamproject.util.Criteria;

public interface BoardService {
	
	Board readByBno(int bno);
	int update(Board board);
	int delete(int bno);
	
	List<Board> listCriteria(Criteria criteria, String category, String type, String sort);
	
	int countBoards(Criteria criteria, String category, String type);
	
	
}
