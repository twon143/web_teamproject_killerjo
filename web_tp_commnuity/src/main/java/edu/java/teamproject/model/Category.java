package edu.java.teamproject.model;

public class Category {

	private String c_code;
	private String name;
	
	public Category() {
		// TODO Auto-generated constructor stub
	}

	public Category(String c_code, String name) {
		super();
		this.c_code = c_code;
		this.name = name;
	}

	public String getC_code() {
		return c_code;
	}

	public void setC_code(String c_code) {
		this.c_code = c_code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Category [c_code=" + c_code + ", name=" + name + "]";
	}
	
	
}
