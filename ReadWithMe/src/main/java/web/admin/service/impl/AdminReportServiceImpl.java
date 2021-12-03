package web.admin.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.admin.dao.face.AdminReportDao;
import web.admin.service.face.AdminReportService;
import web.user.dto.Famous;
import web.user.dto.Review;
import web.user.dto.Rpt_board;
import web.util.Paging;

@Service
public class AdminReportServiceImpl implements AdminReportService {
	
	//로깅
	private static final Logger logger = LoggerFactory.getLogger(AdminReportService.class);
	
	//DAO
	@Autowired private AdminReportDao adminReportDao;

	//페이징
	@Override
	public Paging getPaging(Paging paramData) {
		logger.info("getPaging()");
		
		//총 게시글 수 조회
		int totalCount = adminReportDao.selectCntAll(paramData);
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		
		return paging;
	}
	
	//목록
	@Override
	public List<Rpt_board> getRptList(Paging paging) {
		return adminReportDao.selectList(paging);
	}

	//상세보기 - 글 번호 조회
	@Override
	public Rpt_board getBoardNo(Rpt_board viewRpt) {
		return adminReportDao.getBoardNo(viewRpt);
	}

	//상세보기 - 명언 정보 조회
	@Override
	public Famous getFamous(int famous_no) {
		return adminReportDao.getFamous(famous_no);
	}

	//상세보기 - 후기 정보 조회
	@Override
	public Review getReview(int review_no) {
		return adminReportDao.getReview(review_no);
	}

	//회원 제재
	@Override
	public void penalty(int user_no) {
		adminReportDao.changeUser_lv(user_no);
	}

	//명언 삭제
	@Override
	public void deleteFamous(Famous famous_no) {
		//명언삭제 - 명언 테이블
		adminReportDao.deleteFamous(famous_no);
		
		//삭제되었는지 확인 - 명언 테이블
		if(adminReportDao.countFamous(famous_no) == 0) {
			//삭제되었으면 Rpt_board의 dele값을 1로 수정 - 신고 테이블
			adminReportDao.updateDeleF(famous_no);
		}
	}
	
	//후기 삭제
	@Override
	public void deleteReview(Review review_no) {
		//후기 삭제 - 후기테이블
		adminReportDao.deleteReview(review_no);
		
		//삭제되었는지 확인 - 후기테이블
		if(adminReportDao.countReview(review_no) == 0) {
			//삭제되었으면 Rpt_board의 dele값을 1로 수정 - 신고 테이블
			adminReportDao.updateDeleR(review_no);
		}
	}


}
