package edu.java.teamproject.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.java.teamproject.model.Board;

@Repository // 영속 계층(Persistence layer) 콤포넌트임을 설정
public class BoardDaoImple implements BoardDao {

	private static final String BOARD_MAPPER =
			"edu.java.mappers.BoardMapper";
	
	private final Logger logger =
			LoggerFactory.getLogger(BoardDaoImple.class);
	
	// DI(Dependency Injection): 의존성 주입
		// spring 컨테이너가 생성한 객체(root-context.xml)를 자동으로 넣어줌
	@Autowired private SqlSession session;
	
	
	@Override
	public List<Board> read() {
		logger.info("read() 메소드 호출");
			
		return session.selectList(BOARD_MAPPER + ".selectAll");
	}

	@Override
	public Board read(int bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int create(Board board) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Board board) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(int bno, int increment) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Board board) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Board> searchByKeyword(int type, String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

}
