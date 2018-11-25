package kr.or.ddit.meeting.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.or.ddit.vo.MeetingVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.TempMeetingVO;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IMeetingDaoImpl implements IMeetingDao{

	@Resource
	private SqlMapClient client;
	
	@Override
	public List<TempMeetingVO> meetingInfo(Map<String, String> params)
			throws SQLException {
		return client.queryForList("meeting.meetingInfo", params);
	}

	@Override
	public List<TempMeetingVO> meetingList(Map<String, String> params)
			throws SQLException {
		return client.queryForList("meeting.getMeetingList", params);
	}

	@Override
	public String insertMeetingInfo(MeetingVO mv)
			throws SQLException {
		return (String) client.insert("meeting.insertMeetingInfo", mv);
	}

	@Override
	public void deleteMeetingInfo(Map<String, String> params)
			throws SQLException {
		client.update("meeting.deleteMeetingInfo", params);
	}

	@Override
	public void updateMeetingInfo(MeetingVO mv)
			throws SQLException {
		client.update("meeting.updateMeetingInfo", mv);
	}

	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		return (int) client.queryForObject("meeting.totalCount", params);
	}

	@Override
	public void updateHit(Map<String, String> params) throws SQLException {
		client.update("meeting.updateHit", params);
	}

	@Override
	public List<ProjectVO> getProjectNM() throws SQLException {
		return client.queryForList("meeting.getProjectNM");
	}

	@Override
	public List<TempMeetingVO> getProjectModal(Map<String, String> params)
			throws SQLException {
		return client.queryForList("meeting.getProjectModal", params);
	}

	@Override
	public String getProjectname(Map<String, String> params)
			throws SQLException {
		return (String) client.queryForObject("meeting.getProjectname", params);
	}

	@Override
	public void insertmeetPw(Map<String, String> params) throws SQLException {
		client.insert("meeting.insertmeetPw", params);
	}

	@Override
	public void deleteMeetPw(Map<String, String> params) throws SQLException {
		client.delete("meeting.deleteMeetPw", params);
	}

}
