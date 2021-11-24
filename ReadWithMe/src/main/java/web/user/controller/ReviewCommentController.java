package web.user.controller;

import java.io.IOException;
import java.io.Writer;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import web.user.dto.Rv_cmt;
import web.user.service.face.ReviewService;

@Controller
@RequestMapping(value = "/user/review/comment")
public class ReviewCommentController {
	
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

}
