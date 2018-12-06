package kr.or.ddit.bell.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FeedbackVO;
import kr.or.ddit.vo.IssueVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.VideoChatRoomVO;

public interface IBellService {

	public List<IssueVO> getIssueList(Map<String, String> params) throws SQLException;

	public String getIssueCount(Map<String, String> params) throws SQLException;

	public void issueAlarm(Map<String, String> param) throws SQLException;

	public String getFeedbackCnt(Map<String, String> params) throws SQLException;

	public List<FeedbackVO> receivefbList(Map<String, String> params) throws SQLException;

	public String getsenFeedCnt(Map<String, String> params) throws SQLException;

	public List<FeedbackVO> sendfbList(Map<String, String> params) throws SQLException;

	public String getvideoChatCnt(Map<String, String> params) throws SQLException;

	public List<VideoChatRoomVO> getVideoChatList(Map<String, String> params) throws SQLException;
	
	public List<ProjectVO> projectAlarmList(Map<String, String> params) throws SQLException;



}
