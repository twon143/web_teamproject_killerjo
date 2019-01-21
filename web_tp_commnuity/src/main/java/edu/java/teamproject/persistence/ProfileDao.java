package edu.java.teamproject.persistence;

import java.util.List;

import edu.java.teamproject.model.Board;

public interface ProfileDao {

	List<Board> readByWriter(String writer);
	
	
}
