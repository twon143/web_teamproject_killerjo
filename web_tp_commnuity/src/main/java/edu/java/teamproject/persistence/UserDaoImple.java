package edu.java.teamproject.persistence;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.java.teamproject.model.User;

@Repository
public class UserDaoImple implements UserDao {

	private static final String USER_MAPPER =
			"edu.java.mappers.UserMapper";
	
	private final Logger logger = LoggerFactory.getLogger(UserDaoImple.class);
	
	@Autowired
	private SqlSession session;
	
	
	@Override
	public int insertUser(User user) {
		logger.info("insert({})", user);
		return session.insert(USER_MAPPER + ".insertUser", user);
	}

	@Override
	public User loginCheck(User user) {
		logger.info("loginCheck({})", user);
		
		return session.selectOne(USER_MAPPER + ".loginCheck", user);
	}

	@Override
	public int createAuthKey(String email, String key) {
		logger.info("createAuthKey(email = {}, key = {})", email, key);
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("auth_code", key);
		params.put("email", email);
		
		return session.update(USER_MAPPER + ".createAuthKey", params);
	}

	@Override
	public int enableUserLogin(String email) {
		return session.update(USER_MAPPER + ".enableUserLogin", email);
	}

}
