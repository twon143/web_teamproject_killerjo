package edu.java.teamproject.persistence;

import java.util.List;

import edu.java.teamproject.model.Board;
import edu.java.teamproject.model.User;

public interface ProfileDao {

	List<Board> readByWriter(String writer);
	User getUserInfo(String user);
	
}
