package web.admin.service.face;

import java.util.List;

import web.user.dto.Inquiry;
import web.util.Paging;

public interface InquiryService {

	/**
	 * 페이징 처리
	 * 
	 * @param paramData - 페이징 객체
	 * @return
	 */
	public Paging getPaging(Paging paramData);

	/**
	 * 1:1 질문 전체 조회
	 * 
	 * @param paging - 페이징 객체
	 * @return 
	 */
	public List<Inquiry> list(Paging paging);

	/**
	 * 1:1 질문 상세보기
	 * 
	 * @param inquiry - 게시글 번호를 가지고 있는 객체
	 * @return
	 */
	public Inquiry view(Inquiry inquiry);

}
