package web.user.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.user.dao.face.ReviewDao;
import web.user.dao.face.Review_recDao;
import web.user.dto.Review;
import web.user.dto.Review_rec;
import web.user.service.face.ReviewService;
import web.util.Paging;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewService.class);
	
	@Autowired private ReviewDao reviewDao;
	@Autowired private Review_recDao review_recDao;

	@Override
	public Paging getPaging(Paging paramData) {
		logger.info("getPaging()");
		
		//총 게시글 수 조회
		int totalCount = reviewDao.selectCntAll(paramData);
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		
		return paging;
	}

	@Override
	public List<Review> getReviewList(Paging paging) {
		return reviewDao.selectList(paging);
	}

	@Override
	public boolean isRecommend(Review_rec recommend) {
		int cnt = review_recDao.selectCntRecommend(recommend);
		
		if(cnt > 0) { //추천했음
			return true;
			
		} else { //추천하지 않았음
			return false;
			
		}
	}

	@Override
	public int getTotalCntRecommend(Review_rec recommend) {
		return review_recDao.selectTotalCntRecommend(recommend);
	}

}
