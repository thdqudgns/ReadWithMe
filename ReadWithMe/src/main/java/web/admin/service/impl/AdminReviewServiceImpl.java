package web.admin.service.impl;

import java.util.List;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.admin.dao.face.AdminReviewDao;
import web.admin.service.face.AdminReviewService;
import web.user.dao.face.ReviewCommentDao;
import web.user.dao.face.ReviewDao;
import web.user.dao.face.Review_recDao;
import web.user.dto.Review;
import web.user.dto.Review_file;
import web.user.dto.Review_rec;
import web.user.dto.Rv_cmt;
import web.util.Paging;

@Service
public class AdminReviewServiceImpl implements AdminReviewService {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminReviewService.class);
	
	@Autowired private AdminReviewDao adminReviewDao;
	@Autowired private ServletContext context;

	//페이징
	@Override
	public Paging getPaging(Paging paramData) {
		logger.info("getPaging()");
		
		//총 게시글 수 조회
		int totalCount = adminReviewDao.selectCntAll(paramData);
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		
		return paging;
	}

	//목록
	@Override
	public List<Review> getReviewList(Paging paging) {
		return adminReviewDao.selectList(paging);
	}

	//상세보기
	@Override
	public Review view(Review viewReview) {
		return adminReviewDao.selectReviewByReviewNo(viewReview);
	}

	//상세보기 - 파일
	@Override
	public Review_file getAttachFile(Review viewReview) {
		return adminReviewDao.selectReviewfileByReviewNo(viewReview);
	}

	//추천 수
	@Override
	public int getTotalCntRecommend(Review_rec recommend) {
		return adminReviewDao.selectTotalCntRecommend(recommend);
	}

	//상세보기 - 댓글
	@Override
	public List<Rv_cmt> getCommentList(Review viewReview) {
		return adminReviewDao.selectComment(viewReview);
	}

	//파일 다운로드
	@Override
	public Review_file getFile(int file_no) {
		return adminReviewDao.selectReviewfileByFileno(file_no);
	}

	//글 삭제
	@Override
	public void delete(Review review) {
		adminReviewDao.deleteFile(review);
		adminReviewDao.delete(review);
	}

	//댓글 삭제
	@Override
	public boolean deleteComment(Rv_cmt comment) {
		adminReviewDao.deleteComment(comment); 
		
		if( adminReviewDao.countComment(comment) > 0 ) {
			return false;
		} else {
			return true;
		}
	}

}
