package edu.java.teamproject.persistence;

import java.util.List;

import edu.java.teamproject.model.Board;

public interface BoardDao {
	List<Board> read();
	Board read(int bno);
	int create(Board board);
	int update(Board board);
	int update(int bno, int increment);
	int delete(Board board);
	List<Board> searchByKeyword(int type, String keyword);
	
	
}
