package web.admin.dao.face;

import java.util.HashMap;
import java.util.List;

import web.user.dto.Ban;
import web.user.dto.UserTb;

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
	
	/**
	 * 페이징을 적용하여  제재멤버리스트 조회

	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 멤버 목록
	 */
	public List<HashMap<String, Object>> selectBanMemberList(HashMap<String, Object> map);
	/**
	 * 관리자 권한 삭제
	 * @param user
	 */
	public void delAdmin(UserTb user);

	/**
	 * 관리자 권한 부여
	 * @param user
	 */
	public void setAdmin(UserTb user);

	/**
	 * 회원 제재
	 * @param ban
	 */
	public void insertBan(Ban ban);

	/**
	 * 유저 상태 변경
	 * @param ban
	 */
	public void updateUser(Ban ban);

	/**
	 * 회원 제재 해제
	 * @param ban
	 */
	public void deleteBan(Ban ban);

	/**
	 * 유저상태 변경
	 * @param ban
	 */
	public void updateBanUser(Ban ban);


}
