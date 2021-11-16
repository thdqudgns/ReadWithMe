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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import web.user.dto.Famous;
import web.user.dto.Famous_rec;
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
	
	
	@RequestMapping(value="/insert")
	public String insert(Famous famous, Model model, HttpSession session) {

		famous.setUser_no( (Integer) session.getAttribute("user_no") ); //로그인 할 때 Session영역에 회원번호 저장 필요
		famousService.insertFamous(famous);
		
		return "redirect:/user/famous/list";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String updateProcess(Famous famous, MultipartFile file, HttpSession session) {
		logger.debug("글수정 : {}", file);
		
		//작성자 ID, NICK 추가 - 세션
//		board.setWriterId((String) session.getAttribute("id"));
//		board.setWriterNick((String) session.getAttribute("nick"));
//		
//		logger.info("글수정 : {}", famous);
//		
//		famousService.update(famous, file);
		
		return "redirect:/user/famous/list";
	}
	
	@RequestMapping(value="/delete")
	public void delete(Famous famous, Writer writer, Model model) {
		
		boolean success = famousService.deleteFamous(famous);
		
		try {
			writer.append("{\"success\":"+success+"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value = "/recommend")
	public ModelAndView recommend(Famous_rec recommend, ModelAndView mav, HttpSession session) {
		
		//추천 정보 토글
//		recommend.setUser_nick((String) session.getAttribute("user_nick"));
//		boolean result = famousService.recommend(recommend);
//		
//		//추천 수 조회
//		int cnt = famousService.getTotalCntRecommend(recommend);
//		
//		mav.addObject("result", result);
//		mav.addObject("cnt", cnt);
//		mav.setViewName("jsonView");
		
		return mav;
	}
	

}
