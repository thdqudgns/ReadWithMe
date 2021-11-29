package web.admin.service.face;

import java.util.HashMap;
import java.util.List;

import web.user.dto.Famous;
import web.user.dto.Famous_rec;
import web.util.Paging;

public interface AdminFamousService {

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
	public List<HashMap<String, Object>> getFamousList(Paging paging);

	/**
	 * 총 추천 수를 구한다
	 * 
	 * @param recommend - 추천수를 파악할 게시글 정보
	 * @return 총 추천 수
	 */
	public int getTotalCntRecommend(Famous_rec recommend);

	/**
	 * 글을 삭제한다
	 * @param famous - 삭제하려는 글의 정보
	 * @return 삭제 성공 여부
	 */
	public boolean deleteFamous(Famous famous);

}
