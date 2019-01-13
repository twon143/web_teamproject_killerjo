package edu.java.teamproject.persistence;

import java.util.Date;
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
	public int createAuthKey(String id, String key) {
		logger.info("createAuthKey(id = {}, key = {})", id, key);
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("auth_code", key);
		params.put("id", id);
		
		return session.update(USER_MAPPER + ".createAuthKey", params);
	}

	@Override
	public int enableUserLogin(String id) {
		return session.update(USER_MAPPER + ".enableUserLogin", id);
	}

	@Override
	public boolean isUseCookie(String id) {
		logger.info("isUseCookie({}) 호출", id);
		return (Integer)session.selectOne(USER_MAPPER + ".isUseCookie", id) == 1 ? true : false;
	}

	// 로그인 유지 처리
	@Override
	public int keepLogin(String uid, String sessionId, Date next) {
		
		logger.info("keepLogin(uid : {}, sessionId : {}, next : {})", uid, sessionId, next);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", uid);
		map.put("sessionId", sessionId);
		map.put("next", next);
		
		// Mapper.xml로 데이터를 전달할 때 한 객체밖에 전달 못함으로 map으로 묶어서 보내줌 단... 주의할 점은
        // Mapper.xml 안에서 #{} 이 안에 지정한 이름이랑 같아야함.. 자동으로 매핑될 수 있도록
        // 아래가 수행되면서, 사용자 테이블에 세션id와 유효시간이 저장됨
		return session.update(USER_MAPPER + ".keepLogin", map);
		
	}

	// 세션키 검증
	@Override
	public User checkUserWithSessionKey(String sessionId) {
		
		logger.info("checkUserWithSessionKey(sessionId : {})", sessionId);
		
		return session.selectOne(USER_MAPPER + ".checkUserWithSessionKey", sessionId);
	}

	@Override
	public int changeUseCookieStatus(String uid, int flag) {
		logger.info("changeUseCookieStatus(uid : {}, flag : {})", uid, flag);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("flag", flag);
		map.put("id", uid);
		
		return session.update(USER_MAPPER + ".changeUseCookieStatus", map);
	}

}
