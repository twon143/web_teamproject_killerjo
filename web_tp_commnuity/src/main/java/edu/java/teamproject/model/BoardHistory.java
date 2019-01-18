package edu.java.teamproject.model;



public class BoardHistory {

	private String ip;
	private int bno;
	private long access_time;
	
	public BoardHistory() {}
	
	public BoardHistory(String ip, int bno, long access_time) {
		super();
		this.ip = ip;
		this.bno = bno;
		this.access_time = access_time;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public long getAccess_time() {
		return access_time;
	}

	public void setAccess_time(long access_time) {
		this.access_time = access_time;
	}
	
	
	
}
