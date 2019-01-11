package edu.java.teamproject.model;

import java.util.Date;

public class Reply {

	private int rno;
	private int parent_num;
	private Date write_date;
	private int rec_count;
	private String writer;
	private int prno;
	private String content;
	private String type;
	
	public Reply() {
		// TODO Auto-generated constructor stub
	}

	public Reply(int rno, int parent_num, Date write_date, int rec_count, String writer, int prno, String content,
			String type) {
		super();
		this.rno = rno;
		this.parent_num = parent_num;
		this.write_date = write_date;
		this.rec_count = rec_count;
		this.writer = writer;
		this.prno = prno;
		this.content = content;
		this.type = type;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getParent_num() {
		return parent_num;
	}

	public void setParent_num(int parent_num) {
		this.parent_num = parent_num;
	}

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

	public int getRec_count() {
		return rec_count;
	}

	public void setRec_count(int rec_count) {
		this.rec_count = rec_count;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getPrno() {
		return prno;
	}

	public void setPrno(int prno) {
		this.prno = prno;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Reply [rno=" + rno + ", parent_num=" + parent_num + ", write_date=" + write_date + ", rec_count="
				+ rec_count + ", writer=" + writer + ", prno=" + prno + ", content=" + content + ", type=" + type + "]";
	}
	
	
}
