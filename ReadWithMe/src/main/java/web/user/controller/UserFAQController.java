package web.user.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import web.user.dto.FAQ;
import web.user.service.face.UserFAQService;
import web.util.Paging;

@Controller
public class UserFAQController {

	//	로그 객체
	private static final Logger logger = LoggerFactory.getLogger(UserFAQController.class);
	
	//	서비스 객체
	@Autowired private UserFAQService userFAQService;
	
	//자주묻는질문 게시판
	@RequestMapping(value="/user/faq/list")
	public String UserFAQList(FAQ faq, Paging paramData, Model model) {
		
		logger.info("/user/faq/list");
		
		//	페이징 처리
		Paging paging = userFAQService.getPaging(paramData);
		
		//타입 번호
		int type_no = faq.getType();
		paging.setType(type_no);
		
		//	자주묻는질문 게시판
		List<FAQ> list = userFAQService.list(paging);
		
		
		//	모델값 전달
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		
		
		return "user/faq/list";
	}
	//자주묻는질문 상세보기
	@RequestMapping(value="/user/faq/view")
	public String UserFAQView(FAQ faq, Model model) {
		
		
		
		//잘못된 게시글 번호로 조회할 시 게시판으로 다시 돌려보냄
		if(faq.getBoard_no() < 1) {
			return "redirect:/user/faq/list";
		}
		
		//상세보기 조회
		faq = userFAQService.view(faq);
		
		logger.info("{}", faq);
		
		//모델값 전달
		model.addAttribute("faq", faq);
		
		
		return "user/faq/view";
	}
	
	
}

























