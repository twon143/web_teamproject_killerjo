package edu.java.teamproject.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.java.teamproject.model.Board;
import edu.java.teamproject.model.User;

@Repository
public class ProfileDaoImple implements ProfileDao{

	private static final String PROFILE_MAPPER =
	         "edu.java.mappers.profileMapper";
	   
	
	@Autowired
	SqlSession session;
	
	@Override
	public List<Board> readByWriter(String writer) {
		
		
		return session.selectList(PROFILE_MAPPER + ".readByWriter", writer);
	}

	@Override
	public User getUserInfo(String id) {
		
		return session.selectOne(PROFILE_MAPPER + ".selectById", id);
	}


}
