package web.user.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import web.user.dto.Message;
import web.user.service.face.MessageService;
import web.util.Paging;

@Controller
@RequestMapping(value="/user/mypage")
public class MessageController {

	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	@Autowired private MessageService messageService;
	
	//받은 쪽지함
	@RequestMapping(value="/message")
	public String message(Paging paramData, Model model, @SessionAttribute(value = "user_no")Integer rec_user) {
		logger.info("/message");
		
		//페이징 계산
		Paging paging = messageService.getPaging( paramData );
		logger.info("{}", paging);
		
		//받은 쪽지 목록 조회
		List<Map<String, Object>> list = messageService.selectAllToMe(paging, rec_user);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		
		return "user/mypage/message/message";
	}
	
	//보낸 쪽지함
	@RequestMapping(value="/message/send")
	public String messageSend(Paging paramData, Model model, @SessionAttribute(value = "user_no")Integer rec_user) {
		logger.info("/message");
		
		//페이징 계산
		Paging paging = messageService.getPaging( paramData );
		logger.info("{}", paging);
		
		//받은 쪽지 목록 조회
		List<Map<String, Object>> list = messageService.selectAllToOther(paging, rec_user);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		
		return "user/mypage/message/messageSend";
	}

	//받은 쪽지 상세보기
	@RequestMapping(value="/message/view")
	public String messageView(Message viewMessage, Model model) {
		logger.info("/message/view 파라미터 {}", viewMessage);
		
		if( viewMessage.getMsg_no() < 1 ) {
			return "redirect:/user/mypage/message";
		}
	
		Map<String, Object> viewMap = messageService.view(viewMessage);
		logger.info("/message/view 상세보기 {}", viewMap);
		
		//모델값 전달
		model.addAttribute("viewMessage", viewMap);
		
		return "user/mypage/message/view";
	}
	
	//보낸 쪽지 상세보기
	@RequestMapping(value="/message/send/view")
	public String messageSendView(Message viewMessage, Model model) {
		logger.info("/message/view 파라미터 {}", viewMessage);
		
		if( viewMessage.getMsg_no() < 1 ) {
			return "redirect:/user/mypage/message/send";
		}
	
		Map<String, Object> viewMap = messageService.viewSend(viewMessage);
		logger.info("/message/view 상세보기 {}", viewMap);
		
		//모델값 전달
		model.addAttribute("viewMessage", viewMap);
		
		return "user/mypage/message/sendView";
	}
	
	@RequestMapping(value="/message/write", method = RequestMethod.GET)
	public void write() {
		logger.info("/message/write");
		
	}
	
	//쪽지 보내기
	@RequestMapping(value="/message/write", method = RequestMethod.POST)
	public String writeProc(Message message, HttpSession session, String nick) {
		logger.info("/message/write [post]");
		
		
		int rec_user = messageService.selectUserByNick(nick);
		message.setRec_user(rec_user);
		
		logger.info(nick);
		
		int user_no = Integer.parseInt(String.valueOf(session.getAttribute("user_no")));
		message.setSend_user(user_no);
		
		logger.info("{}", message);
		
		messageService.write(message);	

		return "redirect:/user/mypage/message";
	}
	
	
	
	@RequestMapping(value="/message/unread")
	public void messageUnread() {
		logger.info("/message/unread");
	}
	
	@RequestMapping(value="/message/keep")
	public void messageKeep() {
		logger.info("/message/keep");
	}

	@RequestMapping(value="/message/delete", method=RequestMethod.GET)
	public String messageDelete(Message message) {
		messageService.delete(message);
		
		return "redirect:/user/mypage/message";
	}
}