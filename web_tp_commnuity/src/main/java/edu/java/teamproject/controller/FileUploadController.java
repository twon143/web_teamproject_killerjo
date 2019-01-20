package edu.java.teamproject.controller;

import java.io.File;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import edu.java.teamproject.util.FileBean;

@RestController
@RequestMapping(value = "file")
public class FileUploadController {
	
	private final Logger logger = LoggerFactory.getLogger(FileUploadController.class);

	@RequestMapping(value = "fileUpload", method = RequestMethod.POST)
	public void fileUpload(@ModelAttribute("fileBean") FileBean fileBean, HttpServletRequest request, HttpServletResponse response, Model model) {

		logger.info("fileBean : {}", fileBean);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		
//		Date date = new Date();
		Calendar today = Calendar.getInstance();
		int year = today.get(Calendar.YEAR);
		int month = today.get(Calendar.MONTH) + 1;
		String monthStr = "";
		
		if(month < 10) {
			monthStr = "0" + month;
		} else {
			monthStr = "" + month;
		}
		
		String defaultPath = request.getSession().getServletContext().getRealPath("/");
		String contextPath = request.getSession().getServletContext().getContextPath();
		String fileUploadPathTail = "ckeImage/" + year + "" + monthStr;
		String fileUploadPath = defaultPath + "/" + fileUploadPathTail;
		
		logger.info("defaultPath : {}", defaultPath);
		logger.info("contextPath : {}", contextPath);
		logger.info("fileUploadPathTail : {}", fileUploadPathTail);
		logger.info("fileUploadPath : {}", fileUploadPath);
		
		try {
			MultipartFile file = fileBean.getUpload();
			
			if(file != null) {
				String fileName = file.getOriginalFilename();
				String fileNameExt = fileName.substring(fileName.indexOf(".") + 1);
				
				logger.info("fileName : {}", fileName);
				logger.info("fileNameExt : {}", fileNameExt);
				
				if(!"".equals(fileName)) {
					File destD = new File(fileUploadPath);
					
					// 임시 엑셀 디렉토리 생성
					if(!destD.exists()) {
						// 없으면 생성
						destD.mkdirs();
					}
					
					File destination = File.createTempFile("ckeditor_", "." + fileNameExt, destD);
					file.transferTo(destination);
					
					fileBean.setNewFilename(destination.getName());
					fileBean.setImageUrl(contextPath + "/" + fileUploadPathTail + "/" + destination.getName());
					
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		/*
		HttpSession session = request.getSession(); 
		String root_path = session.getServletContext().getRealPath("/"); // 웹서비스 root 경로 
		String attach_path = "resources/files/attach/";
		
		logger.info("root_path : {}, attach_path : {}", root_path, attach_path);
		
		MultipartFile upload = fileBean.getUpload(); 
		String filename = ""; 
		String CKEditorFuncNum = "";

		if (upload != null) { 
			filename = upload.getOriginalFilename(); 
			fileBean.setFilename(filename); 
			CKEditorFuncNum = fileBean.getCKEditorFuncNum(); 
			
			try { 
				File file = new File(root_path + attach_path + filename); 
				logger.info(root_path + attach_path + filename); 
				upload.transferTo(file); 
			} catch (IOException e) { 
				e.printStackTrace(); 
			} 
		}
		
		String file_path = "/bbs/" + attach_path + filename; 
		model.addAttribute("file_path", file_path); 
		model.addAttribute("CKEditorFuncNum", CKEditorFuncNum);
		*/
	}
}
