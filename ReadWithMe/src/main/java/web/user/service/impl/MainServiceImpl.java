package web.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.user.dao.face.MainDao;
import web.user.dto.Meeting;
import web.user.dto.Notice;
import web.user.dto.Review;
import web.user.service.face.MainService;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private MainDao mainDao;
	
	@Override
	public List<Meeting> getMeetingList() {
		return mainDao.selectMeetingList();
	}

	@Override
	public List<Review> getReviewList() {
		return mainDao.selectReviewList();
	}

	@Override
	public List<Notice> getNoticeList() {
		return mainDao.selectNoticeList();
	}
	

}
