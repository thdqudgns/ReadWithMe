package web.admin.controller;

import java.io.IOException;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import web.admin.service.face.AdminFamousService;
import web.user.dto.Famous;
import web.user.dto.Famous_rec;
import web.util.Paging;


@Controller
@RequestMapping(value="/admin/famous")
public class AdminFamousController {
	
	// 로그 객체
	private static final Logger logger = LoggerFactory.getLogger(AdminFamousController.class);
		
	// 서비스 객체
	@Autowired private AdminFamousService adminFamousService;
	
	@RequestMapping(value="/list",method = RequestMethod.GET)
	public void famousList(Paging paramData, Model model, HttpSession session, Famous_rec recommend) {
		logger.info("/famous/list");
		
		//페이징 계산
		Paging paging = adminFamousService.getPaging( paramData );
		logger.info("{}", paging);

		List<HashMap<String,Object>> famousList = adminFamousService.getFamousList(paging);
		for(HashMap<String,Object> f : famousList) {
				logger.info("{}", f);
		}
		model.addAttribute("famousList", famousList);
		
		//목록 값 전달
		model.addAttribute("paging", paging);
		
		//nick
		model.addAttribute("user_nick", session.getAttribute("user_nick"));
		
	} // 끝 목록 메소드
	
	//추천
	@RequestMapping(value = "/recommend")
	public ModelAndView recommend(Famous_rec recommend, ModelAndView mav, HttpSession session) {
		logger.info("/famous/recommend");
		
		//추천 정보 토글
		recommend.setUser_no(Integer.parseInt((String) session.getAttribute("user_no")));

		//추천 수 조회
		int cnt = adminFamousService.getTotalCntRecommend(recommend);
		
		logger.info("cnt : {}", cnt);
		
		//값 전달
		mav.addObject("cnt", cnt);
		mav.setViewName("jsonView");
		
		return mav;
	}	
	
	
	//삭제
	@RequestMapping(value="/delete")
	public void delete(Famous famous, Writer writer) {
		logger.info("/famous/delete");
		boolean success = adminFamousService.deleteFamous(famous);
		
		try {
			writer.append("{\"success\":"+success+"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
