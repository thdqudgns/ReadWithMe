package web.user.dao.face;

import web.user.dto.UserTb;

public interface UserDao {

	public UserTb selectUserTbByUserNo(int user_no);
	
}
