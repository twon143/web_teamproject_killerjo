package edu.java.teamproject.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import edu.java.teamproject.model.Board;
import edu.java.teamproject.model.BoardHistory;
import edu.java.teamproject.service.BoardHistoryService;
import edu.java.teamproject.service.BoardService;
import edu.java.teamproject.util.Criteria;
import edu.java.teamproject.util.PageMaker;

@Controller
@RequestMapping(value = "board")
public class BoardController {
   
   private final Logger logger = LoggerFactory.getLogger(BoardController.class);
   
   @Autowired private BoardService boardService;
   @Autowired private BoardHistoryService boardHistoryService;
   
   @RequestMapping(value = "searchPaging", method = RequestMethod.GET)
   public void searchPaging(Criteria criteria, 
		   @ModelAttribute("type") String type,
		   @ModelAttribute("sort") String sort,
		   String keyword, Model model) {
       logger.info("searchPaging(criteria : {}, type : {}, sort : {}, keyword : {})", criteria, type, sort, keyword);
       
       PageMaker pageMaker = new PageMaker();
       pageMaker.setCriteria(criteria);
       pageMaker.setTotalCount(boardService.countBoardsByKeyword(criteria, type, keyword));
       
       logger.info("pageMaker : {}", pageMaker);
       
       model.addAttribute("boardListBySearching", boardService.searchByKeyword(criteria, type, sort, keyword));
       
       if(keyword != null) {
    	   model.addAttribute("keyword", keyword);
       }
       
       model.addAttribute("pageMaker", pageMaker);
   }
   
   @RequestMapping(value="write-form", method = RequestMethod.GET)
   public void postRegister(@ModelAttribute("category") String category, @ModelAttribute("type") String type, String queryString, Model model) throws UnsupportedEncodingException {
      logger.info("postRegister(type : {}, queryString : {}, category : {}) 호출", type, queryString, category);
     
      if(queryString != null) {
    	  model.addAttribute("queryString", URLEncoder.encode(queryString, "utf-8"));
      }
   }
   
   /* !!!테스트용!!! */
   @RequestMapping(value="post-write-test", method = RequestMethod.GET)
   public void postTest() {
      logger.info("글쓰기 테스트 호출 ");
   }
   
   @RequestMapping(value = "listPaging", method = RequestMethod.GET)
   public void listCriteria(Model model, Criteria criteria, 
		   @ModelAttribute("category") String category,
		   @ModelAttribute("type") String type,
		   @ModelAttribute("sort") String sort) throws Exception{
	   logger.info("listPaging(criteria : {}, category : {}, type : {}, sort : {})", criteria, category, type, sort);
	   
	   PageMaker pageMaker = new PageMaker();
	   pageMaker.setCriteria(criteria);
	   pageMaker.setTotalCount(boardService.countBoards(criteria, category, type));
	   
	   logger.info("pageMaker : {}", pageMaker);
	   
	   model.addAttribute("boardList", boardService.listCriteria(criteria, category, type, sort));
	   /*if(sort != null) {
	  
	   } else {
		   model.addAttribute("boardList", boardService.listCriteria(criteria, category, type, "newest"));
	   }*/
	   model.addAttribute("pageMaker", pageMaker);
//	   model.addAttribute("category", category);
//	   model.addAttribute("type", type);
	   /*if(sort != null) {
		   model.addAttribute("sort", sort);
	   } else {
		   model.addAttribute("sort", "newest");
	   }*/
	   
   }
   
