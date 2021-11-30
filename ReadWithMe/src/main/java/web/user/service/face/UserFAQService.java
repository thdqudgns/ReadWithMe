package web.user.service.face;

import java.util.List;

import web.user.dto.FAQ;
import web.util.Paging;

public interface UserFAQService {

	/**
	 * 페이징 처리
	 * 
	 * @param paramData - 페이징 객체
	 * @return
	 */
	public Paging getPaging(Paging paramData);

	/**
	 * 자주묻는질문 게시판 전체 조회
	 * 
	 * @param paging - 페이징 객체
	 * @return
	 */
	public List<FAQ> list(Paging paging);

	/**
	 * 자주묻는질문 상세보기 조회
	 * 
	 * @param faq - 게시글 번호를 지닌 자주묻는질문 DTO 객체
	 * @return
	 */
	public FAQ view(FAQ faq);

}
