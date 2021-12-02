package web.admin.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.admin.dao.face.AdminReportCommentDao;
import web.admin.service.face.AdminReportCommentService;
import web.user.dto.Rpt_cmt;
import web.user.dto.Rv_cmt;
import web.util.Paging;

@Service
public class AdminReportCommentServiceImpl implements AdminReportCommentService {
	
	//로깅
	private static final Logger logger = LoggerFactory.getLogger(AdminReportCommentService.class);
		
	//DAO
	@Autowired private AdminReportCommentDao adminReportCommentDao;

	//페이징
	@Override
	public Paging getPaging(Paging paramData) {
		logger.info("getPaging()");
		
		//총 게시글 수 조회
		int totalCount = adminReportCommentDao.selectCntAll(paramData);
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		
		return paging;
	}

	//댓글목록
	@Override
	public List<Rpt_cmt> getRptCmtList(Paging paging) {
		return adminReportCommentDao.selectList(paging);
	}

	//상세보기 - 신고번호로 댓글번호 가져오기
	@Override
	public Rpt_cmt getCommentNo(Rpt_cmt viewRptCmt) {
		return adminReportCommentDao.getCommentNo(viewRptCmt);
	}

	//상세보기 - 댓글번호로 정보 가져오기
	@Override
	public Rv_cmt getComment(int comment_no) {
		return adminReportCommentDao.getComment(comment_no);
	}

	//회원 제재
	@Override
	public void penalty(int user_no) {
		adminReportCommentDao.changeUser_lv(user_no);
	}

	//댓글 삭제
	@Override
	public void deleteComment(Rv_cmt comment_no) {
		//댓글 삭제 - 후기댓글테이블
		adminReportCommentDao.deleteComment(comment_no);
		
		//삭제되었는지 확인 - 후기댓글테이블
		if(adminReportCommentDao.countComment(comment_no) == 0) {
			//삭제되었으면 Rpt_cmt의 dele값을 1로 수정 - 신고댓글 테이블
			adminReportCommentDao.updateDeleC(comment_no);
		}
	}

}
