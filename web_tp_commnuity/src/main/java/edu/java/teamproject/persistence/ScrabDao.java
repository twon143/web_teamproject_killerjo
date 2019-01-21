package edu.java.teamproject.persistence;

import java.util.List;

import edu.java.teamproject.model.Board;
import edu.java.teamproject.model.Scrab;

public interface ScrabDao {
    int insert(Scrab scrab);
    int delete(Scrab scrab);
    int check(Scrab scrab);
    List<Board> myScrabList(String user_id);
 }