package web.user.service.impl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.user.dao.face.MeetingDao;
import web.user.dao.face.UserDao;
import web.user.dto.Meeting;
import web.user.dto.Participation;
import web.user.dto.UserTb;
import web.user.service.face.MeetingService;
import web.util.Paging;

@Service
public class MeetingServiceImpl implements MeetingService {
	
	private static final Logger logger = LoggerFactory.getLogger(MeetingService.class);
	
	@Autowired MeetingDao meetingDao;
	@Autowired UserDao userDao;

	@Override
	public List<HashMap<String, Object>> list(Paging paging, HttpServletRequest req) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("paging", paging);
		
		map.put("searchType", "" );
		logger.info("req.getParameter(\"searchType\")111111 {}", req.getParameter("searchType"));
		
		if( req.getParameter("searchType") != "" && req.getParameter("searchType") != null ) {
			logger.info("req.getParameter(\"searchType\") {}", req.getParameter("searchType"));
			map.put("searchType", req.getParameter("searchType") );
		}
		
		map.put("searchWord", "" );
		if( req.getParameter("searchWord") != "" && req.getParameter("searchWord") != null ) {
			logger.info("req.getParameter(\"searchWord\") {}", req.getParameter("searchWord"));
			map.put("searchWord", req.getParameter("searchWord") );
		}
		
		
		
		if( req.getParameterValues("area_no") != null ) {
			logger.info("req.getParameterValues(\"area_no\") {}", req.getParameterValues("area_no"));
			String [] areas = req.getParameterValues("area_no");
			List<String> list = Arrays.asList(areas);
			logger.info("배열 {}", list);
			map.put("area_no", list );
			
		}
		
		if( req.getParameterValues("meetingtype_no") != null ) {
			logger.info("req.getParameterValues(\"meetingtype_no\") {}", req.getParameterValues("meetingtype_no"));
			String [] areas = req.getParameterValues("meetingtype_no");
			List<String> list = Arrays.asList(areas);
			logger.info("배열 {}", list);
			map.put("meetingtype_no", list );
		}
		
		if( req.getParameterValues("book_class_no") != null ) {
			logger.info("req.getParameterValues(\"book_class_no\") {}", req.getParameterValues("book_class_no"));
			String [] areas = req.getParameterValues("book_class_no");
			List<String> list = Arrays.asList(areas);
			logger.info("배열 {}", list);
			map.put("book_class_no", list );
		}
		
		logger.info("확인 {}", map);
		
		
		return meetingDao.selectList(map);
	}
	
	@Override
	public List<Meeting> endlist(Paging paging) {
		return meetingDao.selectEndList(paging);
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

	@Override
	public void apply(Participation participation) {
		meetingDao.insertParticipation(participation);
	}

	@Override
	public Participation getParticipation(int user_no, int meeting_no) {
		HashMap<String, Integer> user_meeting_no = new HashMap<String, Integer>();
		user_meeting_no.put("user_no", user_no);
		user_meeting_no.put("meeting_no", meeting_no);
		return meetingDao.selectParticipation(user_meeting_no);
	}

	@Override
	public void deleteApply(Participation participation) {
		meetingDao.deleteParticipation(participation);
	}
}
