package edu.java.teamproject.service;

import java.util.List;

import edu.java.teamproject.model.BoardHistory;

public interface BoardHistoryService {
	
	int insertBoardHistory(BoardHistory boardHistory);
	
	long selectAccessTime(String ip, int bno);
	
	int updateAccessTime(long currentTime, String ip, int bno);

}
