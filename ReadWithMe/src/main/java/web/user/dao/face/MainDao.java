package web.user.dao.face;

import java.util.List;

import web.user.dto.Meeting;
import web.user.dto.Notice;
import web.user.dto.Review;

public interface MainDao {
	
	List<Meeting> selectMeetingList();
	List<Review> selectReviewList();
	List<Notice> selectNoticeList();

}
