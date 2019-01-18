package edu.java.teamproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.java.teamproject.model.BoardHistory;
import edu.java.teamproject.persistence.BoardHistoryDao;

@Service
public class BoardHistoryServiceImple implements BoardHistoryService {
	
	@Autowired BoardHistoryDao boardHistoryDao;
	
	@Override
	public int insertBoardHistory(BoardHistory boardHistory) {
		// TODO Auto-generated method stub
		return boardHistoryDao.insertBoardHistory(boardHistory);
	}

	@Override
	public long selectAccessTime(String ip, int bno) {
		// TODO Auto-generated method stub
		return boardHistoryDao.selectAccessTime(ip, bno);
	}

}
