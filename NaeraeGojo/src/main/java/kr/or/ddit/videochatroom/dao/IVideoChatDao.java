package kr.or.ddit.videochatroom.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.VideoChatRoomVO;
import kr.or.ddit.vo.ChatListTempVO;

public interface IVideoChatDao {
	public String insertVideoChat(Map<String, String> params) throws SQLException;
	
	public void updateVideoChat(VideoChatRoomVO pv) throws SQLException;
	
	public void deleteVideoChat(Map<String, String> params) throws SQLException;
	
	public List<ChatListTempVO> getVideoChatList(Map<String, String> params) throws SQLException;
	
	public List<ChatListTempVO> getVideoChat(Map<String, String> params) throws SQLException;
	
	public int totalCount(Map<String, String> params) throws SQLException;

	public List<ProjectVO> getProjectList(Map<String, String> params) throws SQLException;

	public List<EmpVO> getEmpList(Map<String, String> params) throws SQLException;

	public void insertJoin(Map<String, String> params) throws SQLException;

	public ProjectVO getProjectNM(String video_chat_room_code) throws SQLException;

	public void updateUrl(Map<String, String> params) throws SQLException;
	
}
