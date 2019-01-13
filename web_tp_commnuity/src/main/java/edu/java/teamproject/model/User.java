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
	private String auth_code;
	private String session_key;
	private Date session_limit;
	private Date login_date;
	
	
	public User() {
		// TODO Auto-generated constructor stub
	}
	
	

	public User(String id, String password) {
		super();
		this.id = id;
		this.password = password;
	}



	public User(String id, String password, String email, Date join_date, String nickname, String introduce,
			int active_point, String profile_image, String background_image, int verify, String auth_code,
			String session_key, Date session_limit, Date login_date) {
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
		this.auth_code = auth_code;
		this.session_key = session_key;
		this.session_limit = session_limit;
		this.login_date = login_date;
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



	public String getAuth_code() {
		return auth_code;
	}



	public void setAuth_code(String auth_code) {
		this.auth_code = auth_code;
	}



	public String getSession_key() {
		return session_key;
	}



	public void setSession_key(String session_key) {
		this.session_key = session_key;
	}



	public Date getSession_limit() {
		return session_limit;
	}



	public void setSession_limit(Date session_limit) {
		this.session_limit = session_limit;
	}



	public Date getLogin_date() {
		return login_date;
	}



	public void setLogin_date(Date login_date) {
		this.login_date = login_date;
	}



	@Override
	public String toString() {
		return "User [id=" + id + ", password=" + password + ", email=" + email + ", join_date=" + join_date
				+ ", nickname=" + nickname + ", introduce=" + introduce + ", active_point=" + active_point
				+ ", profile_image=" + profile_image + ", background_image=" + background_image + ", verify=" + verify
				+ ", auth_code=" + auth_code + ", session_key=" + session_key + ", session_limit=" + session_limit
				+ ", login_date=" + login_date + "]";
	}

	

}
