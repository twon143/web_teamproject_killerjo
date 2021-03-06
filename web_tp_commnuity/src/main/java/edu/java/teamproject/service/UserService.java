package edu.java.teamproject.service;

import java.io.UnsupportedEncodingException;
import java.util.Date;

import javax.mail.MessagingException;

import edu.java.teamproject.model.User;

public interface UserService {

	void signUp(User user, String targetUrl) throws MessagingException, UnsupportedEncodingException;
	User signIn(User user);
	int enableUserLogin(String id);
	int keepLogin(String uid, String sessionId, Date next);
	User checkUserWithSessionKey(String sessionId);
	int checkId(String id);
	int checkNickname(String nickname);
	
}
