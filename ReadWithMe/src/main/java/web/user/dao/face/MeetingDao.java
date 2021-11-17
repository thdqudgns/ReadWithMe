package web.user.dao.face;

import java.util.List;

import web.user.dto.Meeting;
import web.util.Paging;

public interface MeetingDao {
	
	/**
	 * 페이징을 적용하여 게시글 목록 조회
	 * 
	 * 	paging.startNo, paging.endNo를 이용하여 rownum을 조회한다
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */	
	public List<Meeting> selectList(Paging paging);

	/**
	 * 전체 게시글 수를 조회한다
	 * 
	 * @return 총 게시글 수
	 */	
	public int selectCntAll();

	/**
	 * 모임 번호를 이용하여 모임을 조회한다
	 * 
	 * @param viewMeeting - 조회하려는 모임의 글 번호 객체
	 * @return 조회된 모임 정보
	 */
	public Meeting selectMeetingByMeetingno(Meeting viewMeeting);

}
