package edu.java.teamproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.java.teamproject.model.Board;
import edu.java.teamproject.persistence.BoardDao;
import edu.java.teamproject.persistence.ProfileDao;

@Service
public class ProfileServiceImple implements ProfileService {

	@Autowired private ProfileDao profileDao;
	
	
	@Override
	public List<Board> readByWriter(String writer) {
		
		return profileDao.readByWriter(writer);
	}


}
