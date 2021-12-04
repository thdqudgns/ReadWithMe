package web.user.service.face;

import java.util.List;

import web.user.dto.Meeting;
import web.user.dto.Notice;
import web.user.dto.Review;

public interface MainService {
	
	List<Meeting> getMeetingList();
	List<Review> getReviewList();
	List<Notice> getNoticeList();
	
}
