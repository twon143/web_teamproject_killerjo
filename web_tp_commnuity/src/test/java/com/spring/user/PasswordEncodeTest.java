package com.spring.user;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import edu.java.teamproject.model.User;
import edu.java.teamproject.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class PasswordEncodeTest {
	
	private final Logger logger = LoggerFactory.getLogger(PasswordEncodeTest.class);
	
	@Autowired UserService userService;
	
	@Test
	public void doTest() {
		loginTest();
	}
	
	public void loginTest() {
		logger.info("loginTest() 호출");
		
		User user = new User("twon123", "xodnjs2973");
		User loginResult = userService.signIn(user);
		
		logger.info("loginResult : {}", loginResult);
	}

}
