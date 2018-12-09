package kr.or.ddit.videochatroom.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ChatListTempVO;
import kr.or.ddit.vo.ChatPwVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.ProjectWorkClassVO;
import kr.or.ddit.vo.VideoChatRoomVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IVideoChatDaoImpl implements IVideoChatDao{
	@Autowired
	private SqlMapClient client;

	@Override
	public String insertVideoChat(Map<String, String> params) throws SQLException {
		return (String) client.insert("videoRoom.insertVideoChat", params);
	}

	@Override
	public void updateVideoChat(VideoChatRoomVO pv) throws SQLException {
		client.update("videoRoom.updateVideoChat", pv);
	}

	@Override
	public void deleteVideoChat(Map<String, String> params) throws SQLException {
		client.update("videoRoom.deleteVideoChat", params);
	}

	@Override
	public List<ChatListTempVO> getVideoChatList(Map<String, String> params)
			throws SQLException {
		return client.queryForList("videoRoom.getVideoChatList", params);
	}

	@Override
	public List<ChatListTempVO> getVideoChat(Map<String, String> params)
			throws SQLException {
		return client.queryForList("videoRoom.getVideoInfo", params);
	}

	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		return (int) client.queryForObject("videoRoom.totalCount", params);
	}

	@Override
	public List<ProjectVO> getProjectList(Map<String, String> params)
			throws SQLException {
		return client.queryForList("videoRoom.getProjectList", params);
	}

	@Override
	public List<EmpVO> getEmpList(Map<String, String> params)
			throws SQLException {
		return client.queryForList("videoRoom.getEmpList", params);
	}

	@Override
	public void insertJoin(Map<String, String> params) throws SQLException {
		client.insert("videoRoom.insertJoin", params);
	}

	@Override
	public ProjectVO getProjectNM(String video_chat_room_code) throws SQLException {
		return (ProjectVO) client.queryForObject("videoRoom.getProjectNM", video_chat_room_code);
	}

	@Override
	public void updateUrl(Map<String, String> params) throws SQLException {
		client.update("videoRoom.updateUrl", params);
	}

	@Override
	public void ChatRoomEnd(Map<String, String> params) throws SQLException {
		client.update("videoRoom.ChatRoomEnd", params);
	}

	@Override
	public List<ChatListTempVO> getChatStep3(Map<String, String> params)throws SQLException {
		return client.queryForList("videoRoom.getChatStep3", params);
	}

	@Override
	public List<ProjectWorkClassVO> getPwcList(Map<String, String> params)
			throws SQLException {
		return client.queryForList("videoRoom.getPwcList", params);
	}

	@Override
	public List<ProjectWorkClassVO> getPWList(Map<String, String> params)
			throws SQLException {
		return client.queryForList("videoRoom.getPWList", params);
	}

	@Override
	public String insertChatPw(ChatPwVO cpv) throws SQLException {
		return (String) client.insert("videoRoom.insertChatPw", cpv);
	}

	@Override
	public List<ChatPwVO> getchatPwLsit()
			throws SQLException {
		return client.queryForList("videoRoom.getchatPwLsit");
	}

}
