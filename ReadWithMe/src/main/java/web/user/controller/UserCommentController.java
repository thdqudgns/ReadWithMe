package web.user.controller;

import java.io.IOException;
import java.io.Writer;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.user.dto.AdminInquiry;
import web.user.service.face.UserInquiryService;

@Controller
@RequestMapping(value = "/comment")
public class UserCommentController {

	@Autowired private UserInquiryService userInquiryService;
	
	@RequestMapping(value = "/insert", method=RequestMethod.POST)
	public String insert(AdminInquiry adminInquiry, Model model, HttpSession session) {
		
		adminInquiry.setId( (String) session.getAttribute("id") );
		userInquiryService.insertComment(adminInquiry);
		
		return "redirect:/user/inquiry/view?board_no=" + adminInquiry.getBoard_no();
	}
	
	@RequestMapping(value = "/delete")
	public void delete(AdminInquiry adminInquiry, Writer writer, Model model) {
		
		boolean success = userInquiryService.deleteComment(adminInquiry);
		
		try {
			writer.append("{\"success\":"+success+"}" );
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
}
