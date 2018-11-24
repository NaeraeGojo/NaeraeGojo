package kr.or.ddit.meeting.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.MeetingVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.TempMeetingVO;

public interface IMeetingService {
	public List<TempMeetingVO> meetingInfo(Map<String,String> params) throws SQLException;
	public List<TempMeetingVO> meetingList(Map<String, String> params) throws SQLException;
	public String insertMeetingInfo(MeetingVO mv, MultipartFile files) throws SQLException;
	public void deleteMeetingInfo(Map<String,String> params) throws SQLException;
	public void updateMeetingInfo(MeetingVO mv) throws SQLException;
	public int totalCount(Map<String, String> params) throws SQLException;
	public void updateHit(Map<String, String> params) throws SQLException;
	public List<ProjectVO> getProjectNM() throws SQLException;
	public List<TempMeetingVO> getProjectModal(Map<String, String> params) throws SQLException;
	public String getProjectname(Map<String, String> params) throws SQLException;
	public void insertmeetPw(Map<String, String> params) throws SQLException;
	public void deleteMeetPw(Map<String, String> params) throws SQLException;
}
