package com.spring.board;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import edu.java.teamproject.model.Board;
import edu.java.teamproject.persistence.BoardDao;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class DaoTest {
	private final Logger logger =
			LoggerFactory.getLogger(DaoTest.class);
	
	@Autowired private BoardDao boardDao;
	
	@Test
	public void doTest() {
		selectAllTest();
	}

	private void selectAllTest() {
		List<Board> list = boardDao.read();
		for (Board b : list) {
			logger.info(b.toString());
		}
	}
}
