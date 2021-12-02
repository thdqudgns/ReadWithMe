package web.admin.service.face;

import java.util.List;

import web.user.dto.Famous;
import web.user.dto.Review;
import web.user.dto.Rpt_board;
import web.util.Paging;

public interface AdminReportService {

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
	public List<Rpt_board> getRptList(Paging paging);

	//상세보기 메소드
	/**
	 * 신고 번호로 글 번호 조회하기 - 명언, 후기
	 * 
	 * @param viewRpt - 신고글번호가 담겨있는 객체
	 * @return
	 */
	public Rpt_board getBoardNo(Rpt_board viewRpt);

	/**
	 * 명언글번호로 명언 정보 조회
	 * 
	 * @param famous_no - 명언 글 번호
	 * @return
	 */
	public Famous getFamous(int famous_no);

	/**
	 * 후기글번호로 후기 정보 조회
	 * 
	 * @param review_no -후기 글 번호
	 * @return
	 */
	public Review getReview(int review_no);

	/**
	 * 회원번호를 매개로 user_lv 낮추기
	 * 
	 * @param user_no - 회원번호
	 */
	public void penalty(int user_no);

	/**
	 * 명언글번호를 매개로 글 삭제하기
	 * 
	 * @param famous_no - 명언글번호
	 */
	public void deleteFamous(Famous famous_no);

	/**
	 * 후기글번호를 매개로 글 삭제하기
	 * 
	 * @param review_no - 후기글번호
	 */
	public void deleteReview(Review review_no);


}
