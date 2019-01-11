package edu.java.teamproject.model;

public class Type {
	
	private String t_code;
	private String name;
	
	public Type() {
		// TODO Auto-generated constructor stub
	}

	public Type(String t_code, String name) {
		super();
		this.t_code = t_code;
		this.name = name;
	}

	public String getT_code() {
		return t_code;
	}

	public void setT_code(String t_code) {
		this.t_code = t_code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Type [t_code=" + t_code + ", name=" + name + "]";
	}
	
	
}
