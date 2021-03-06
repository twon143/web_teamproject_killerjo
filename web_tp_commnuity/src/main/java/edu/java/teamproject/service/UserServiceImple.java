package edu.java.teamproject.service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;

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
	public void signUp(User user, String targetUrl) throws MessagingException, UnsupportedEncodingException {
		
		logger.info("signUp({})", user);
		
		String hashedPw = passwordEncoder.encode(user.getPassword());
		
		logger.info("original pw : {}, encoded pw : {}", user.getPassword(), hashedPw);
		
		user.setPassword(hashedPw);
		
		if(userDao.insertUser(user) == 1) {
			String key = new Tempkey().getKey(50, false);
			if(userDao.createAuthKey(user.getId(), key) == 1) {
				MailHandler sendMail = new MailHandler(mailSender);
				sendMail.setSubject("[이메일 인증]");
				sendMail.setText(new StringBuffer().append("<h1>메일인증</h1>")
		                .append("<a href='https://192.168.11.34:8443/teamproject/user/emailConfirm?key=")
		                .append(key + "&user_id=")
		                .append(user.getId() + "&queryString=")
		                .append(URLEncoder.encode(targetUrl, "utf-8"))
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
		
		if(registerdUser != null) {
			logger.info("rawPw : {}, encodedPw : {}", user.getPassword(), registerdUser.getPassword());
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
	public int enableUserLogin(String id) {
		return userDao.enableUserLogin(id);
	}


	@Override
	public int keepLogin(String uid, String sessionId, Date next) {
		return userDao.keepLogin(uid, sessionId, next);
	}


	@Override
	public User checkUserWithSessionKey(String sessionId) {
		return userDao.checkUserWithSessionKey(sessionId);
	}
	
	// 아이디 중복 체크
	@Override
	public int checkId(String id) {
		logger.info("checkId Service :" + id);
		
		return userDao.ckeckId(id);
	}
	
	//닉네임 중복 체크
	@Override
	public int checkNickname(String nickname) {
		// TODO Auto-generated method stub
		return userDao.checkNickname(nickname);
	}

}
