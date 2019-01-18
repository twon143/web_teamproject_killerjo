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
import edu.java.teamproject.model.BoardHistory;
import edu.java.teamproject.model.Reply;
import edu.java.teamproject.persistence.BoardDao;
import edu.java.teamproject.persistence.ReplyDao;
import edu.java.teamproject.service.BoardHistoryService;
import edu.java.teamproject.service.ReplyService;
import edu.java.teamproject.util.Criteria;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class DaoTest {
	private final Logger logger =
			LoggerFactory.getLogger(DaoTest.class);
	
	@Autowired private BoardDao boardDao;
	@Autowired private ReplyDao replyDao;
	@Autowired private ReplyService replyService;
	@Autowired private BoardHistoryService boardHistoryService;
	@Test
	public void doTest() {
//		selectAllTest();
//		testListPaging();
//		testListCriteria();
//		testCreate();
//		testReplyList();
		testInsert();
	}
	
	private void testInsert() {
		
		int result = boardDao.updateReadCnt(994, 1);
		
		
		
		logger.info("result: " + result);
	}
	private void testReplyList() {
		// TODO Auto-generated method stub
		List<Reply> replyList = replyService.select(200);
		
		for(Reply r : replyList) {
			logger.info("read() 결과 {}", r);
		}
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
		
		List<Board> boards = boardDao.listCriteria(criteria, "jsp", "all", "newest");
		
		for (Board board : boards) {
			logger.info(board.getBno() + " : " + board.getTitle());
		}
	}
	
	public void testCreate() {
		
		String[] categories = new String[] {"php", "javascript", "java", "spring", "nodejs", "swift", "kotlin"};
		String[] ids = new String[] {"twon143", "ku8230", "kjw9401", "wodadada", "cjh2293"};
		String[] types = new String[] {"question", "writing", "link"};
		
		for(int i = 1; i < 1001; i++) {
			Board board = new Board();
			board.setTitle(i + "번째 " + categories[i%categories.length] + "관한 글 제목");
			board.setContent(i + "번째 " + categories[i%categories.length] + "관한 글 내용");
			board.setWriter(ids[i%ids.length]);
			board.setCategory(categories[i%categories.length]);
			board.setType(types[i%types.length]);
			
			boardDao.create(board);
			
		}
	}
}
