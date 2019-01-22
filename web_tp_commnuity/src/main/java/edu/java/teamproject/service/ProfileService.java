package edu.java.teamproject.service;

import java.util.List;

import edu.java.teamproject.model.Board;
import edu.java.teamproject.model.User;

public interface ProfileService {

	List<Board> readByWriter(String writer);
	User getUserInfo(String id);
	int updateUserInfo(User user);
	
}
