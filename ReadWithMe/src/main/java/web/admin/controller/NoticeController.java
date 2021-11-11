package web.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import web.admin.service.face.NoticeService;
import web.user.dto.Notice;
import web.util.Paging;

@Controller
public class NoticeController {

	// 로깅
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	// 서비스 객체
	@Autowired private NoticeService noticeService;
	
	@RequestMapping(value="/admin/notice")
	public String NoticeList(Paging paramData, Model model) {
		logger.info("/admin/notice");
		
		// 페이징 계산
		Paging paging = noticeService.getPaging( paramData );
		
		List<Notice> list = noticeService.list(paging);
		
		for(Notice n : list) {
			logger.info("{}", n);
		}
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		

		
		return "admin/notice";
	}
	
}
