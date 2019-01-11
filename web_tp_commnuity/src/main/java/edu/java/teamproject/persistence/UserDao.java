package edu.java.teamproject.persistence;

import java.util.Date;

import edu.java.teamproject.model.User;

public interface UserDao {
	
	int insertUser(User user);
	User loginCheck(User user);
	int createAuthKey(String email, String key);
	int enableUserLogin(String email);
	boolean isUseCookie(String id);
	
	// 자동로그인 체크한 경우에 사용자 테이블에 세션과 유효시간을 저장하기 위한 메서드
	int keepLogin(String uid, String sessionId, Date next);

	// 이전에 로그인한 적이 있는지, 즉 유효시간이 넘지 않은 세션을 가지고 있는지 체크한다.
	User checkUserWithSessionKey(String sessionId);

	
}
