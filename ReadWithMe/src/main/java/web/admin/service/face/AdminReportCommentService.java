package web.admin.service.face;

import java.util.List;

import web.user.dto.Rpt_cmt;
import web.user.dto.Rv_cmt;
import web.util.Paging;

public interface AdminReportCommentService {

	/**
	 * 댓글 목록을 위한 페이징 객체를 생성한다
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
	 * 페이징이 적용된 댓글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Rpt_cmt> getRptCmtList(Paging paging);

	//상세보기 메소드
	/**
	 * 신고댓글번호로 댓글번호 조회하기
	 * 
	 * @param viewRptCmt - 신고댓글번호가 담겨있는 객체
	 * @return
	 */
	public Rpt_cmt getCommentNo(Rpt_cmt viewRptCmt);

	/**
	 * 댓글번호로 댓글정보 조회
	 * 
	 * @param comment_no -댓글 번호
	 * @return
	 */
	public Rv_cmt getComment(int comment_no);

	/**
	 * 회원번호를 매개로 user_lv 낮추기
	 * 
	 * @param user_no - 회원번호
	 */
	public void penalty(int user_no);

	/**
	 * 댓글번호를 매개로 댓글 삭제하기
	 * 
	 * @param comment - 댓글번호
	 */
	public void deleteComment(Rv_cmt comment_no);

}
