package edu.java.teamproject.model;

import java.util.Date;

public class Answer {

	private int ano;
	private int board_num;
	private Date write_date;
	private String writer;
	private int choose;
	private int rec_count;
	private String content;
	
	public Answer() {
		// TODO Auto-generated constructor stub
	}

	public Answer(int ano, int board_num, Date write_date, String writer, int choose, int rec_count, String content) {
		super();
		this.ano = ano;
		this.board_num = board_num;
		this.write_date = write_date;
		this.writer = writer;
		this.choose = choose;
		this.rec_count = rec_count;
		this.content = content;
	}

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getChoose() {
		return choose;
	}

	public void setChoose(int choose) {
		this.choose = choose;
	}

	public int getRec_count() {
		return rec_count;
	}

	public void setRec_count(int rec_count) {
		this.rec_count = rec_count;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Answer [ano=" + ano + ", board_num=" + board_num + ", write_date=" + write_date + ", writer=" + writer
				+ ", choose=" + choose + ", rec_count=" + rec_count + ", content=" + content + "]";
	}
	
}
