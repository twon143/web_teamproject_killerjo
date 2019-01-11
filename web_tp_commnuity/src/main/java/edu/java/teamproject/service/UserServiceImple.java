package edu.java.teamproject.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import edu.java.teamproject.model.User;
import edu.java.teamproject.persistence.UserDao;
import edu.java.teamproject.util.MailHandler;
import edu.java.teamproject.util.Tempkey;

@Service
public class UserServiceImple implements UserService {

	private final Logger logger = LoggerFactory.getLogger(UserServiceImple.class);
	
	@Autowired BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private UserDao userDao;
	
	@Override
	public void signUp(User user) throws MessagingException, UnsupportedEncodingException {
		
		logger.info("signUp({})", user);
		
		if(userDao.insertUser(user) == 1) {
			String key = new Tempkey().getKey(50, false);
			if(userDao.createAuthKey(user.getEmail(), key) == 1) {
				MailHandler sendMail = new MailHandler(mailSender);
				sendMail.setSubject("[이메일 인증]");
				sendMail.setText(new StringBuffer().append("<h1>메일인증</h1>")
		                .append("<a href='https://localhost:8443/teamproject/user/emailConfirm?key=")
		                .append(key + "&user_email=")
		                .append(user.getEmail())
		                .append("' target='_blenk'>이메일 인증 확인</a>")
		                .toString());
				sendMail.setFrom("twon143@gmail.com", "엄태원");
				sendMail.setTo(user.getEmail());
				sendMail.send();
			}
		}

	}

	
	@Override
	public User signIn(User user) {
		
		logger.info("signIn({})", user);
		
		User registerdUser = userDao.loginCheck(user);
		
		logger.info("rawPw : {}, encodedPw : {}", user.getPassword(), registerdUser.getPassword());
		
		if(registerdUser != null) {
			if(passwordEncoder.matches(user.getPassword(), registerdUser.getPassword())) {
				logger.info("로그인 성공");
				return registerdUser;
			}else {
				logger.info("로그인 실패");
			}
		}
		
		return null;
		
	}

	@Override
	public int enableUserLogin(String email) {
		return userDao.enableUserLogin(email);
	}

}
