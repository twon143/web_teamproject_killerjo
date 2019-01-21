package edu.java.teamproject.persistence;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.java.teamproject.model.Scrab;
import edu.java.teamproject.service.ScrabServiceImple;

@Repository // 영속 계층(Persistence layer) 콤포넌트임을 설정
public class ScrabDaoImple implements ScrabDao {
   private static final String SCRAB_MAPPER =
         "edu.java.mappers.ScrabMapper";
   
   Logger logger = LoggerFactory.getLogger(ScrabServiceImple.class); 
   // DI(Dependency Injection): 의존성 주입
         // spring 컨테이너가 생성한 객체(root-context.xml)를 자동으로 넣어줌
   @Autowired private SqlSession session;

   // 스크랩 insert
   @Override
   public int insert(Scrab scrab) {
      logger.info("3333 insertScrabDao(user_id: {}, board_num : {} )",scrab.getUser_id(), scrab.getBoard_num());
      return session.insert(SCRAB_MAPPER + ".insertScrab", scrab);
      // 세션 쿼리문, jsp 등등 
   }
   
   // 스크랩 delete
   @Override
   public int delete(Scrab scrab) {
      logger.info("deleteScrab() 호출" );
      return session.delete(SCRAB_MAPPER + ".deleteScrab", scrab);
   }
   
   @Override
   public int check(Scrab scrab) {
      logger.info("checkScrabDao () 호출" + scrab);
      return session.selectOne(SCRAB_MAPPER + ".checkScrab", scrab);
      
   }

}
