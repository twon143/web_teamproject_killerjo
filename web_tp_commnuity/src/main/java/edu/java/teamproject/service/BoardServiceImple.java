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
	public List<Board> listCriteria(Criteria criteria, String category, String type) {
		logger.info("listCriteria() 호출");
		return boardDao.listCriteria(criteria, category, type);
	}

	@Override
	public int countBoards(Criteria criteria, String category, String type) {
		return boardDao.countBoards(criteria, category, type);
	}

	@Override
	public int delete(int bno) {
		return boardDao.delete(bno);
	}





}