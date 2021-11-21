package web.user.service.face;

import java.util.List;

import web.user.dto.Review;
import web.user.dto.Review_rec;
import web.util.Paging;

public interface ReviewService {
	
	/**
	 * 게시글 목록을 위한 페이징 객체를 생성한다
	 * 
	 * 	파라미터 객체의 curPage(현재 페이지)
	 * 	DB에서 조회한 totalCount(총 게시글 수)
	 * 
	 * 	두 가지 데이터를 활용하여 페이징객체를 생성하여 반환한다
	 * 
	 * @param paramData - curPage를 저장하고있는 객체
	 * @return 계산이 완료된 Paging객체
	 */
	public Paging getPaging(Paging paramData);

	/**
	 * 페이징이 적용된 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Review> getReviewList(Paging paging);


	public boolean isRecommend(Review_rec recommend);
	
	/**
	 * 추천 상태를 확인하고 추천을 토글(넣고빼기) 작업
	 * 
	 * @param recommend - 추천 대상 정보
	 * @return true - 추천함, false - 추천 취소함
	 */
//	public boolean recommend(Review_rec recommend);

	/**
	 * 총 추천 수를 구한다
	 * 
	 * @param recommend - 추천수를 파악할 게시글 정보
	 * @return 총 추천 수
	 */
	public int getTotalCntRecommend(Review_rec recommend);

	/**
	 * 글 수정 메소드
	 * @param review - 글 정보가 담긴 객체
	 */
//	public boolean updateReview(Review review);

}
