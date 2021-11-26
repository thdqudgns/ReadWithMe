package web.user.dao.face;

import java.util.List;

import web.user.dto.Message;
import web.util.Paging;

public interface MessageDao {

	/**
	 * 페이징을 적용하여 쪽지 목록 조회
	 * 
	 * 	paging.startNo, paging.endNo를 이용하여 rownum을 조회한다
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 쪽지 목록
	 */
	public List<Message> selectAllToMeList(Paging paging);

	/**
	 * 전체 쪽지 수를 조회한다
	 * 
	 * @return 총 쪽지 수
	 */
	public int selectCntAll(Paging paging);

	/**
	 * 쪽지 번호를 이용하여 쪽지를 조회한다
	 * 
	 * @param viewMessage - 조회하려는 쪽지의 글 번호 객체
	 * @return 조회된 쪽지 정보
	 */
	public Message selectMessgaeByMsg_no(Message viewMessage);
	
	/**
	 * 쪽지 정보를 삽입한다
	 * 
	 * @param message - 삽입할 쪽지 정보
	 */
//	public void insertMessage(Message message);
	
	/**
	 * 쪽지 삭제
	 * 
	 * @param message - 삭제할 쪽지의 쪽지 번호 객체
	 */
	public void delete(Message message);



}
