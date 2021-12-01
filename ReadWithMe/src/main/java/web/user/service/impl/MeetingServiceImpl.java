package web.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.user.dao.face.MeetingDao;
import web.user.dao.face.UserDao;
import web.user.dto.Meeting;
import web.user.dto.UserTb;
import web.user.service.face.MeetingService;
import web.util.Paging;

@Service
public class MeetingServiceImpl implements MeetingService {
	
	@Autowired MeetingDao meetingDao;
	@Autowired UserDao userDao;

	@Override
	public List<Meeting> list(Paging paging) {
		return meetingDao.selectList(paging);
	}

	@Override
	public Paging getPaging(Paging paramData) {
		
		//총 게시글 수 조회
		int totalCount = meetingDao.selectCntAll();
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		
		return paging;
	}

	@Override
	public Meeting view(int no) {
		return meetingDao.selectMeetingByMeetingno(no);
	}

	@Override
	public void write(Meeting meeting, MultipartFile file) {

		//게시글 정보 처리
		if( "".equals(meeting.getMeeting_title()) ) {
			meeting.setMeeting_title("(제목없음)");
		}
		meetingDao.insert(meeting);
		
	}

	@Override
	public void delete(Meeting meeting) {
		meetingDao.delete(meeting);
		
	}

	@Override
	public UserTb getUser(int user_no) {
		return userDao.selectUserTbByUserNo(user_no);
	}
}
