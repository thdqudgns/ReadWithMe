package web.user.controller;

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

import web.user.dto.Famous;
import web.user.dto.Famous_rec;
import web.user.dto.Rpt_board;
import web.user.service.face.FamousService;
import web.util.Paging;

@Controller
@RequestMapping(value="/user/famous")
public class FamousController {
	
	//로깅 객체
	private static final Logger logger = LoggerFactory.getLogger(FamousController.class);
	
	@Autowired private FamousService famousService;
	
	@RequestMapping(value="/list",method = RequestMethod.GET)
	public void famousList(Paging paramData, Model model, HttpSession session, Famous_rec recommend) {
		logger.info("/famous/list");
		
		//페이징 계산
		Paging paging = famousService.getPaging( paramData );
		logger.info("{}", paging);

		
		//목록 조회
//		if(session.getAttribute("user_no") == null) {
//			List<Famous> famousList = famousService.getFamousListO(paging);
//			for(Famous f : famousList) {
//				logger.info("{}", f);
//			}
//			model.addAttribute("famousList", famousList);
//		} else {
//			List<HashMap<String,Object>> famousList = famousService.getFamousList(paging);
//			for(HashMap f : famousList) {
//				logger.info("{}", f);
//			}
//			model.addAttribute("famousList", famousList);
//		}

		List<HashMap<String,Object>> famousList = famousService.getFamousList(paging);
		for(HashMap<String,Object> f : famousList) {
				logger.info("{}", f);
		}
		model.addAttribute("famousList", famousList);
		
//		//추천 상태 조회
//		recommend.setId((String)session.getAttribute("user_id")); //로그인한 id
//		recommend.setFamous_no(famousList.get(0).getFamous_no());	// 여기서 따로따로 저장해야 하는데, 어떻게 하는건가...
		
		//추천 상태 전달
		// 문제점: 각각의 famous_no에 따라 메소드를 실행시켜서 값을 저장하는 방법을 모르겠습니다...
//		boolean isRecommend = famousService.isRecommend(recommend);
//		int cntRecommend = famousService.getTotalCntRecommend(recommend); 
			
//		logger.info("추천상태 : {}, 총 추천된 수 : {}", isRecommend, cntRecommend);
		
//		model.addAttribute("isRecommend", isRecommend);		//추천을 한 상태면 true
//		model.addAttribute("cntRecommend", cntRecommend);		//총 추천 수 저장
			
		
		
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

		//추천 성공/실패 확인
		boolean success = famousService.recommend(recommend);
		logger.info("recommend id : {}", recommend);
		logger.info("result : {}", success);
		
		//추천 수 조회
		int cnt = famousService.getTotalCntRecommend(recommend);
		
		logger.info("cnt : {}", cnt);
		
		//값 전달
		mav.addObject("success", success);
		mav.addObject("cnt", cnt);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	//작성
	@RequestMapping(value="/insert")
	public String insert(Famous famous, Model model, HttpSession session) {
		logger.info("/famous/insert");
		famous.setUser_no(Integer.parseInt((String) session.getAttribute("user_no")));
		famous.setNick( (String) session.getAttribute("user_nick") );
//		famous.setId( (String)session.getAttribute("user_id") );
		logger.info("{}", famous);
		famousService.insertFamous(famous);
		
		return "redirect:/user/famous/list";
	}
	
	//수정
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public void updateProcess(Famous famous, Writer writer, HttpSession session) {
		logger.info("/famous/update");
		
		logger.info("famous : {}", famous);
		
		boolean success = famousService.updateFamous(famous);
		
		try {
			writer.append("{\"success\":"+success+"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//삭제
	@RequestMapping(value="/delete")
	public void delete(Famous famous, Writer writer) {
		logger.info("/famous/delete");
		boolean success = famousService.deleteFamous(famous);
		
		try {
			writer.append("{\"success\":"+success+"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	//신고
	@RequestMapping(value="/report")
	public void report(Rpt_board report, HttpSession session) {
		logger.info("/famous/report");
		logger.info("famous_no : {}", report);
		
	}
	

}
