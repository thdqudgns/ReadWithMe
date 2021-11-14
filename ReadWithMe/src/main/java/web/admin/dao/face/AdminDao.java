package web.admin.dao.face;

import java.util.List;

import web.user.dto.UserTb;
import web.util.Paging;

public interface AdminDao {


	public int selectCntAll();

	public List<UserTb> selectAll(Paging paging);

	public int setAdmin(int parseInt);

	public int delAdmin(int parseInt);

}
