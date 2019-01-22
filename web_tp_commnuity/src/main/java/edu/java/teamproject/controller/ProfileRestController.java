package edu.java.teamproject.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.java.teamproject.model.User;
import edu.java.teamproject.service.ProfileService;


@RestController
@RequestMapping(value = "profile-edit")
public class ProfileRestController {
	
	@Autowired ProfileService profileService;
	private Logger logger = LoggerFactory.getLogger(ProfileRestController.class);
	@RequestMapping(value = "123", method = RequestMethod.POST)
	public ResponseEntity<Integer> createReply(
			@RequestBody User user, HttpSession session) {
		// @RequestBody 어노테이션:
		// 요청(request) 패킷의 body에 포함된 JSON 문자열을
		// 자바 클래스 타입으로 변환해주는 어노테이션
		// @RequestBody가 제대로 동작하려면 pom.xml파일에
		// jackson-databind 라이브러리가 포함되어 있어야 함
		
		//logger.info("createReply() 호출", reply.toString());
//		User user1 = (User)session.getAttribute("login");
//		String loginId = user1.getId();
//		user.setId(loginId);
		
		int result = profileService.updateUserInfo(user);
		//logger.info("insert 결과: {}", result);
		
		ResponseEntity<Integer> entity = null;
		if (result == 1) { // UserProfile 수정 성공
			entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		} else {
			entity = new ResponseEntity<Integer>(result, HttpStatus.BAD_REQUEST);
		}
		return entity;	
	}
	
	@RequestMapping(method = RequestMethod.PUT)
	public ResponseEntity<Integer> updateProfile(@RequestBody User user) {
		logger.info("updateProfile({}) 호출", user.toString());
		
		int updateResult = profileService.updateUserInfo(user);
		ResponseEntity<Integer> entity = null;
		if(updateResult == 1) {
			entity = new ResponseEntity<Integer>(updateResult, HttpStatus.OK);
		}
		else {
			entity = new ResponseEntity<Integer>(updateResult, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
}
