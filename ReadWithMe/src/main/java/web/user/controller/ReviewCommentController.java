package web.user.controller;

import java.io.IOException;
import java.io.Writer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.user.dto.Rpt_board;
import web.user.dto.Rpt_cmt;
import web.user.dto.Rv_cmt;
import web.user.service.face.ReviewService;

@Controller
@RequestMapping(value = "/user/review/comment")
public class ReviewCommentController {
	
	//로깅 객체
		private static final Logger logger = LoggerFactory.getLogger(ReviewCommentController.class);
	
	@Autowired private ReviewService reviewService;
	
	@RequestMapping(value="/insert")
	public String insert(Rv_cmt comment, Model model, HttpSession session) {

		comment.setUser_no(Integer.parseInt((String) session.getAttribute("user_no")));
		comment.setNick((String) session.getAttribute("user_nick"));
		reviewService.insertComment(comment);
		
		return "redirect:/user/review/view?review_no="+comment.getReview_no();
	}
	
	@RequestMapping(value="/delete")
	public void delete(Rv_cmt comment, Writer writer, Model model) {
		
		boolean success = reviewService.deleteComment(comment);
		
		try {
			writer.append("{\"success\":"+success+"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	//수정
	@RequestMapping(value="/update")
	public void updateProcess(Rv_cmt comment, Writer writer, HttpSession session) {
		
		logger.info("comment_no : {}", comment);
		
		//테스트 - 매개변수에 String comment_content 추가
//		logger.info("comment_content : {}", comment_content); //null로 뜬다.
//		comment.setComment_content(comment_content);
		
		boolean success = reviewService.updateReviewComment(comment);
		
		try {
			writer.append("{\"success\":"+success+"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//신고
		@RequestMapping(value="/report")
		public void report(Rpt_cmt comment, Writer writer, HttpSession session) {
			
			logger.info("/review/report");
			logger.info("review_no : {}", comment);
			
			comment.setUser_no(Integer.parseInt((String)session.getAttribute("user_no")));
			
			boolean success = reviewService.insertReportCommentByReviewNo(comment);
			
			try {
				writer.append("{\"success\":"+success+"}");
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
	

}
