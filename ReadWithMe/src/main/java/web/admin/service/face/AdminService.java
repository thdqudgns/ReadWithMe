package web.admin.service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import web.user.dto.UserTb;
import web.util.Paging;

public interface AdminService {

	public Paging getPaging(Paging paramData);

	public List<UserTb> list(Paging paging);

	public void getUserNo(HttpServletRequest req, HttpSession session);

}
