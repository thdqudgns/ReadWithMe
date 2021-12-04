package web.user.service.face;

import java.util.List;
import java.util.Map;

import web.user.dto.Message;
import web.util.Paging;

public interface MessageService {

	/**
	 * 페이징이 적용된 쪽지 목록 조회 / 받는 쪽지함
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 쪽지 목록
	 */
	public List<Map<String, Object>> selectAllToMe(Paging paging, Integer rec_user);

	/**
	 * 보낸 쪽지함
	 * 
	 * @param paging
	 * @param rec_user
	 * @return
	 */
	public List<Map<String, Object>> selectAllToOther(Paging paging, Integer rec_user);
	
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
	 * 받은 쪽지 상세보기
	 * 
	 * @param viewMessage - 상세 조회할 쪽지 번호 DTO
	 * @return 조회된 상세 쪽지 정보
	 */
	public Map<String, Object> view(Message viewMessage);

	/**
	 * 보낸 쪽지 상세보기
	 * 
	 * @param viewMessage
	 * @return
	 */
	public Map<String, Object> viewSend(Message viewMessage);
	
	/**
	 * 쪽지 처리
	 * 
	 * @param message - 쪽지 정보 DTO
	 */
	public void write(Message message);
	
	/**
	 * 쪽지 삭제 처리
	 * 
	 * @param message - 삭제할 쪽지의 쪽지 번호 객체
	 */
	public void delete(Message message);

	public int selectUserByNick(String nick);


}
