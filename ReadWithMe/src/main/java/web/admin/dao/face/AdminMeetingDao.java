package web.admin.dao.face;

import java.util.HashMap;
import java.util.List;

import web.user.dto.Meeting;

public interface AdminMeetingDao {

	public int selectCntAll();

	/**
	 * 모임 리스트
	 * @param map
	 * @return
	 */
	public List<HashMap<String, Object>> selectMeetingList(HashMap<String, Object> map);

	/**
	 * 승인 처리
	 * @param meeting
	 */
	public void updateMeeting(Meeting meeting);

	/**
	 * 모임 삭제
	 * @param meeting
	 */
	public void deleteMeeting(Meeting meeting);

}
