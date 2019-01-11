package edu.java.teamproject.model;

import java.util.Date;

public class Board {
	
	private int bno;
	private String title;
	private String content;
	private String writer;
	private Date write_date;
	private String category;
	private String type;
	private String tag;
	private String link;
	private String image;
	private int answer_count;
	private int view_count;
	private int rec_count;
	private int reply_count;
	private int answer_choose;
	
	public Board() {
		// TODO Auto-generated constructor stub
	}

	public Board(int bno, String title, String content, String writer, Date write_date, String category, String type,
			String tag, String link, String image, int answer_count, int view_count, int rec_count, int reply_count,
			int answer_choose) {
		super();
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.write_date = write_date;
		this.category = category;
		this.type = type;
		this.tag = tag;
		this.link = link;
		this.image = image;
		this.answer_count = answer_count;
		this.view_count = view_count;
		this.rec_count = rec_count;
		this.reply_count = reply_count;
		this.answer_choose = answer_choose;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getAnswer_count() {
		return answer_count;
	}

	public void setAnswer_count(int answer_count) {
		this.answer_count = answer_count;
	}

	public int getView_count() {
		return view_count;
	}

	public void setView_count(int view_count) {
		this.view_count = view_count;
	}

	public int getRec_count() {
		return rec_count;
	}

	public void setRec_count(int rec_count) {
		this.rec_count = rec_count;
	}

	public int getReply_count() {
		return reply_count;
	}

	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}

	public int getAnswer_choose() {
		return answer_choose;
	}

	public void setAnswer_choose(int answer_choose) {
		this.answer_choose = answer_choose;
	}

	@Override
	public String toString() {
		return "Board [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", write_date=" + write_date + ", category=" + category + ", type=" + type + ", tag=" + tag
				+ ", link=" + link + ", image=" + image + ", answer_count=" + answer_count + ", view_count="
				+ view_count + ", rec_count=" + rec_count + ", reply_count=" + reply_count + ", answer_choose="
				+ answer_choose + "]";
	}
	
	
	
}
