package web.user.dao.face;

import web.user.dto.Participation;
import web.user.dto.UserTb;

public interface UserDao {

	public UserTb selectUserTbByUserNo(int user_no);

	public Participation selectParticipationByUserNo(int user_no);
	
}
