package edu.java.teamproject.model;

public class Interest {

	private int ino;
	private String category_code;
	private String user_id;
	
	public Interest() {
		// TODO Auto-generated constructor stub
	}

	public Interest(int ino, String category_code, String user_id) {
		super();
		this.ino = ino;
		this.category_code = category_code;
		this.user_id = user_id;
	}

	public int getIno() {
		return ino;
	}

	public void setIno(int ino) {
		this.ino = ino;
	}

	public String getCategory_code() {
		return category_code;
	}

	public void setCategory_code(String category_code) {
		this.category_code = category_code;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "Interest [ino=" + ino + ", category_code=" + category_code + ", user_id=" + user_id + "]";
	}
	
	
}
