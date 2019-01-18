package edu.java.teamproject.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.java.teamproject.model.Board;
import edu.java.teamproject.persistence.BoardDao;
import edu.java.teamproject.util.Criteria;

@Service
public class BoardServiceImple implements BoardService {

	private final Logger logger = LoggerFactory.getLogger(BoardServiceImple.class);
	
	@Autowired private BoardDao boardDao;
	
	@Override
	public Board readByBno(int bno) {
		return boardDao.readByBno(bno);
	}
	
	@Override
	public int update(Board board) {
		return boardDao.update(board);
	}
	
	
	@Override
	public List<Board> listCriteria(Criteria criteria, String category, String type, String sort) {
		logger.info("listCriteria() 호출");
		return boardDao.listCriteria(criteria, category, type, sort);
	}

	@Override
	public int countBoards(Criteria criteria, String category, String type) {
		return boardDao.countBoards(criteria, category, type);
	}

	@Override
	public int delete(int bno) {
		return boardDao.delete(bno);
	}

	@Override
	public List<Board> searchByKeyword(Criteria criteria, String type, String sort, String keyword) {
		return boardDao.readByKeyword(criteria, type, sort, keyword);
	}

	@Override
	public int updateReplyCnt(int bno, int increment) {
		logger.info("updateReplyCnt 호출({})", bno);
		return boardDao.update(bno, increment);
	}

	@Override
	public int countBoardsByKeyword(Criteria criteria, String type, String keyword) {
		return boardDao.countBoardsByKeyword(criteria, type, keyword);
	}
	
	@Override
	public int updateReadCnt(int bno, int increment) {
		return boardDao.updateReadCnt(bno, increment);
	}





}
