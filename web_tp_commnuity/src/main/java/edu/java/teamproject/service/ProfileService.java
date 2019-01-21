package edu.java.teamproject.service;

import java.util.List;

import edu.java.teamproject.model.Board;

public interface ProfileService {

	List<Board> readByWriter(String writer);

}
