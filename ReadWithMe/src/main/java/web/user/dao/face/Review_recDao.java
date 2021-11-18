package web.user.dao.face;

import web.user.dto.Review_rec;

public interface Review_recDao {

	/**
	 * 사용자가 해당 게시글을 추천한 적이 있는지 조회	
	 * 
	 * @param recommend - 사용자와 게시글 정보를 가지고 있는 객체
	 * @return 1 - 추천한 적 있음, 0 - 추천한 적 없음
	 */
	public int selectCntRecommend(Review_rec recommend);
	
	/**
	 * 게시글의 전체 추천 수 조회
	 * 
	 * @param recommend - 추천 수를 조회할 게시글 정보
	 * @return 전체 추천 수
	 */
	public int selectTotalCntRecommend(Review_rec recommend);
	
}
