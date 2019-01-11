package edu.java.teamproject.model;

public class Scrab {

	private int sno;
	private int board_num;
	private String user_id;
	
	public Scrab() {
		// TODO Auto-generated constructor stub
	}

	public Scrab(int sno, int board_num, String user_id) {
		super();
		this.sno = sno;
		this.board_num = board_num;
		this.user_id = user_id;
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "Scrab [sno=" + sno + ", board_num=" + board_num + ", user_id=" + user_id + "]";
	}
	
	
}
