package edu.java.teamproject.service;

import java.util.List;

import edu.java.teamproject.model.Board;
import edu.java.teamproject.model.Scrab;

public interface ScrabService {
    
    int insert(Scrab scrab);
    int delete(Scrab scrab);
    int check(Scrab scrab);
    List<Board> myScrabList(String user_id);
 }
