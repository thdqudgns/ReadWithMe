package web.admin.dao.face;

import java.util.List;

import web.user.dto.Member;
import web.util.Paging;

public interface AdminDao {


	public int selectCntAll();

	public List<Member> selectAll(Paging paging);

	public int setAdmin(int parseInt);

	public int delAdmin(int parseInt);

}
