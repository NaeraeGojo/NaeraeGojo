package kr.or.ddit.bell.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FeedbackVO;
import kr.or.ddit.vo.IssueVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.VideoChatRoomVO;

public interface IBellDao {

	public List<IssueVO> getIssueList(Map<String, String> params) throws SQLException;
	public String getIssueCount(Map<String, String> params) throws SQLException;
	public void issueAlarm(Map<String, String> param) throws SQLException;
	public String getFeedbackCnt(Map<String, String> params) throws SQLException;
	public List<FeedbackVO> receivefbList(Map<String, String> params) throws SQLException;
	public String getsenFeedCnt(Map<String, String> params) throws SQLException;
	public List<FeedbackVO> sendfeedCnt(Map<String, String> params) throws SQLException;
	public String getvideoChatCnt(Map<String, String> params) throws SQLException;
	public List<VideoChatRoomVO> getVideoChatList(Map<String, String> params) throws SQLException;
	public List<ProjectVO> projectAlarmList(Map<String, String> params) throws SQLException;
	public String projectAlarmCnt(Map<String, String> params) throws SQLException;
	public void deleteProjectAlarm(Map<String, String> params) throws SQLException;
	public List<IssueVO> issueDamdangList(Map<String, String> params) throws SQLException;
	public String issueDamdangCnt(Map<String, String> params) throws SQLException;

	
}
