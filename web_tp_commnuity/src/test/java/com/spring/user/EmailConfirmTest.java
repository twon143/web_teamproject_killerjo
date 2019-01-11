package com.spring.user;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import edu.java.teamproject.model.User;
import edu.java.teamproject.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class EmailConfirmTest {
	private final Logger logger = LoggerFactory.getLogger(EmailConfirmTest.class);
	
	@Autowired private UserService userService;
	
	@Test
	public void doTest() {
		signUp(new User("guest2", "123", "twon143@naver.com", null, "게스트2", null, 0, null, null, 0));
	}
	
	private void signUp(User user) {
		try {
			userService.signUp(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
