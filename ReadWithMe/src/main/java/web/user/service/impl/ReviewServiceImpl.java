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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import web.user.dao.face.ReviewCommentDao;
import web.user.dao.face.ReviewDao;
import web.user.dao.face.Review_recDao;
import web.user.dto.Review;
import web.user.dto.Review_file;
import web.user.dto.Review_rec;
import web.user.dto.Rv_cmt;
import web.user.service.face.ReviewService;
import web.util.Paging;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewService.class);
	
	@Autowired private ReviewDao reviewDao;
	@Autowired private ServletContext context;
	@Autowired private Review_recDao review_recDao;
	@Autowired private ReviewCommentDao reviewCommentDao;

	//목록 관련 메소드 4개
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
		
		if(cnt == 1) { //추천했음
			return true;
		} 
		else { //추천하지 않았음
			return false;
			
		}
	}

	@Override
	public int getTotalCntRecommend(Review_rec recommend) {
		return review_recDao.selectTotalCntRecommend(recommend);
	}

	//======================================================================
	
	// 글 상세보기
	@Override
	public Review view(Review viewReview) {
		reviewDao.hit(viewReview);
		return reviewDao.selectReviewByReviewNo(viewReview);
	}

//	@Override
//	public Review_file getFileNo(Review viewReview) {
//		return reviewDao.getFileNo(viewReview);
//	}
	
	@Override
	public Review_file getAttachFile(Review viewReview) {
		return reviewDao.selectReviewfileByReviewNo(viewReview);
	}

	@Override
	public List<Rv_cmt> getCommentList(Review viewReview) {
		return reviewCommentDao.selectComment(viewReview);
	}

	//======================================================================

	//글 작성
	@Override
	@Transactional
	public void write(Review review, MultipartFile file) {
		
		//글 제목, 글 내용, 파일만을 받아온 상황이다.
		//회원 번호와 닉네임도 controller에서 저장했다.
		
		//게시글 정보 처리
		
		if( "".equals(review.getReview_title()) ) {
			review.setReview_title("(제목없음)");
		}
		reviewDao.insertReview(review);
		review.setReview_no(reviewDao.lastReviewNo());
		
		//--------------------------------------------------------
		
		//빈 파일
		if( file.getSize() <= 0 ) {
			return;
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
	
		File storedFolder = new File(storedPath);
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		//저장될 파일의 이름 생성하기
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		//저장할 파일 객체
		File dest = new File(storedPath, storedName);
		
		try {
			file.transferTo(dest); //업로드 파일 저장
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		//--------------------------------------------------------
		
		Review_file reviewfile = new Review_file();
		logger.info("후기 글 번호 : {}" , review.getReview_no());
		reviewfile.setReview_no( review.getReview_no() );
		reviewfile.setOrigin_name(originName);
		reviewfile.setStored_name(storedName);
		
		reviewDao.insertFile(reviewfile);
		
	}
	
	//======================================================================

	//파일 다운로드
	@Override
	public Review_file getFile(int file_no) {
		return reviewDao.selectReviewfileByFileno(file_no);
	}

	//======================================================================
	
	//글 수정
	@Override
	public void update(Review review, MultipartFile file) {
		if( "".equals(review.getReview_title()) ) {
			review.setReview_title("(제목없음)");
		}
		reviewDao.update(review);

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
		
		reviewDao.deleteFile(review);
		reviewDao.insertFile(reviewfile);
	}
	
	//======================================================================

	//글 삭제
	@Override
	public void delete(Review review) {
		reviewDao.deleteFile(review);
		reviewDao.delete(review);
	}
	
	//======================================================================

	//글 추천
	@Override
	public boolean recommend(Review_rec review_rec) {
		if( isRecommend(review_rec) ) { //추천한 상태
			review_recDao.deleteRecommend(review_rec);
			
			return false;
			
		} else { //추천하지 않은 상태
			review_recDao.insertRecommend(review_rec);
			
			return true;
		}
	}

	//======================================================================

	//댓글 추가 닉네임도 같이 저장해야 한다.
	@Override
	public void insertComment(Rv_cmt comment) {
		reviewCommentDao.insertComment(comment);
	}

	//댓글 삭제
	@Override
	public boolean deleteComment(Rv_cmt comment) {
		reviewCommentDao.deleteComment(comment); 
		
		if( reviewCommentDao.countComment(comment) > 0 ) {
			return false;
		} else {
			return true;
		}
	}

	//댓글 수정
	@Override
	public boolean updateReviewComment(Rv_cmt comment) {
		int res = reviewCommentDao.updateReviewComment(comment);
		
		if( res  > 0 ) {
			return true;
		} else {
			return false;
		}
	}



	//======================================================================
	
	
}
