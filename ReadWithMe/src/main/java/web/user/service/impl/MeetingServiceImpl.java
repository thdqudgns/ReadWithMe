package web.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.user.dao.face.MeetingDao;
import web.user.dto.Meeting;
import web.user.service.face.MeetingService;
import web.util.Paging;

@Service
public class MeetingServiceImpl implements MeetingService {
	
	@Autowired MeetingDao meetingDao;

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
	public Meeting view(Meeting viewMeeting) {
		return meetingDao.selectMeetingByMeetingno(viewMeeting);
	}
}
