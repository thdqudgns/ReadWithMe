package web.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.user.dto.Message;
import web.user.service.face.MessageService;
import web.util.Paging;

@Controller
@RequestMapping(value="/user/mypage")
public class MessageController {

	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	@Autowired private MessageService messageService;
	
	@RequestMapping(value="/message")
	public String message(Paging paramData, Model model) {
		logger.info("/message");
		
		//페이징 계산
		Paging paging = messageService.getPaging( paramData );
		logger.info("{}", paging);
		
		//받은 쪽지 목록 조회
		List<Message> list = messageService.selectAllToMe(paging);
		for(Message M : list) {
			logger.info("{}", M);
		}
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		
		return "user/mypage/message/message";
	}

	@RequestMapping(value="/message/view")
	public String messageView(Message viewMessage, Model model, HttpSession session) {
		logger.info("/message/view 파라미터 {}", viewMessage);
		
		if( viewMessage.getMsg_no() < 1 ) {
			return "redirect:/user/mypage/message";
		}
		
		viewMessage = messageService.view(viewMessage);
		logger.info("/message/view 상세보기 {}", viewMessage);
		
		//모델값 전달
		model.addAttribute("viewMessage", viewMessage);
		
		return "user/mypage/message/View";
	}
	
	@RequestMapping(value="/message/write", method = RequestMethod.GET)
	public void write() {}
	
	@RequestMapping(value="/message/write", method = RequestMethod.POST)
	public String writeProc(Message message, HttpSession session) {
		logger.info("{}", message);
		
//		message.setRec_user((Integer) session.getAttribute("id"));
//		message.setSend_user((Integer) session.getAttribute("id"));
//		message.setMsg_title((String) session.getAttribute("msg_title"));
//		message.setMsg_content((String) session.getAttribute("msg_content"));
//		logger.info("{}", message);
//		
//		messageService.write(message);

		return "user/mypage/message/Write";
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