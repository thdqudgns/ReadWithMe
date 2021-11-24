package web.admin.dao.face;

import java.util.HashMap;
import java.util.List;

public interface AdminMemberDao {

	/**
	 * 전체 멤버 수 조회
	 * @return
	 */
	public int selectCntAll();
	
	/**
	 * 페이징을 적용하여  멤버리스트 조회

	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 멤버 목록
	 */
	public List<HashMap<String, Object>> selectMemberList(HashMap<String, Object> map);

}
