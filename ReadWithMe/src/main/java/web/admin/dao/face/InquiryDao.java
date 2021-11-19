package web.admin.dao.face;

import java.util.List;

import web.user.dto.Inquiry;
import web.util.Paging;

public interface InquiryDao {

	/**
	 * 총 게시글 수 조회
	 * 
	 * @param paramData - 페이징 객체
	 * @return
	 */
	public int selectCntAll(Paging paramData);

	/**
	 * 1:1 질문 전체 조회
	 * 
	 * @param paging - 페이징 객체
	 * @return
	 */
	public List<Inquiry> selectAll(Paging paging);

	/**
	 * 1:1 질문을 게시글 번호로 조회하기
	 * 
	 * @param inquiry - 게시글 번호를 가진 객체
	 * @return
	 */
	public Inquiry selectInquiryByBoardno(Inquiry inquiry);

	
}
