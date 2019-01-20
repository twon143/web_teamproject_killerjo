package edu.java.teamproject.util;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
 
public class UploadPath {
	
	private static final Logger logger = LoggerFactory.getLogger(UploadPath.class);
 
    public static String attach_path = "resources/upload/";
 
    public static String path(HttpServletRequest request) {
        String uploadPath = "";
        try {
            String root_path = request.getServletContext().getRealPath("/");
 
            logger.info("root_path = {}", root_path);
            
            uploadPath = root_path + attach_path.replace('/', File.separatorChar);
 
            logger.info("uploadPath = {}", uploadPath);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return uploadPath;
    }
     
}