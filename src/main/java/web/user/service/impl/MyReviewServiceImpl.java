package web.user.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.user.dao.face.MyReviewDao;
import web.user.dao.face.Review_recDao;
import web.user.dto.Review;
import web.user.dto.Review_file;
import web.user.dto.Review_rec;
import web.user.dto.Rv_cmt;
import web.user.service.face.MyReviewService;
import web.util.Paging;

@Service
public class MyReviewServiceImpl implements MyReviewService{
	
	private static final Logger logger = LoggerFactory.getLogger(MyReviewServiceImpl.class);
	
	@Autowired private MyReviewDao myReviewDao;
	@Autowired private Review_recDao review_recDao; //추천
	@Autowired private ServletContext context;

	//list
	
	@Override
	public List<Review> getMyReviewList(Paging paging) {
		
		return myReviewDao.selectList(paging);
	}

	@Override
	public Paging getPaging(Paging paramData) {
		logger.info("getPaging()");
		
		//총 게시글 수 조회
		int totalCount = myReviewDao.selectCntAll(paramData);
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		
		return paging;
	}
	
	//---------------------------------------------------------

	//view
	
	@Override
	public Review view(Review viewReview) {
		myReviewDao.hit(viewReview);
		return myReviewDao.selectReviewByReviewNo(viewReview);
	}

	@Override
	public Review_file getAttachFile(Review viewReview) {
		return myReviewDao.selectReviewfileByReviewNo(viewReview);
	}

	@Override
	public boolean isRecommend(Review_rec recommend) {
		int cnt = review_recDao.selectCntRecommend(recommend);
		
		if(cnt == 1) { //추천했음
			return true;
		} 
		else { //추천하지 않았음
			return false;	
		}
	}

	@Override
	public Object getTotalCntRecommend(Review_rec recommend) {
		return review_recDao.selectTotalCntRecommend(recommend);
	}

	@Override
	public List<Rv_cmt> getCommentList(Review viewReview) {
//		return reviewCommentDao.selectComment(viewReview);
		return null;
	}
	
	//---------------------------------------------------------

	//download
	
	@Override
	public Review_file getFile(int file_no) {
		return myReviewDao.selectReviewfileByFileno(file_no);
	}
	
	//---------------------------------------------------------


	@Override
	public void update(Review review, MultipartFile file) {
		if( "".equals(review.getReview_title()) ) {
			review.setReview_title("(제목없음)");
		}
		myReviewDao.update(review);

		//----------------------------------------

		if( file.getSize() <= 0 ) {
			return;
		}
	
		//파일이 저장될 경로(real path)
		String storedPath = context.getRealPath("upload");
		
		//폴더가 존재하지 않으면 생성하기
		File stored = new File(storedPath);
		if( !stored.exists() ) {
			stored.mkdir();
		}
		
		//원본파일이름 알아내기
		String originName = file.getOriginalFilename();
		
		//원본파일이름에 UUID추가하기 (파일명이 중복되지않도록 설정)
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		//저장될 파일 정보 객체
		File dest = new File( stored, storedName );
		
		try {
			//업로드된 파일을 저장하기
			file.transferTo(dest);
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//----------------------------------------
		
		Review_file reviewfile = new Review_file();
		reviewfile.setReview_no(review.getReview_no());
		reviewfile.setOrigin_name(originName);
		reviewfile.setStored_name(storedName);
		
		myReviewDao.deleteFile(review);
		myReviewDao.insertFile(reviewfile);
		
	}

	@Override
	public void delete(Review review) {
		myReviewDao.deleteFile(review);
		myReviewDao.delete(review);	
	}
	
	//---------------------------------------------------------

	//recommend
	
	@Override
	public boolean review_rec(Review_rec review_rec) {
		if( isRecommend(review_rec) ) { //추천한 상태
			review_recDao.deleteRecommend(review_rec);
			
			return false;
			
		} else { //추천하지 않은 상태
			review_recDao.insertRecommend(review_rec);
			
			return true;
		}
	}

	@Override
	public int getTotalCntReview_rec(Review_rec review_rec) {
		return review_recDao.selectTotalCntRecommend(review_rec);
	}


}
