package edu.java.teamproject.persistence;

import java.util.List;

import edu.java.teamproject.model.Board;
import edu.java.teamproject.util.Criteria;

public interface BoardDao {
	List<Board> listAll();
	Board readByBno(int bno);
	int create(Board board);
	int update(Board board);
	int update(int bno, int increment);
	int delete(int bno);
	List<Board> searchByKeyword(int type, String keyword);
	int updateReplyCnt(int bno, int increment);
	int updateAnswerCnt(int bno, int increment);
	// 페이징 처리와 관련된 메서드
	List<Board> listPaging(int page);
	List<Board> listCriteria(Criteria criteria, String category, String type, String sort);
	
	int countBoards(Criteria criteria, String category, String type);
	
	
}
