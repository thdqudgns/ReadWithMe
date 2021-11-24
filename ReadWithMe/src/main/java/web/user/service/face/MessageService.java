package web.user.service.face;

import java.util.List;

import web.user.dto.Message;
import web.util.Paging;

public interface MessageService {

	/**
	 * 페이징이 적용된 쪽지 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 쪽지 목록
	 */
	public List<Message> selectAllToMe(Paging paging);

	/**
	 * 페이징을 적용하여 쪽지 목록 조회
	 * 
	 * 	paging.startNo, paging.endNo를 이용하여 rownum을 조회한다
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public Paging getPaging(Paging paramData);

	/**
	 * 쪽지 상세보기
	 * 
	 * @param viewMessage - 상세 조회할 쪽지 번호 DTO
	 * @return 조회된 상세 쪽지 정보
	 */
	public Message view(Message viewMessage);

	/**
	 * 쪽지 처리
	 * 
	 * @param message - 쪽지 정보 DTO
	 */
//	public void write(Message message);
	
	/**
	 * 쪽지 삭제 처리
	 * 
	 * @param message - 삭제할 쪽지의 쪽지 번호 객체
	 */
	public void delete(Message message);


}
