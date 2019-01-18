package edu.java.teamproject.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.java.teamproject.model.Board;
import edu.java.teamproject.util.Criteria;

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
	public List<Board> listAll() {
		logger.info("read() 메소드 호출");
			
		return session.selectList(BOARD_MAPPER + ".selectAll");
	}

	@Override
	public Board readByBno(int bno) {
		return session.selectOne(BOARD_MAPPER + ".selectByBno", bno);
	}

	@Override
	public int create(Board board) {
		return session.insert(BOARD_MAPPER + ".insertBoard", board);
	}

	@Override
	public int update(Board board) {
		return session.update(BOARD_MAPPER + ".updateBoard", board);
	}

	@Override
	public int update(int bno, int increment) {
		
		return 0;
	}

	@Override
	public int delete(int bno) {
		return session.delete(BOARD_MAPPER + ".deleteBoard", bno);
	}

	@Override
	public List<Board> searchByKeyword(int type, String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Board> listPaging(int page) {

		if(page <= 0) {
			page = 1;
		}
		
		page = (page - 1) * 10;
		
		return session.selectList(BOARD_MAPPER + ".listPaging", page);
	}

	@Override
	public List<Board> listCriteria(Criteria criteria, String category, String type, String sort) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("criteria", criteria);
		map.put("category", category);
		map.put("type", type);
		map.put("sort", sort);
		
		return session.selectList(BOARD_MAPPER + ".listCriteria", map);
	}

	@Override
	public int countBoards(Criteria criteria, String category, String type) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("criteria", criteria);
		map.put("category", category);
		map.put("type", type);
		
		return session.selectOne(BOARD_MAPPER + ".countBoards", map);
	}
	
	
	// 댓글 추가 성공시 답변수 증가
	@Override
	public int updateReplyCnt(int bno, int increment) {
		logger.info("updateReplyCnt: ({}) 호출" + increment, bno);
		Map<String, Integer> params = new HashMap<String, Integer>();
		params.put("bno", bno);
		params.put("increment", increment);
		return session.update(BOARD_MAPPER + ".updateReplyCnt", params);
	}

	@Override
	public int updateAnswerCnt(int bno, int increment) {
		Map<String, Integer> params = new HashMap<String, Integer>();
		params.put("bno", bno);
		params.put("increment", increment);
		return session.update(BOARD_MAPPER + ".updateAnswerCnt", params);
	}

	@Override
	public List<Board> readByKeyword(Criteria criteria, String type, String sort, String keyword) {
		
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("criteria", criteria);
		map.put("type", type);
		map.put("sort", sort);
		
		if(keyword == null) {
			map.put("searchKeyword", "empty");
		} else {
			map.put("searchKeyword", "%" + keyword + "%");
		}
		
		return session.selectList(BOARD_MAPPER + ".selectByKeyword", map);
	}

}
