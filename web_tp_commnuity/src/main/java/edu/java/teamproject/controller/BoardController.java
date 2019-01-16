package edu.java.teamproject.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import edu.java.teamproject.model.Board;
import edu.java.teamproject.service.BoardService;
import edu.java.teamproject.util.Criteria;
import edu.java.teamproject.util.PageMaker;

@Controller
@RequestMapping(value = "board")
public class BoardController {
   
   private final Logger logger = LoggerFactory.getLogger(BoardController.class);
   
   @Autowired private BoardService boardService;
   
   @RequestMapping(value="write-form", method = RequestMethod.GET)
   public void postRegister(@ModelAttribute("type") String type, @ModelAttribute("queryString") String queryString) {
      logger.info("postRegister(type : {}, queryString : {}) 호출", type, queryString);
     
   }
   
   /* !!!테스트용!!! */
   @RequestMapping(value="post-write-test", method = RequestMethod.GET)
   public void postTest() {
      logger.info("글쓰기 테스트 호출 ");
   }
   
   @RequestMapping(value = "listPaging", method = RequestMethod.GET)
   public void listCriteria(Model model, Criteria criteria, 
		   @RequestParam("category") String category,
		   @RequestParam("type") String type,
		   String sort) throws Exception{
	   logger.info("listPaging(criteria : {}, category : {}, type : {}, sort : {})", criteria, category, type, sort);
	   
	   PageMaker pageMaker = new PageMaker();
	   pageMaker.setCriteria(criteria);
	   pageMaker.setTotalCount(boardService.countBoards(criteria, category, type));
	   
	   logger.info("pageMaker : {}", pageMaker);
	   
	   if(sort != null) {
		   model.addAttribute("boardList", boardService.listCriteria(criteria, category, type, sort));
	   } else {
		   model.addAttribute("boardList", boardService.listCriteria(criteria, category, type, "newest"));
	   }
	   model.addAttribute("pageMaker", pageMaker);
	   model.addAttribute("category", category);
	   model.addAttribute("type", type);
	   if(sort != null) {
		   model.addAttribute("sort", sort);
	   } else {
		   model.addAttribute("sort", "newest");
	   }
	   
   }
   
   // 글 상세보기 페이지 이동
   @RequestMapping(value = "readPaging", method = RequestMethod.GET)
   public void readPaging(@RequestParam("bno") int bno, 
		   Criteria criteria, Model model,
		   @ModelAttribute("category") String category,
		   @ModelAttribute("type") String type,
		   String sort) {
	   
	   
	   // 쿠키 유무 (rememberReadPageCookie) 확인
	   /*if(WebUtils.getCookie(request, "rememberReadPageCookie") != null) {
		   if( 쿠키 값 중에 bno를 이미 가지고 있다면 )
		   {
		   		
			   model.addAttribute("board", boardService.readByBno(bno));
		   }
	   } else {
		   
	   
	   }*/
	   model.addAttribute("board", boardService.readByBno(bno));
	   
	   if(sort != null) {
		   model.addAttribute("sort", sort);
	   } else {
		   model.addAttribute("sort", "newest");
	   }
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
}