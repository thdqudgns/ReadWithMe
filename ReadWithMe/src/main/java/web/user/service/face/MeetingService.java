package web.user.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import web.user.dto.Meeting;
import web.util.Paging;

public interface MeetingService {
	
	/**
	 * 페이징이 적용된 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Meeting> list(Paging paging);

	/**
	 * 게시글 목록을 위한 페이징 객체를 생성한다
	 * 
	 * 	파라미터 객체의 curPage(현재 페이지)
	 * 	DB에서 조회한 totalCount(총 게시글 수)
	 * 
	 * 	두 가지 데이터를 활용하여 페이징객체를 생성하여 반환한다
	 * 
	 * @param paramData - curPage를 저장하고있는 객체
	 * @return 계산이 완료된 Paging객체
	 */
	public Paging getPaging(Paging paramData);

	/**
	 * 모임 상세보기
	 * 
	 * @param viewMeeting - 상세 조회할 모임 번호 DTO
	 * @return 조회된 모임 정보
	 */
	public Meeting view(int no);
	
	/**
	 * 게시글 + 첨부파일을 처리한다
	 * 
	 * @param board - 게시글 정보 DTO
	 * @param file - 첨부파일 정보 DTO
	 */
	public void write(Meeting meeting, MultipartFile file);

//	/**
//	 * 게시글번호를 이용하여 업로드된 파일의 정보를 조회한다
//	 * 
//	 * @param viewMeeting - 조회할 게시글 번호를 가진 객체
//	 * @return 첨부파일 정보
//	 */
//	public FileTb getAttachFile(Meeting view);

//	/**
//	 * 파일번호를 이용하여 업로드된 파일의 정보를 조회한다
//	 * 
//	 * @param fileNo - 조회할 파일 번호
//	 * @return 첨부파일 정보
//	 */
//	public FileTb getFile(int file_no);
	
	/**
	 * 게시글 수정 처리
	 * 
	 * @param meeting - 삭제할 게시글의 게시글번호 객체
	 */
	public void delete(Meeting meeting);
	
}
