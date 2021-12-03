package web.admin.service.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import web.util.Paging;

public interface AdminMeetingService {

	public Paging getPaging(Paging paramData);

	/**
	 * 페이징 처리한 모임 목록
	 * @param paging
	 * @param req
	 * @return
	 */
	public List<HashMap<String, Object>> getMeetingList(Paging paging, HttpServletRequest req);

	/**
	 * 미팅 승인
	 * @param req
	 */
	public void approvalMeeting(HttpServletRequest req);

	/**
	 * 미팅 삭제
	 * 
	 * @param req
	 */
	public void deleteMeeting(HttpServletRequest req);


}
