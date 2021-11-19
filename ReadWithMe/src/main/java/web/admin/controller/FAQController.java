package web.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import web.admin.service.face.FAQService;
import web.user.dto.FAQ;
import web.util.Paging;

@Controller
public class FAQController {

	//	로그 객체
	private static final Logger logger = LoggerFactory.getLogger(FAQController.class);
	
	//	서비스 객체
	@Autowired private FAQService faqService;
	
	
	//	자주묻는질문 목록
	@RequestMapping(value="/admin/faq/list")
	public void FAQList(Paging paramData, Model model) {	
		//	로깅
		logger.info("/admin/faq/list");
		
		//	페이징 계산
		Paging paging = faqService.getPaging( paramData );
		
		//	게시판 조회하기
		List<FAQ> list = faqService.list(paging);
		
		//	자주묻는질문 테스트
		for(FAQ f : list) {
			logger.info("{}", f);
		}
		
		//	모델값
		model.addAttribute("paging", paging);
		model.addAttribute("FAQList", list);
	}
	
	//	자주묻는질문 상세보기
	@RequestMapping(value="/admin/faq/view")
	public String FAQView(FAQ viewFAQ, Model model, HttpSession session) {
		
		//	0 또는 - 게시글 번호의 게시글 차단
		if( viewFAQ.getBoard_no() < 1 ) {
			return "redirect:/admin/faq/list";
		}
		
		//	게시판 상세 조회
		viewFAQ = faqService.view(viewFAQ);
		
//		//	첨부파일
//		FileTb fileTb = faqService.getAttachFile(viewFAQ);
//		model.addAttribute("FAQfile", fileTb);
		
		//	모델값
		model.addAttribute("viewFAQ", viewFAQ);
		
		return "admin/faq/view";
		
	}
	
	//	자주묻는질문 글쓰기
	@RequestMapping(value="/admin/faq/write", method=RequestMethod.GET)
	public void FAQWrite() {}
	
	@RequestMapping(value="/admin/faq/write", method=RequestMethod.POST)
	public String FAQWriteProc(FAQ faq) {
		logger.info("{}", faq);
		
		faqService.write(faq);
		
		return "redirect:/admin/faq/list";
		
	}
	
	
	//	자주묻는질문 수정
	@RequestMapping(value="/admin/faq/update", method=RequestMethod.GET)
	public String FAQUpdate(FAQ faq, Model model) {
		logger.info("{}", faq);
		
		//	게시글 번호가 1보다 작으면 목록을 보내기
		if(faq.getBoard_no() < 1) {
			return "redirect:/admin/faq/list";
		}
		
		//	게시글 상세 정보 전달
		faq = faqService.view(faq);
		
		model.addAttribute("view", faq);
		
		return "/admin/faq/update";
	}
	
	@RequestMapping(value="/admin/faq/update", method=RequestMethod.POST)
	public String FAQUpdateProc(FAQ faq) {
		logger.info("[]", faq);
		
		faqService.update(faq);
		
		return "redirect:/admin/faq/list?board_no=" + faq.getBoard_no() ;
	}
	
	@RequestMapping(value="/admin/faq/delete", method=RequestMethod.GET)
	public String FAQDelete(FAQ faq) {
		
		if(faq.getBoard_no() < 1 ) {
			return "redirect: /admin/faq/list";
		}
		
		faqService.delete(faq);
		
		return "redirect:/admin/faq/list";
		
	}
	
}



















