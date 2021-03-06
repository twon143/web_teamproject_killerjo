package edu.java.teamproject.service;

import java.util.List;

import edu.java.teamproject.model.Board;
import edu.java.teamproject.util.Criteria;

public interface BoardService {
	
	Board readByBno(int bno);
	int update(Board board);
	int delete(int bno);
	int registerPost(Board board);
	List<Board> listCriteria(Criteria criteria, String category, String type, String sort);

	List<Board> searchByKeyword(Criteria criteria, String type, String sort, String keyword);
	int updateReadCnt(int bno, int increment);
	
	int updateReplyCnt(int bno, int increment);
	
	int countBoards(Criteria criteria, String category, String type);
	int countBoardsByKeyword(Criteria criteria, String type, String keyword);
	
	// 글상세보기로 이동하기위해 글쓴 정보가지고 bno를 얻어옴
	int getBno(String title, String content, String writer, String category, String type);
	
}
