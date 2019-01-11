package com.spring.board;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class MyBatisTest {
	
	private final Logger logger =
			LoggerFactory.getLogger(MyBatisTest.class);
	
	@Inject
    private SqlSession session;
    
    /*@Test
    public void testFactory() {
        System.out.println(session);
    }*/
    @Test
    public void testSession() {
    	logger.info("sqlSession : " + session);
    }


}
