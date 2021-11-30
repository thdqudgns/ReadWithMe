package web.user.dao.face;

import web.user.dto.Famous_rec;

public interface Famous_recDao {

	/**
	 * 사용자가 해당 게시글을 추천한 적이 있는지 조회	
	 * 
	 * @param recommend - 사용자와 게시글 정보를 가지고 있는 객체
	 * @return 1 - 추천한 적 있음, 0 - 추천한 적 없음
	 */
	public int selectCntRecommend(Famous_rec recommend);

	/**
	 * 추천상태 지우기
	 * 
	 * @param recommend - 추천 정보 객체
	 */
	public void deleteRecommend(Famous_rec recommend);

	/**
	 * 추천상태 넣기
	 * 
	 * @param recommend - 추천 정보 객체
	 */
	public void insertRecommend(Famous_rec recommend);

	/**
	 * 게시글의 전체 추천 수 조회
	 * 
	 * @param recommend - 추천 수를 조회할 게시글 정보
	 * @return 전체 추천 수
	 */
	public int selectTotalCntRecommend(Famous_rec recommend);

	

}
