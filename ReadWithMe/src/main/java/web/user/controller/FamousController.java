package web.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import web.user.service.face.FamousService;
import web.util.Paging;

@Controller
public class FamousController {
	
	// 생성
	// 컴퓨터 옮김
	// 수정 테스트
	
	//로깅 객체
	private static final Logger logger = LoggerFactory.getLogger(FamousController.class);
	
	@Autowired private FamousService famousService;
	
	@RequestMapping(value="/list")
	public void boardList(Paging paramData, Model model) {
		logger.info("/board/list");
	}	

}
