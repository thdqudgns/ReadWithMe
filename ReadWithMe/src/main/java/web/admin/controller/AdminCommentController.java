package web.admin.controller;

import java.io.IOException;
import java.io.Writer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.admin.service.face.InquiryService;
import web.user.dto.AdminInquiry;
import web.user.service.face.UserInquiryService;

@Controller
@RequestMapping(value = "/admin/comment")
public class AdminCommentController {

	@Autowired private UserInquiryService userInquiryService; 
	@Autowired private InquiryService inquiryService;
	
	@RequestMapping(value = "/insert")
	public String insert(AdminInquiry adminInquiry, Model m, HttpSession s) {
	
		adminInquiry.setId((String) s.getAttribute("id"));
		inquiryService.insertComment(adminInquiry);
		
		return "redirect:/admin/inquiry/view?board_no="+adminInquiry.getBoard_no();
	}
	
	@RequestMapping(value = "/delete")
	public void delete(AdminInquiry adminInquiry, Writer writer, Model model) {
		
		boolean success = userInquiryService.deleteComment(adminInquiry);
		
		try {
			writer.append("{\"success\":"+success+"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value = "/update", method=RequestMethod.POST)
	public void update(AdminInquiry adminInquiry, Model model) {
		
		System.out.println( " adminInquiry : " + adminInquiry);
		
		inquiryService.updateComment(adminInquiry);
		
//		inquiryService.updateComment(adminInquiry);
		
	}
	
}
