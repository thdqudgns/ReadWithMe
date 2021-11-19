package web.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import web.user.dto.Review;
import web.user.dto.Review_rec;
import web.user.service.face.ReviewService;
import web.util.Paging;

@Controller
@RequestMapping(value="/user/review")
public class ReviewController {
	
	//로깅 객체
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	@Autowired private ReviewService reviewService;
	
	@RequestMapping(value="/list")
	public void reviewList(Paging paramData, Model model, HttpSession session, Review_rec recommend) {
		
		logger.info("/review/list");
		
		//페이징 계산
		Paging paging = reviewService.getPaging( paramData );
		logger.info("{}", paging);

		
		//목록 조회
		List<Review> reviewList = reviewService.getReviewList(paging);
		for(Review r : reviewList) {
			logger.info("{}", r);
		}
		
		//추천 상태 조회
			
//		recommend.setId((String)session.getAttribute("user_id")); //로그인한 id
//		
//		//추천 상태 전달
//		// 문제점: 각각의 famous_no에 따라 메소드를 실행시켜서 값을 저장하는 방법을 모르겠습니다...
//		boolean isRecommend = reviewService.isRecommend(recommend);
//		int cntRecommend = reviewService.getTotalCntRecommend(recommend); 
//			
//		logger.info("추천상태 : {}, 총 추천된 수 : {}", isRecommend, cntRecommend);
//		
//		model.addAttribute("isRecommend", isRecommend);		//추천을 한 상태면 true
//		model.addAttribute("cntRecommend", cntRecommend);		//총 추천 수 저장
			
		
		
		//목록 값 전달
		model.addAttribute("paging", paging);
		model.addAttribute("reviewList", reviewList);
		
		//nick
		model.addAttribute("user_nick", session.getAttribute("user_nick"));
		
	} // 끝 목록 메소드
	

}
