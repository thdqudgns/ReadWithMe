package web.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.user.dao.face.MessageDao;
import web.user.dto.Message;
import web.user.service.face.MessageService;
import web.util.Paging;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired private MessageDao messageDao;
	
	@Override
	public List<Message> selectAllToMe(Paging paging) {
		return messageDao.selectAllToMeList(paging);
	}

	@Override
	public Paging getPaging(Paging paramData) {

		//총 쪽지 수 조회
		int totalCount = messageDao.selectCntAll(paramData);
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		
		return null;
	}

	@Override
	public Message view(Message viewMessage) {
		return messageDao.selectMessgaeByMsg_no(viewMessage);
	}

//	@Override
//	public void write(Message message) {
//		
//		//쪽지 정보 처리
//		if( "".equals(message.getMsg_title()) ) {
//			message.setMsg_title("(제목 없음)");
//		}
//		messageDao.insertMessage(message);	
//	}

	@Override
	public void delete(Message message) {
		messageDao.delete(message);
	}	

}
