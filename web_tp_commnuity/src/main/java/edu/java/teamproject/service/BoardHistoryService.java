package edu.java.teamproject.service;

import java.util.List;

import edu.java.teamproject.model.BoardHistory;

public interface BoardHistoryService {
	
	int insertBoardHistory(BoardHistory boardHistory);
	
	long selectAccessTime(String ip, int bno);

}
