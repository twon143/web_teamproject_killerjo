package edu.java.teamproject.persistence;



import edu.java.teamproject.model.BoardHistory;

public interface BoardHistoryDao {

	int insertBoardHistory(BoardHistory boardHistory);
	
	long selectAccessTime(String ip, int bno);
	
	int updateAccessTime(long currentTime, String ip, int bno);
}