   // 글 상세보기 페이지 이동
   @RequestMapping(value = "readPaging", method = RequestMethod.GET)
   public String readPaging(@ModelAttribute("bno") int bno, 
		   Criteria criteria, Model model,
		   @ModelAttribute("category") String category,
		   @ModelAttribute("type") String type,
		   String sort,
		   HttpServletRequest request, HttpServletResponse response) {
	   // 아이피 정보를 얻어옴
	   HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
       String ip = req.getHeader("X-FORWARDED-FOR");
       
       if (ip == null) {
           ip = req.getRemoteAddr();
           logger.info("IP: " + ip);
       }
       Date date = new Date();
       long currentTime = date.getTime();
       
       // 게시글 접속 시간
       long access_time = boardHistoryService.selectAccessTime(ip, bno);
       
       // 현재시간에서 게시글 접속 시간을 뺸값
       long waitingTime = currentTime-access_time;
       
       long day = 1000*60*60*24;
       // ip, bno로 검색해서 시간 결과가 0(try-catch에서 nullPointerException이 나오면  0이 리턴되게함)이면 현재 정보가 없으므로 insert함
       if(access_time == 0) {
    	  BoardHistory boardHistory = new BoardHistory(ip, bno, currentTime);
    	  boardHistoryService.insertBoardHistory(boardHistory);
    	  // 조회수를 증가시킴
    	  boardService.updateReadCnt(bno, 1);
       }
       else if(waitingTime >= day) {
    	   // 하루(1000*60*60*24)가 지났으므로 조회수를 증가시킴
    	   boardService.updateReadCnt(bno, 1);
    	   // access_time을 업데이트함
    	   boardHistoryService.updateAccessTime(currentTime, ip, bno);
       }
       
       else if(waitingTime < day) {
    	   // 하루(1000*60*60*24) 보다 짧으므로 조회수를 증가시키지 않음
    	   logger.info("쿨타임: " + (day - waitingTime));
       }
       
       
     
	   
	   
	   
	   
	   logger.info("쿠키 생성 전");
	   // 해당글의 번호로된 값을 가지고있는 쿠키 유무확인
	   
		// 최근 본 글 포스트 쿠키 유무 확인
//	   WebUtils.getCookie(request, "recentPageCookie").setMaxAge(0);
//	   response.addCookie(WebUtils.getCookie(request, "recentPageCookie"));
		String cookies = request.getHeader("cookie");
		Cookie[] getCookie = request.getCookies();
		logger.info("쿠키 유무 확인, 갯수 : " + getCookie.length);
		logger.info("쿠키 header : " + cookies);
		
		// recentPageCookie 쿠키가 존재하지 않으면!!
		if (WebUtils.getCookie(request, "recentPageCookie") == null) {
			logger.info("-----if 문 쿠키 없으면 실행-----");
			// 쿠키 생성
			Cookie cookie = new Cookie("recentPageCookie", request.getParameter("bno"));
			// 쿠키 유효시간 설정 (1시간)
			cookie.setMaxAge(60 * 60);
			// 생성한 쿠키 response에 add
			response.addCookie(cookie);

			logger.info("cookie : " + cookie);
			logger.info("cookie : " + cookie.getValue());
//		   cookie.setMaxAge(0);
//		   response.addCookie(cookie);
			logger.info("-----if 문 쿠키 없으면 실행 끝-----");
			
		} else { // 쿠키가 존재 할 때
			logger.info("----- 쿠키 존재 할 때 실행 -----");

			for (int i = 0; i < getCookie.length; i++) {
				logger.info("존재 쿠키 값: " + getCookie[i].getValue());
			}
			// 쿠키 꺼내서 뒤에 bno 붙히기 
			String test2 = WebUtils.getCookie(request, "recentPageCookie").getValue().toString() + "," + request.getParameter("bno");
			logger.info("쿠키 꺼내서 뒤에 bno 붙히기 : " + test2);
			
			// 다시 쿠키에 넣기
			WebUtils.getCookie(request, "recentPageCookie").setValue(test2);
			logger.info("다시 쿠키에 넣기 : " + WebUtils.getCookie(request, "recentPageCookie").getValue().toString());
			
			
			logger.info("setValue 후 : " + getCookie[0].getValue().toString());

			
			logger.info("WebUtils.getCookie : " + WebUtils.getCookie(request, "recentPageCookie").getValue());
			logger.info("----- 쿠키 존재 할 때  실행 끝-----");

		}
		
		// 커밋 - 푸쉬 하기 위한 주석처리
		
	   
	   // 쿠키 유무 (rememberReadPageCookie) 확인
	   /*if(WebUtils.getCookie(request, "rememberReadPageCookie") != null) {
		   if( 쿠키 값 중에 bno를 이미 가지고 있다면 )
		   {
		   		
			   model.addAttribute("board", boardService.readByBno(bno));
		   }
	   } else {
		   
	   
	   }*/
		if(criteria != null ) {
			model.addAttribute("criteria", criteria);
		}
		
	   if(sort != null) {
		   model.addAttribute("sort", sort);
	   }

	   model.addAttribute("board", boardService.readByBno(bno));
	   
	   /*if(sort != null) {
		   model.addAttribute("sort", sort);
	   } else {
		   model.addAttribute("sort", "newest");
	   }*/
	   return "board/readPaging";
   }
   
   @RequestMapping(value = "modifyPaging", method = RequestMethod.GET)
   public void modifyPaging(@RequestParam("bno") int bno, @ModelAttribute("criteria") Criteria criteria, Model model) {
	   logger.info("modify_GET_Paging...");
	   model.addAttribute("board", boardService.readByBno(bno));
   }
   
   @RequestMapping(value = "modifyPaging", method = RequestMethod.POST)
   public String modifyPaging(Board board, Criteria criteria, RedirectAttributes redirectAttributes) {
	   
	   logger.info("modify_POST_Paging...");
	   if(boardService.update(board) == 1) {
		   redirectAttributes.addFlashAttribute("msg", "modSuccess");
	   }
	   redirectAttributes.addAttribute("page", criteria.getPage());
	   redirectAttributes.addAttribute("perPageNum", criteria.getPerPageNum());
	   
	   return "redirect:/board/listPaging";
   }
   
   @RequestMapping(value = "removePaging", method = RequestMethod.POST)
   public String removePaging(@RequestParam("bno") int bno, Criteria criteria, RedirectAttributes redirectAttributes) {
	   logger.info("remove_Paging...");
	   if(boardService.delete(bno) == 1) {
		   redirectAttributes.addFlashAttribute("msg", "delSuccess");
	   }
	   redirectAttributes.addAttribute("page", criteria.getPage());
	   redirectAttributes.addAttribute("perPageNum", criteria.getPerPageNum());
	   
	   return "redirect:/board/listPaging";
   }
   
   @RequestMapping(value = "registerPaging", method = RequestMethod.POST)
   public String registerPost(Board board) {
	   logger.info("registerPost() 호출");
	   logger.info("board({})", board.toString());
	   int result = boardService.registerPost(board);
	   // 상세보기페이지로 이동
	   
	   if(result == 1) {
	   String title = board.getTitle();
	   String content = board.getContent();
	   String writer = board.getWriter();
	   String category = board.getCategory();
	   String type = board.getType();
	   int bno = boardService.getBno(title, content, writer, category, type);
	   String url = "redirect:/board/readPaging";
	   String queryString = "?page=1&perPageNum=20&bno="+bno+"&category="+category+"&type="+type+"&sort=popular";
	   String targetUrl = url +  queryString;
	   return targetUrl;
	   }
	   else {
		   return null;
	   }
	   
	   
   }
}