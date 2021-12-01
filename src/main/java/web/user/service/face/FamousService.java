package web.user.service.face;

import java.util.HashMap;
import java.util.List;

import web.user.dto.Famous;
import web.user.dto.Famous_rec;
import web.util.Paging;

public interface FamousService {
	
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
//	public List<Famous> getFamousListO(Paging paging);
	
	public List<HashMap<String, Object>> getFamousList(Paging paging);

	/**
	 * 새로운 글을 삽입한다
	 * @param famous - 입력된 글 정보
	 */
	public void insertFamous(Famous famous);

	/**
	 * 글을 삭제한다
	 * @param famous - 삭제하려는 글의 정보
	 * @return 삭제 성공 여부
	 */
	public boolean deleteFamous(Famous famous);

	/**
	 * 추천 상태확인
	 * 
	 * @param recommend - 추천 상태를 확인할 게시글과 정보 
	 * @return true - 추천한 상태, false - 추천하지 않은 상태
	 */
	public boolean isRecommend(Famous_rec recommend);
	
	/**
	 * 추천 상태를 확인하고 추천을 토글(넣고빼기) 작업
	 * 
	 * @param recommend - 추천 대상 정보
	 * @return true - 추천함, false - 추천 취소함
	 */
	public boolean recommend(Famous_rec recommend);

	/**
	 * 총 추천 수를 구한다
	 * 
	 * @param recommend - 추천수를 파악할 게시글 정보
	 * @return 총 추천 수
	 */
	public int getTotalCntRecommend(Famous_rec recommend);

	/**
	 * 사용자 번호로 id 조회하기
	 * 
	 * @param famous - 사용자 번호
	 * @return 사용자 id 반환
	 */
//	public String getIdByUserNo(Famous famous);

	/**
	 * 글 수정 메소드
	 * @param famous - 글 정보가 담긴 객체
	 */
	public boolean updateFamous(Famous famous);

	/**
	 * 사용자 번호로 id 조회하기
	 * 
	 * @param famous - 사용자 번호
	 * @return 사용자 id 반환
	 */
//	public String getIdByUserNo(int user_no);



	

}
