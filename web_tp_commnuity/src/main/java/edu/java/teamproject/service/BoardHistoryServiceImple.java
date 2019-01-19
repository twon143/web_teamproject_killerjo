package edu.java.teamproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.media.jfxmedia.logging.Logger;

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

	@Override
	public int updateAccessTime(long currentTime, String ip, int bno) {
		System.out.println("updateAccessTime: currentTime: " + currentTime);
		return boardHistoryDao.updateAccessTime(currentTime, ip, bno);
	}

}
