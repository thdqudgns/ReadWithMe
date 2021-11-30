package web.user.dao.face;

import java.util.HashMap;
import java.util.List;

import web.user.dto.Famous;
import web.user.dto.Famous_rec;
import web.util.Paging;

public interface FamousDao {

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
//	public List<Famous> selectListO(Paging paging);
	public List<HashMap<String, Object>> selectList(HashMap<String, Object> map);

	/**
	 * 신규 글 삽입
	 * @param famous - 삽입하려는 글 정보
	 */
	public void insertFamous(Famous famous);

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

	/**
	 * 사용자 번호로 id 조회하기
	 * 
	 * @param famous - 사용자 번호
	 * @return 사용자 id 반환
	 */
//	public String getIdByUserNo(Famous famous);

	/**
	 * 글 수정
	 * @param famous - 글 번호 매개변수
	 */
	public int updateFamous(Famous famous);

	/**
	 * 사용자 번호로 id 조회하기
	 * 
	 * @param user_no - 사용자 번호
	 * @return 사용자 id 반환
	 */
//	public String getIdByUserNo2(int user_no);


}
