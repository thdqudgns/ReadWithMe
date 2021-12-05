package web.user.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import web.user.dto.AdminInquiry;
import web.user.dto.Inquiry;
import web.user.dto.Inquiry_file;
import web.user.dto.UserTb;
import web.user.service.face.UserInquiryService;
import web.util.Paging;

@Controller
public class UserInquiryController {

	//Service 연결
	@Autowired private UserInquiryService userInquiryService;
	
	private static final Logger logger = LoggerFactory.getLogger(UserInquiryController.class);
	
	//1:1 질문 게시판 조회
	@RequestMapping(value="/user/inquiry/list")
	public String UserInquiryList(Inquiry inquiry, Paging paramData, Model model, HttpSession session) {
		
		String search = paramData.getSearch();
		
		//페이징 처리
		Paging paging = userInquiryService.getPaging(paramData);
		
		logger.info("{}", paramData);
		logger.info("{}", paging);
		
		//	타입 번호
		int type_no = inquiry.getType();
		paging.setType(type_no);
		paging.setSearch(search);
		
		//	사용자 번호
		
		if (session.getAttribute("user_no") == null ) {
			return "redirect:/";
		}
		
		int user_no = Integer.parseInt(String.valueOf(session.getAttribute("user_no")));
		paging.setUser_no(user_no);
		
		//1:1질문 게시판
		List<Inquiry> list = userInquiryService.list(paging);
		
		//모델값 전달
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
		return "user/inquiry/list";
	}
	
	//1:1질문 상세보기
	@RequestMapping(value="/user/inquiry/view")
	public String UserInquiryView(Inquiry inquiry, Model model, HttpSession session) {
		
		//잘못된 게시글 번호로 게시글 조회 차단
		if( inquiry.getBoard_no() < 1 ) {
			return "redirect:/user/inquiry/list";
		}
		
		// 로그인한 회원 조회
		int user_no = Integer.parseInt(String.valueOf(session.getAttribute("user_no")));
		inquiry.setUser_no(user_no);
		
		UserTb user = userInquiryService.userInfo(user_no);
		
		model.addAttribute("user", user);
		
		//상세보기
		inquiry = userInquiryService.view(inquiry);
		
		//	첨부파일 정보 전달
		Inquiry_file inquiry_file = userInquiryService.getAttachFile(inquiry);
		model.addAttribute("inquiry_file", inquiry_file);
		
		
		//댓글 리스트 전달
		AdminInquiry adminInquiry = new AdminInquiry();
		List<AdminInquiry> commentList = userInquiryService.getCommentList(inquiry);
		model.addAttribute("commentList", commentList);
		
		//모델값 전달
		model.addAttribute("inquiry", inquiry);
		
		return "user/inquiry/view";
	}
	
	//1:1질문 글쓰기
	@RequestMapping(value="/user/inquiry/write", method=RequestMethod.GET)
	public String UserInquiryWrite() {
		return "user/inquiry/write";
	}
	
	@RequestMapping(value="/user/inquiry/write", method=RequestMethod.POST)
	public String UserInquiryWriteProc(Inquiry inquiry, MultipartFile file, HttpSession session) {
		logger.info("{}", inquiry);
		
		// 로그인을 한 회원의 회원번호조회
		int user_no = Integer.parseInt(String.valueOf(session.getAttribute("user_no")));
		inquiry.setUser_no(user_no);
		
		logger.info("{}", file);
		
		userInquiryService.write(inquiry, file);
	
		return "redirect:/user/inquiry/list";
	}
	
	//	1:1 질문 수정
	@RequestMapping(value="/user/inquiry/update" , method = RequestMethod.GET)
	public String UserInquiryUpdate(Inquiry inquiry, Model model) {
		
		logger.info("{}", inquiry);
		
		//	게시글 번호가 1보다 작으면 목록을 보내기
		if(inquiry.getBoard_no() < 1 ) {
			return "redirect:/user/inquiry";
		}
		
		//	게시글 상세 정보 전달
		inquiry = userInquiryService.view(inquiry);
		
		//	모델값 전달
		model.addAttribute("inquiry", inquiry);
		
		//	첨부파일 전달
		Inquiry_file inquiry_file = userInquiryService.getAttachFile(inquiry);
		
		if(inquiry_file == null) {
			
			boolean isInquiryfile = false;
			
			model.addAttribute("isInquiryfile", isInquiryfile);
			
		} else {
			
			boolean isInquiryfile = true;
			
			model.addAttribute("isInquiryfile", isInquiryfile);
		}
		
		model.addAttribute("inquiryfile", inquiry_file);
		
		
		
		return "user/inquiry/update";
	}
	
	@RequestMapping(value="/user/inquiry/update", method=RequestMethod.POST)
	public String UserInquiryUpdateProc(Inquiry inquiry, MultipartFile file) {
		
		userInquiryService.update(inquiry, file);
		
		return "redirect:/user/inquiry/list?board_no=" + inquiry.getBoard_no();
	}
	
	
	// 1:1질문 삭제
	@RequestMapping(value = "/user/inquiry/delete", method = RequestMethod.GET)
	public String UserInquiryDelete(Inquiry inquiry, HttpServletRequest req) {

		if (inquiry.getBoard_no() < 1) {
			return "redirect: /user/inquiry/list";
		}
		

		userInquiryService.delete(inquiry);

		return "redirect:/user/inquiry/list";
	}
	
	//	1:1질문 선택 삭제
	@RequestMapping( value = "/user/inquiry/delete", method=RequestMethod.POST)
	public String UserInquiryDelete(HttpServletRequest req, Model model) {
//		public String UserInquiryDelete(HttpServletRequest req, String[] valueArr, Model model) {
		
		String[] ajaxMsg = req.getParameterValues("valueArr");
		int size = ajaxMsg.length;

		logger.info("** {}", Arrays.toString(ajaxMsg));
		
		for(int i=0; i<ajaxMsg.length; i++) {
			logger.info("ajaxMsg[i]: {}", ajaxMsg[i]);
			userInquiryService.deleteChecked(ajaxMsg[i]);
			
//			result = userInquiryService.deleteChecked(ajaxMsg[i]);
			
		}	
		
//		HashMap<String, Object> map = new HashMap<>();
//		map.put("check", valueArr);
//		userInquiryService.deleteChecked(map);
		
//		model.addAttribute("result", result);
		model.addAttribute("result", 1);
		return "jsonView";
	}
	
	@RequestMapping(value="/user/inquiry/download")
	public String download(int file_no, Model model) {
		
		logger.info("{}",file_no);
		
		Inquiry_file inquiry_file = userInquiryService.getFile(file_no);
		
		model.addAttribute("inquiryFile", inquiry_file);
		
		return "inquiryDown";
	}
	
}





















