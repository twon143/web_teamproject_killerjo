package edu.java.teamproject.persistence;

import edu.java.teamproject.model.User;

public interface UserDao {
	
	int insertUser(User user);
	User loginCheck(User user);
	int createAuthKey(String email, String key);
	int enableUserLogin(String email);
	
}
