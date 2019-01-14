package com.spring.board;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class PagingTest {

	private final Logger logger = LoggerFactory.getLogger(PagingTest.class);
	
	@Test
	public void doTest() {
		testURI();
	}
	
	public void testURI() {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.path("/{module}/{page}")
				.queryParam("bno", 12)
				.queryParam("perPageNum", 20)
				.build()
				.expand("board", "listPaging")
				.encode();
		
		logger.info("/board/listPaging?bno=12&perPageNum=20");
		logger.info(uriComponents.toString());
	}
	
}
