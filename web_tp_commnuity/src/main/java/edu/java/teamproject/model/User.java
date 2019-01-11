package edu.java.teamproject.model;

import java.util.Date;

public class User {

	private String id;
	private String password;
	private String email;
	private Date join_date;
	private String nickname;
	private String introduce;
	private int active_point;
	private String profile_image;
	private String background_image;
	private int verify;
	
	public User() {
		// TODO Auto-generated constructor stub
	}
	
	

	public User(String id, String password) {
		super();
		this.id = id;
		this.password = password;
	}



	public User(String id, String password, String email, Date join_date, String nickname, String introduce,
			int active_point, String profile_image, String background_image, int verify) {
		super();
		this.id = id;
		this.password = password;
		this.email = email;
		this.join_date = join_date;
		this.nickname = nickname;
		this.introduce = introduce;
		this.active_point = active_point;
		this.profile_image = profile_image;
		this.background_image = background_image;
		this.verify = verify;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public int getActive_point() {
		return active_point;
	}

	public void setActive_point(int active_point) {
		this.active_point = active_point;
	}

	public String getProfile_image() {
		return profile_image;
	}

	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}

	public String getBackground_image() {
		return background_image;
	}

	public void setBackground_image(String background_image) {
		this.background_image = background_image;
	}

	public int getVerify() {
		return verify;
	}

	public void setVerify(int verify) {
		this.verify = verify;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", password=" + password + ", email=" + email + ", join_date=" + join_date
				+ ", nickname=" + nickname + ", introduce=" + introduce + ", active_point=" + active_point
				+ ", profile_image=" + profile_image + ", background_image=" + background_image + ", verify=" + verify
				+ "]";
	}
	
	
	
}
