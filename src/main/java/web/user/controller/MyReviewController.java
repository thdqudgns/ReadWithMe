package web.user.controller;

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

import web.user.dto.Review;
import web.user.dto.Review_file;
import web.user.dto.Review_rec;
import web.user.dto.Rv_cmt;
import web.user.service.face.MyReviewService;
import web.util.Paging;

@Controller
@RequestMapping(value="/user/mypage/myReview")
public class MyReviewController {
	
	private static final Logger logger = LoggerFactory.getLogger(MyReviewController.class);
	@Autowired private MyReviewService myReviewService;
	
	@RequestMapping(value="/list")
	public void list(Paging paramData, Model model) {
		logger.info("/myReview/list");
		
		//페이징 계산
		Paging paging = myReviewService.getPaging( paramData );
		logger.info("{}", paging);
		
		//게시글 목록 조회
		List<Review> list = myReviewService.getMyReviewList(paging);
		for(Review r : list) {
			logger.info("{}", r);
		}
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value="/view")
	public String view(Review viewReview, Model model, HttpSession session) {
		logger.info("/myReview/view 파라미터 {}", viewReview);
		
		if( viewReview.getReview_no() < 1 ) {
			return "redirect:/board/list";
		}
		
		viewReview = myReviewService.view(viewReview);
		logger.info("/board/view 상세보기 {}", viewReview);
		
		
		//첨부파일 정보 전달
		Review_file review_file = myReviewService.getAttachFile(viewReview);
		model.addAttribute("review_file", review_file);
		
		
		//추천 상태 조회
		Review_rec recommend = new Review_rec();
		recommend.setReview_no(viewReview.getReview_no()); //게시글 번호
		recommend.setUser_no(Integer.parseInt((String)session.getAttribute("user_no"))); //로그인한 아이디
		
		//추천 상태 전달
		boolean isRecommend = myReviewService.isRecommend(recommend);
		model.addAttribute("isRecommend", isRecommend);
		model.addAttribute("cntRecommend", myReviewService.getTotalCntRecommend(recommend));

		//댓글 리스트 전달
		List<Rv_cmt> commentList = myReviewService.getCommentList(viewReview);
		model.addAttribute("commentList", commentList);
		
		//모델값 전달
		model.addAttribute("viewBoard", viewReview);
		
		return "/user/mypage/myReview/view";
	}
	
	@RequestMapping(value="/download")
	public String download(int file_no, Model model) {
		logger.info("/user/review/download");
		
		Review_file file = myReviewService.getFile(file_no);
		
		model.addAttribute("downFile", file);
		
		return "reviewDown";
	}
	
	@RequestMapping(value="/error")
	public void error() {}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String update(Review review, Model model) {
		logger.info("review_no : {}", review.toString());
		
		// 게시글 번호가 1보다 작으면 목록으로 보내기
		if(review.getReview_no() < 1) {
			return "redirect:/user/mypage/myReview/list";
		}
		
		// 게시글 상세 정보 전달
		review = myReviewService.view(review);
		logger.info("상세보기 : {}", review.toString());
		model.addAttribute("view", review);
		
		//게시글 첨부파일 전달
		Review_file review_file = myReviewService.getAttachFile(review);
		model.addAttribute("review_file", review_file);
		
		return "/user/mypage/myReview/update";
	}

	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String updateProcess(Review review, MultipartFile file, HttpSession session) {
		logger.debug("글수정 : {}", file);
		
		//작성자 ID, NICK 추가 - 세션
		review.setUser_no((Integer) session.getAttribute("user_no"));
		review.setNick((String) session.getAttribute("nick"));
		
		logger.info("글수정 : {}", review);
		
		myReviewService.update(review, file);
		
		return "redirect:/user/mypage/myReview/view?review_no="+review.getReview_no();
	}

	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String deleteProcess(Review review) {
		myReviewService.delete(review);
		
		return "redirect:/user/mypage/myReview/list";
	}

	@RequestMapping(value = "/recommend")
	public ModelAndView recommend(Review_rec review_rec, ModelAndView mav, HttpSession session) {
		
		//추천 정보 토글
		review_rec.setUser_no((Integer) session.getAttribute("user_no"));
		boolean result = myReviewService.review_rec(review_rec);
		
		//추천 수 조회
		int cnt = myReviewService.getTotalCntReview_rec(review_rec);
		
		mav.addObject("result", result);
		mav.addObject("cnt", cnt);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
}
