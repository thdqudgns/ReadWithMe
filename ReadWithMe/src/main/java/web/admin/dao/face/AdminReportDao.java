package web.admin.dao.face;

import java.util.List;

import web.user.dto.Famous;
import web.user.dto.Review;
import web.user.dto.Rpt_board;
import web.util.Paging;

public interface AdminReportDao {

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
	public List<Rpt_board> selectList(Paging paging);

	/**
	 * 상세보기 - 글 번호 조회
	 * 
	 * @param viewRpt
	 * @return
	 */
	public Rpt_board getBoardNo(Rpt_board viewRpt);

	/**
	 * 상세보기 - 명언 정보 조회
	 * 
	 * @param famous_no - 명언글번호 매개변수
	 * @return
	 */
	public Famous getFamous(int famous_no);

	/**
	 * 상세보기 - 후기 정보 조회
	 * 
	 * @param review_no - 후기글번호 매개변수
	 * @return
	 */
	public Review getReview(int review_no);

	//==================================================
	
	/**
	 * 회원테이블의 user_lv변경
	 * @param user_no - 회원번호 매개변수
	 * @return
	 */
	public int changeUser_lv(int user_no);

	/**
	 * Rpt_board의 penalty값을 1로 수정
	 * @param user_no - 회원번호 매개변수
	 */
//	public void updatePenalty(int user_no);

	/**
	 * 명언 삭제 - 명언 테이블
	 * @param famous_no - 명언글번호
	 */
	public void deleteFamous(Famous famous_no);

	/**
	 * 삭제되었는지 확인 - 명언 테이블
	 * @param famous_no - 명언글번호
	 * @return
	 */
	public int countFamous(Famous famous_no);

	/**
	 * 후기 삭제 - 후기 테이블
	 * @param review_no - 후기글번호
	 */
	public void deleteReview(Review review_no);

	/**
	 * 삭제되었는지 확인 - 후기 테이블
	 * @param review_no - 후기글번호
	 * @return
	 */
	public int countReview(Review review_no);

	/**
	 * Rpt_board의 dele값을 1로 수정 - 신고 테이블
	 * @param famous_no - 명언글번호
	 */
	public void updateDeleF(Famous famous_no);

	/**
	 * Rpt_board의 dele값을 1로 수정 - 신고 테이블
	 * @param review_no - 후기글번호
	 */
	public void updateDeleR(Review review_no);

}
