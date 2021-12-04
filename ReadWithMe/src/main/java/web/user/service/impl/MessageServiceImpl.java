package web.user.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.user.dao.face.MessageDao;
import web.user.dto.Message;
import web.user.service.face.MessageService;
import web.util.Paging;

@Service
public class MessageServiceImpl implements MessageService {

	private static final Logger logger = LoggerFactory.getLogger(MessageServiceImpl.class);
	
	@Autowired private MessageDao messageDao;
	
	@Override
	public List<Map<String, Object>> selectAllToMe(Paging paging, Integer rec_user) {
		Map<String, Object>params = new HashMap<>();
		params.put("paging", paging);
		params.put("rec_user", rec_user);
		
		return messageDao.selectAllToMeList(params);
	}

	@Override
	public List<Map<String, Object>> selectAllToOther(Paging paging, Integer rec_user) {
		Map<String, Object>params = new HashMap<>();
		params.put("paging", paging);
		params.put("rec_user", rec_user);
		
		return messageDao.selectAllToOtherList(params);
	}
	
	@Override
	public Paging getPaging(Paging paramData) {
		logger.info("getPaging()");

		//총 쪽지 수 조회
		int totalCount = messageDao.selectCntAll(paramData);
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		
		return paging;
	}

	@Override
	public Map<String, Object> view(Message viewMessage) {
		return messageDao.selectMessgaeByMsg_no(viewMessage);
	}
	
	@Override
	public Map<String, Object> viewSend(Message viewMessage) {
		return messageDao.selectMessgaeBySendMsg_no(viewMessage);
	}

	@Override
	public void write(Message message) {
		
		//쪽지 정보 처리
		if( "".equals(message.getMsg_title()) ) {
			message.setMsg_title("(제목 없음)");
		}
		messageDao.insertMessage(message);	
	}

	@Override
	public int selectUserByNick(String nick) {
		return messageDao.selectUserByNick(nick);
	}
	
	@Override
	public void delete(Message message) {
		messageDao.delete(message);
	}
	

}
