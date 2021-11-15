package web.user.controller;

import java.io.IOException;
import java.io.Writer;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.user.dto.Famous;
import web.user.service.face.FamousService;
import web.util.Paging;

@Controller
@RequestMapping(value="/user/famous")
public class FamousController {
	
	//로깅 객체
	private static final Logger logger = LoggerFactory.getLogger(FamousController.class);
	
	@Autowired private FamousService famousService;
	
	@RequestMapping(value="/list",method = RequestMethod.GET)
	public void famousList(Paging paramData, Model model, HttpSession session) {
		logger.info("/famous/list");
		
		//페이징 계산
		Paging paging = famousService.getPaging( paramData );
		logger.info("{}", paging);
		
		//목록 조회
		List<Famous> list = famousService.getFamousList(paging);
		for(Famous f : list) {
			logger.info("{}", f);
		}
				
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		model.addAttribute("nick", session.getAttribute("nick"));
		
	} // 끝 목록 메소드
	
//	@RequestMapping(value="/insert")
//	public String insert(Famous famous, Model model, HttpSession session) {
//
//		famous.setUser_no( (Integer) session.getAttribute("userNo") ); //로그인 할 때 Session영역에 회원번호 저장 필요
//		famousService.insertComment(famous);
//		
//		return "redirect:/board/view?boardNo="+famous.getBoardNo();
//	}
//	
//	@RequestMapping(value="/delete")
//	public void delete(Famous famous, Writer writer, Model model) {
//		
//		boolean success = famousService.deleteComment(famous);
//		
//		try {
//			writer.append("{\"success\":"+success+"}");
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//	}

}
