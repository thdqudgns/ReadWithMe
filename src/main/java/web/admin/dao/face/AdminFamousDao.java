package web.admin.dao.face;

import java.util.HashMap;
import java.util.List;

import web.user.dto.Famous;
import web.user.dto.Famous_rec;
import web.util.Paging;

public interface AdminFamousDao {

	/**
	 * 전체 게시글 수를 조회한다
	 * 
	 * @return 총 게시글 수
	 */
	public int selectCntAll(Paging paramData);

	/**
	 * 페이징을 적용하여 게시글 목록 조회
	 * 
	 * 	paging.startNo, paging.endNo를 이용하여 rownum을 조회한다
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<HashMap<String, Object>> selectList(HashMap<String, Object> map);

	/**
	 * 게시글의 전체 추천 수 조회
	 * 
	 * @param recommend - 추천 수를 조회할 게시글 정보
	 * @return 전체 추천 수
	 */
	public int selectTotalCntRecommend(Famous_rec recommend);

	/**
	 * 글 삭제
	 * @param famous - 삭제하려는 글 정보
	 */
	public void deleteFamous(Famous famous);

	/**
	 * 글 수 구하기
	 * 
	 * @param famous - 작성된 글 번호
	 * @return 글 개수
	 */
	public int countFamous(Famous famous);

}
