package com.spring.board;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import edu.java.teamproject.model.Board;
import edu.java.teamproject.persistence.BoardDao;
import edu.java.teamproject.util.Criteria;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class DaoTest {
	private final Logger logger =
			LoggerFactory.getLogger(DaoTest.class);
	
	@Autowired private BoardDao boardDao;
	
	@Test
	public void doTest() {
//		selectAllTest();
//		testListPaging();
		testListCriteria();
	}

	private void selectAllTest() {
		List<Board> list = boardDao.listAll();
		for (Board b : list) {
			logger.info(b.toString());
		}
	}
	
	public void testListPaging() {
		int page = 3;
		
		List<Board> boards = boardDao.listPaging(3);
		
		for (Board board : boards) {
			logger.info(board.getBno() + " : " + board.getTitle());
		}
	}
	
	public void testListCriteria() {
		Criteria criteria = new Criteria();
		criteria.setPage(3);
		criteria.setPerPageNum(20);
		
		List<Board> boards = boardDao.listCriteria(criteria);
		
		for (Board board : boards) {
			logger.info(board.getBno() + " : " + board.getTitle());
		}
	}
}
