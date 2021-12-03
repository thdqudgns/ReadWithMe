package web.admin.controller;

import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.admin.service.face.AdminReportCommentService;
import web.admin.service.face.AdminReportService;
import web.user.dto.Famous;
import web.user.dto.Review;
import web.user.dto.Rpt_board;
import web.user.dto.Rpt_cmt;
import web.user.dto.Rv_cmt;
import web.util.Paging;

@Controller
@RequestMapping(value="/admin/report")
public class AdminReportController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminReportController.class);
	@Autowired private AdminReportService adminReportService;
	@Autowired private AdminReportCommentService adminReportCommentService;
	
	//목록 조회
	@RequestMapping(value="/list")
	public void list(Paging paramData, Model model) {
		logger.info("/admin/report/list");
		
		//페이징 계산
		Paging paging = adminReportService.getPaging( paramData );
		logger.info("{}", paging);

		//목록 조회
		List<Rpt_board> rptList = adminReportService.getRptList(paging);
		for(Rpt_board r : rptList) {
			logger.info("{}", r);
		}
		
		//목록 값 전달
		model.addAttribute("paging", paging);
		model.addAttribute("rptList", rptList);
		
	} //목록 메소드
	
	//상세보기
	@SuppressWarnings("unlikely-arg-type")
	@RequestMapping(value="/view")
	public String view(Rpt_board viewRpt, Model model) {
		
		logger.info("/admin/report/view 신고글 번호 {}", viewRpt);
		
		if( viewRpt.getReport_no() < 1 ) {
			return "redirect:/admin/report/list";
		}
		
		//신고 번호로 글 번호 조회하기 - 명언, 후기
		viewRpt = adminReportService.getBoardNo(viewRpt);
		
		//조회된 명언, 후기 글 번호로 글 정보 불러오기
		if(viewRpt.getFamous_no() > 0) {
			Famous famous = adminReportService.getFamous(viewRpt.getFamous_no());

			logger.info("/admin/report/view 상세보기 {}", famous);
			
			//모델값 전달
			model.addAttribute("famous", famous);
		}
		
		if(viewRpt.getReview_no() > 0) {
			Review review = adminReportService.getReview(viewRpt.getReview_no());
			
			logger.info("/admin/report/view 상세보기 {}", review);

			//모델값 전달
			model.addAttribute("review", review);
		}
		
//		return "admin/report/view?report_no=" + viewRpt.getReport_no();		
		return "admin/report/view";		
		
	}
	
	//신고내역에서 회원 제재
	@RequestMapping(value="/penalty")
	public String penalty(int user_no) {
		logger.info("/admin/report/penalty");
		
		adminReportService.penalty(user_no);
		
		return "admin/report/penalty";		
	}

	//신고내역에서 명언 글 삭제
	@RequestMapping(value="/famous/delete")
	public String deleteFamous(Famous famous_no) {
		logger.info("/admin/report/famous/delete");
		
		adminReportService.deleteFamous(famous_no);
		
		return "admin/report/delete";		
	}

	//신고내역에서 후기 글 삭제
	@RequestMapping(value="/review/delete")
	public String deleteReview(Review review_no) {
		logger.info("/admin/report/review/delete");
		
		adminReportService.deleteReview(review_no);
		
		return "admin/report/delete";		
	}
	
	//===============================================================================
	
	//신고된 후기 댓글 목록 조회
	@RequestMapping(value="/comment/list")
	public void commentList(Paging paramData, Model model) {
		logger.info("/admin/report/comment/list");
			
		//페이징 계산
		Paging paging = adminReportCommentService.getPaging( paramData );
		logger.info("{}", paging);

		//목록 조회
		List<Rpt_cmt> rptCmtList = adminReportCommentService.getRptCmtList(paging);
		for(Rpt_cmt r : rptCmtList) {
			logger.info("{}", r);
		}
			
		//목록 값 전달
		model.addAttribute("paging", paging);
		model.addAttribute("rptCmtList", rptCmtList);
		
	} //목록 메소드
		
		
	//신고된 후기 댓글 상세보기
	@SuppressWarnings("unlikely-arg-type")
	@RequestMapping(value="/comment/view")
	public String commentView(Rpt_cmt viewRptCmt, Model model) {
		
		logger.info("/admin/report/comment/view 신고 댓글 번호 {}", viewRptCmt);
			
		if( viewRptCmt.getReport_no() < 1 ) {
			return "redirect:/admin/report/comment/list";
		}
			
		//신고번호(report_no)로 댓글번호(comment_no) 조회하기
		viewRptCmt = adminReportCommentService.getCommentNo(viewRptCmt);
			
		//조회된 후기 댓글 번호로 댓글 정보 불러오기
		if(viewRptCmt.getComment_no() > 0) {
			Rv_cmt comment = adminReportCommentService.getComment(viewRptCmt.getComment_no());
			
			logger.info("/admin/report/comment/view 상세보기 {}", comment);

			//모델값 전달
			model.addAttribute("comment", comment);
		}
			
			return "admin/report/comment/view";		
			
		}
	
	//신고내역에서 회원 제재
	@RequestMapping(value="/comment/penalty")
	public String penaltyComment(int user_no) {
		logger.info("/admin/report/comment/penalty");
		
		adminReportCommentService.penalty(user_no);
		
		return "admin/report/comment/penalty";		
	}
	
		
	//신고내역에서 후기 댓글 삭제
	@RequestMapping(value="/comment/delete")
	public String deleteReviewComment(Rv_cmt comment_no) {
		logger.info("/admin/report/comment/delete");
			
		adminReportCommentService.deleteComment(comment_no);
			
		return "admin/report/comment/delete";		
	}
	

}
