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

import web.user.dto.Review;
import web.user.dto.Review_file;
import web.user.dto.Review_rec;
import web.user.dto.Rpt_board;
import web.user.dto.Rv_cmt;
import web.user.service.face.ReviewService;
import web.util.Paging;

@Controller
@RequestMapping(value="/user/review")
public class ReviewController {
	
	//로깅 객체
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	@Autowired private ReviewService reviewService;
	
	//목록 조회
	@RequestMapping(value="/list")
	public void list(Paging paramData, Model model, HttpSession session, Review_rec recommend) {
		logger.info("/user/review/list");
		
		//페이징 계산
		Paging paging = reviewService.getPaging( paramData );
		logger.info("{}", paging);

		//목록 조회
		List<Review> reviewList = reviewService.getReviewList(paging);
		for(Review r : reviewList) {
			logger.info("{}", r);
		}
		
		//목록 값 전달
		model.addAttribute("paging", paging);
		model.addAttribute("reviewList", reviewList);
		
	} //목록 메소드
	
	//상세보기
	@SuppressWarnings("unlikely-arg-type")
	@RequestMapping(value="/view")
	public String view(Review viewReview, Model model, HttpSession session) {
		logger.info("/user/review/view 파라미터 {}", viewReview);
		
		if( viewReview.getReview_no() < 1 ) {
			return "redirect:/user/review/list";
		}
		
		viewReview = reviewService.view(viewReview);
		logger.info("/user/review/view 상세보기 {}", viewReview);
		
		
		//첨부파일 정보 전달
		Review_file reviewfile = reviewService.getAttachFile(viewReview);
		model.addAttribute("reviewfile", reviewfile);
		
		if( session.getAttribute("user_no") != null && !"".equals(session.getAttribute("user_no")) ) {

			//추천 상태 조회
			Review_rec recommend = new Review_rec();
			recommend.setReview_no(viewReview.getReview_no()); //게시글 번호
			recommend.setUser_no(Integer.parseInt((String)session.getAttribute("user_no"))); //회원 번호
			
			//추천 상태 전달
			boolean isRecommend = reviewService.isRecommend(recommend);
			model.addAttribute("isRecommend", isRecommend);
			model.addAttribute("cntRecommend", reviewService.getTotalCntRecommend(recommend));
		
		} else if( session == null || !"".equals(session)) {

			Review_rec recommend = new Review_rec();
			recommend.setReview_no(viewReview.getReview_no()); //게시글 번호
			
			//추천 상태 전달
			model.addAttribute("isRecommend", false);
			model.addAttribute("cntRecommend", reviewService.getTotalCntRecommend(recommend));
			
		}
		

		//댓글 리스트 전달
		List<Rv_cmt> commentList = reviewService.getCommentList(viewReview);
		model.addAttribute("commentList", commentList);
		
		//모델값 전달
		model.addAttribute("viewReview", viewReview);
		
		return "user/review/view";		
		
		
	}
	
	//글 작성 GET
	@RequestMapping(value="/write", method = RequestMethod.GET)
	public void write(Review review) {
		logger.info("/user/review/write [GET]");
		
	}

	//글 작성 POST
	@RequestMapping(value="/write", method = RequestMethod.POST)
	public String writeProc(Review review, MultipartFile file, HttpSession session) {
		logger.info("/user/review/write [POST]");
		
		logger.info("{}", review);
		logger.info("{}", file);
		
		review.setUser_no(Integer.parseInt((String) session.getAttribute("user_no")));
		review.setNick((String) session.getAttribute("user_nick"));
		logger.info("{}", review);
		
		reviewService.write(review, file);
		
		return "redirect:/user/review/list";		
	}
	
	//다운로드
	@RequestMapping(value="/download")
	public String download(int file_no, Model model) {
		logger.info("/user/review/download");
		
		Review_file file = reviewService.getFile(file_no);
		
		model.addAttribute("downFile", file);
		
		return "reviewDown";
	}
	
	//에러페이지
	@RequestMapping(value="/error")
	public void error() {}
	
	
	//수정 GET
	@RequestMapping(value="/update", method = RequestMethod.GET)
	public String update(Review review, Model model) {
		logger.info("/user/review/update [GET]");
		
		logger.info("boardno : {}", review.toString());
		
		// 게시글 번호가 1보다 작으면 목록으로 보내기
		if(review.getReview_no() < 1) {
			return "redirect:/user/review/list";
		}
		
		// 게시글 상세 정보 전달
		review = reviewService.view(review);
		logger.info("상세보기 : {}", review.toString());
		model.addAttribute("view", review);
		
		//게시글 첨부파일 전달
		Review_file reviewfile = reviewService.getAttachFile(review);
		model.addAttribute("reviewfile", reviewfile);
		
		return "user/review/update";		
	}

	//수정 POST
	@RequestMapping(value="/update", method = RequestMethod.POST)
	public String updateProc(Review review, MultipartFile file, HttpSession session) {
		logger.info("/user/review/update [POST]");
		
		logger.debug("글수정 : {}", file);
		
		//작성자 user_no, NICK 추가 - 세션
		review.setUser_no(Integer.parseInt((String) session.getAttribute("user_no")));
		review.setNick((String) session.getAttribute("user_nick"));
		
		logger.info("글수정 : {}", review);
		
		reviewService.update(review, file);
		
		return "redirect:/user/review/view?review_no="+review.getReview_no();		
	}
	
	//삭제
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete(Review review) {
		logger.info("/user/review/delete [GET]");
		
		reviewService.delete(review);
		
		return "redirect:/user/review/list";		
	}
	
	
	// 댓글, 추천, 신고 남음
	
	
	//추천
	@RequestMapping(value="/recommend")
	public ModelAndView recommend(Review_rec review_rec, ModelAndView mav, HttpSession session) {
		
		//추천 정보 토글
		review_rec.setUser_no(Integer.parseInt((String) session.getAttribute("user_no")));
		boolean result = reviewService.recommend(review_rec);
		
		//추천 수 조회
		int cnt = reviewService.getTotalCntRecommend(review_rec);
		
		mav.addObject("result", result);
		mav.addObject("cnt", cnt);
		mav.setViewName("jsonView");
		
		return mav;		
	}
	
	//신고
	@RequestMapping(value="/report")
	public void report(Rpt_board review, Writer writer, HttpSession session) {
		
		logger.info("/review/report");
		logger.info("review_no : {}", review);
		
		review.setUser_no(Integer.parseInt((String)session.getAttribute("user_no")));
		
		boolean success = reviewService.insertReportByReviewNo(review);
		
		try {
			writer.append("{\"success\":"+success+"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	//책 검색
	@RequestMapping(value="/book")
	public void book() {
//		return "user/review/book";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
