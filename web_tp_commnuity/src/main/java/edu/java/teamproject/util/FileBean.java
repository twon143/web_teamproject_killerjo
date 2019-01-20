package edu.java.teamproject.util;

import org.springframework.web.multipart.MultipartFile;

public class FileBean { 
	private String newFilename; 
	private MultipartFile upload; 
	private String imageUrl; 
	private String CKEditorFuncNum;
	
	public FileBean() {}
	
	public FileBean(String newFilename, MultipartFile upload, String imageUrl, String cKEditorFuncNum) {
		super();
		this.newFilename = newFilename;
		this.upload = upload;
		this.imageUrl = imageUrl;
		CKEditorFuncNum = cKEditorFuncNum;
	}
	
	@Override
	public String toString() {
		return "FileBean [newFilename=" + newFilename + ", upload=" + upload + ", imageUrl=" + imageUrl
				+ ", CKEditorFuncNum=" + CKEditorFuncNum + "]";
	}

	public String getNewFilename() {
		return newFilename;
	}
	public void setNewFilename(String newFilename) {
		this.newFilename = newFilename;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getCKEditorFuncNum() {
		return CKEditorFuncNum;
	}
	public void setCKEditorFuncNum(String cKEditorFuncNum) {
		CKEditorFuncNum = cKEditorFuncNum;
	} 
	
	
	
}

