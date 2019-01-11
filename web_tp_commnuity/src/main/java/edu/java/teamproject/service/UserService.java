package edu.java.teamproject.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import edu.java.teamproject.model.User;

public interface UserService {

	void signUp(User user) throws MessagingException, UnsupportedEncodingException;
	User signIn(User user);
	int enableUserLogin(String email);
	
}
