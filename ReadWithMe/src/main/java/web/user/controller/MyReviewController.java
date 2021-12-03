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
import org.springframework.web.bind.annotation.SessionAttribute;
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
	
	//목록 조회
	@RequestMapping(value="/list")
	public void list(Paging paramData, Model model, @SessionAttribute(value = "user_no")Integer userNo) {
		
		logger.info("/user/mypage/myReview/list");
		
		//페이징 계산
		Paging paging = myReviewService.getPaging( paramData );
		logger.info("{}", paging);

		//목록 조회
		List<Review> reviewList = myReviewService.getReviewList(paging, userNo);
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
			return "redirect:/user/mypage/myReview/list";
		}
		
		viewReview = myReviewService.view(viewReview);
		logger.info("/user/mypage/myReview/view 상세보기 {}", viewReview);
		
		
		//첨부파일 정보 전달
		Review_file reviewfile = myReviewService.getAttachFile(viewReview);
		model.addAttribute("reviewfile", reviewfile);
		
		if( session.getAttribute("user_no") != null && !"".equals(session.getAttribute("user_no")) ) {

			//추천 상태 조회
			Review_rec recommend = new Review_rec();
			recommend.setReview_no(viewReview.getReview_no()); //게시글 번호
			recommend.setUser_no(Integer.parseInt((String)session.getAttribute("user_no"))); //회원 번호
			
			//추천 상태 전달
			boolean isRecommend = myReviewService.isRecommend(recommend);
			model.addAttribute("isRecommend", isRecommend);
			model.addAttribute("cntRecommend", myReviewService.getTotalCntRecommend(recommend));
		
		} else if( session == null || !"".equals(session)) {

			Review_rec recommend = new Review_rec();
			recommend.setReview_no(viewReview.getReview_no()); //게시글 번호
			
			//추천 상태 전달
			model.addAttribute("isRecommend", false);
			model.addAttribute("cntRecommend", myReviewService.getTotalCntRecommend(recommend));
			
		}
		

		//댓글 리스트 전달
		List<Rv_cmt> commentList = myReviewService.getCommentList(viewReview);
		model.addAttribute("commentList", commentList);
		
		//모델값 전달
		model.addAttribute("viewReview", viewReview);
		
		return "/user/mypage/myReview/view";		
		
		
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
		
		myReviewService.write(review, file);
		
		return "redirect:/user/review/list";		
	}
	
	//다운로드
	@RequestMapping(value="/download")
	public String download(int file_no, Model model) {
		logger.info("/user/review/download");
		
		Review_file file = myReviewService.getFile(file_no);
		
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
		review = myReviewService.view(review);
		logger.info("상세보기 : {}", review.toString());
		model.addAttribute("view", review);
		
		//게시글 첨부파일 전달
		Review_file reviewfile = myReviewService.getAttachFile(review);
		model.addAttribute("reviewfile", reviewfile);
		
		return "/user/mypage/myReview/update";		
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
		
		myReviewService.update(review, file);
		
		return "redirect:/user/mypage/myReview/view?review_no="+review.getReview_no();		
	}
	
	//삭제
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete(Review review) {
		logger.info("/user/review/delete [GET]");
		
		myReviewService.delete(review);
		
		return "redirect:/user/mypage/myReview/list";		
	}
	
	
	// 댓글, 추천, 신고 남음
	
	
	//추천
	@RequestMapping(value="/recommend")
	public ModelAndView recommend(Review_rec review_rec, ModelAndView mav, HttpSession session) {
		
		//추천 정보 토글
		review_rec.setUser_no(Integer.parseInt((String) session.getAttribute("user_no")));
		boolean result = myReviewService.recommend(review_rec);
		
		//추천 수 조회
		int cnt = myReviewService.getTotalCntRecommend(review_rec);
		
		mav.addObject("result", result);
		mav.addObject("cnt", cnt);
		mav.setViewName("jsonView");
		
		return mav;		
	}
	
	//신고
	@RequestMapping(value="/report")
	public void report(Review review) {
		
	}

	//책 검색
	@RequestMapping(value="/book")
	public void book() {
//		return "user/review/book";
	}
}
