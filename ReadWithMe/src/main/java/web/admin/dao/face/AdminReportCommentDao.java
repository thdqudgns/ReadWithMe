package web.admin.dao.face;

import java.util.List;

import web.user.dto.Rpt_cmt;
import web.user.dto.Rv_cmt;
import web.util.Paging;

public interface AdminReportCommentDao {

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
	public List<Rpt_cmt> selectList(Paging paging);

	/**
	 * 상세보기 - 댓글 번호 조회
	 * 
	 * @param viewRptCmt
	 * @return
	 */
	public Rpt_cmt getCommentNo(Rpt_cmt viewRptCmt);

	/**
	 * 상세보기 - 댓글 정보 조회
	 * 
	 * @param comment_no - 댓글번호 매개변수
	 * @return
	 */
	public Rv_cmt getComment(int comment_no);

	/**
	 * 회원테이블의 user_lv변경
	 * @param user_no - 회원번호 매개변수
	 * @return
	 */
	public void changeUser_lv(int user_no);

	/**
	 * 댓글 삭제 - 댓글 테이블
	 * @param comment_no - 댓글번호
	 */
	public void deleteComment(Rv_cmt comment_no);

	/**
	 * 삭제되었는지 확인 - 댓글 테이블
	 * @param comment_no - 댓글번호
	 * @return
	 */
	public int countComment(Rv_cmt comment_no);

	/**
	 * Rpt_cmt의 dele값을 1로 수정 - 신고댓글 테이블
	 * @param comment_no - 댓글번호
	 */
	public void updateDeleC(Rv_cmt comment_no);
	
	/**
	 * 밴 테이블에 정보 추가
	 * 
	 * @param user_no - 회원번호
	 */
	public void insertBan(int user_no);

}
