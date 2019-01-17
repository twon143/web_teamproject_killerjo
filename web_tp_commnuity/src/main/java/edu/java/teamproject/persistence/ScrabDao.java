package edu.java.teamproject.persistence;

import edu.java.teamproject.model.Scrab;

public interface ScrabDao {
	int insert(Scrab scrab);
	int delete(int bno);
}
