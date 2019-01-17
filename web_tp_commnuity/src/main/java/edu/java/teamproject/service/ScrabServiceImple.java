package edu.java.teamproject.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.java.teamproject.model.Scrab;
import edu.java.teamproject.persistence.ScrabDao;

@Service
public class ScrabServiceImple implements ScrabService {
	Logger logger = LoggerFactory.getLogger(ScrabServiceImple.class); 

	@Autowired ScrabDao scrabDao;
	
	@Override
	public int insert(Scrab scrab) {
		logger.info("ScrabServiceImple  insert 호출()");
		
		int result = scrabDao.insert(scrab);
		return result;
	}
	
	@Override
	public int delete(int bno) {
		logger.info("ScrabServiceImple  delete 호출()");
		int result = scrabDao.delete(bno);
		return result;
	}

}
