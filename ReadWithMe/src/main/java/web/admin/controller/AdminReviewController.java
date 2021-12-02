package web.admin.controller;

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
import org.springframework.web.servlet.ModelAndView;

import web.admin.service.face.AdminReviewService;
import web.user.dto.Review;
import web.user.dto.Review_file;
import web.user.dto.Review_rec;
import web.user.dto.Rv_cmt;
import web.util.Paging;


@Controller
@RequestMapping(value="/admin/review")
public class AdminReviewController {
	
	// 로그 객체
	private static final Logger logger = LoggerFactory.getLogger(AdminReviewController.class);
		
	// 서비스 객체
	@Autowired private AdminReviewService adminReviewService;
	
	//목록 조회
	@RequestMapping(value="/list")
	public void list(Paging paramData, Model model) {
		logger.info("/admin/review/list");
		
		//페이징 계산
		Paging paging = adminReviewService.getPaging( paramData );
		logger.info("{}", paging);

		//목록 조회
		List<Review> reviewList = adminReviewService.getReviewList(paging);
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
		logger.info("/admin/review/view 파라미터 {}", viewReview);
		
		if( viewReview.getReview_no() < 1 ) {
			return "redirect:/admin/review/list";
		}
		
		viewReview = adminReviewService.view(viewReview);
		logger.info("/admin/review/view 상세보기 {}", viewReview);
		
		
		//첨부파일 정보 전달
		Review_file reviewfile = adminReviewService.getAttachFile(viewReview);
		model.addAttribute("reviewfile", reviewfile);
		
		//추천 상태 조회
		Review_rec recommend = new Review_rec();
		recommend.setReview_no(viewReview.getReview_no()); //게시글 번호
		recommend.setUser_no(Integer.parseInt((String)session.getAttribute("user_no"))); //회원 번호
			
		//추천 상태 전달
		model.addAttribute("cntRecommend", adminReviewService.getTotalCntRecommend(recommend));
		
		//댓글 리스트 전달
		List<Rv_cmt> commentList = adminReviewService.getCommentList(viewReview);
		model.addAttribute("commentList", commentList);
		
		//모델값 전달
		model.addAttribute("viewReview", viewReview);
		
		return "admin/review/view";		

	}
	
	//추천
	@RequestMapping(value="/recommend")
	public ModelAndView recommend(Review_rec review_rec, ModelAndView mav, HttpSession session) {
		
		//추천 정보 토글
		review_rec.setUser_no(Integer.parseInt((String) session.getAttribute("user_no")));
		
		//추천 수 조회
		int cnt = adminReviewService.getTotalCntRecommend(review_rec);
		
		mav.addObject("cnt", cnt);
		mav.setViewName("jsonView");
		
		return mav;		
	}
	
	//다운로드
	@RequestMapping(value="/download")
	public String download(int file_no, Model model) {
		logger.info("/admin/review/download");
		
		Review_file file = adminReviewService.getFile(file_no);
		
		model.addAttribute("downFile", file);
		
		return "reviewDown";
	}
	
	//에러페이지
	@RequestMapping(value="/error")
	public void error() {}
	
	//삭제
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete(Review review) {
		logger.info("/admin/review/delete [GET]");
		
		adminReviewService.delete(review);
		
		return "redirect:/admin/review/list";		
	}
	
	//----------------------------------------
	
	@RequestMapping(value="/comment/delete")
	public void delete(Rv_cmt comment, Writer writer, Model model) {
		
		boolean success = adminReviewService.deleteComment(comment);
		
		try {
			writer.append("{\"success\":"+success+"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
