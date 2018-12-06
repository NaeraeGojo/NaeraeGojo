package kr.or.ddit.bell.dao;


import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.FeedbackVO;
import kr.or.ddit.vo.IssueVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.VideoChatRoomVO;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IBellDaoImpl implements IBellDao{
	
	@Resource
	private SqlMapClient client;

	@Override
	public List<IssueVO> getIssueList(Map<String, String> params) throws SQLException {
		return client.queryForList("bellList.getIssueList", params);
	}

	@Override
	public String getIssueCount(Map<String, String> params) throws SQLException {
		return (String) client.queryForObject("bellList.getCount", params);
	}

	@Override
	public void issueAlarm(Map<String, String> param) throws SQLException {
		client.update("bellList.issueAlarm", param);
	}

	@Override
	public String getFeedbackCnt(Map<String, String> params)
			throws SQLException {
		return (String) client.queryForObject("bellList.getFeedbackCnt", params);
	}

	@Override
	public List<FeedbackVO> receivefbList(Map<String, String> params)
			throws SQLException {
		return client.queryForList("bellList.receivefbList", params);
	}

	@Override
	public String getsenFeedCnt(Map<String, String> params) throws SQLException {
		return (String) client.queryForObject("bellList.getsenFeedCnt", params);
	}

	@Override
	public List<FeedbackVO> sendfeedCnt(Map<String, String> params)
			throws SQLException {
		return client.queryForList("bellList.sendfeedCnt", params);
	}

	@Override
	public String getvideoChatCnt(Map<String, String> params)
			throws SQLException {
		return (String) client.queryForObject("bellList.getvideoChatCnt", params);
	}

	@Override
	public List<VideoChatRoomVO> getVideoChatList(Map<String, String> params)
			throws SQLException {
		return client.queryForList("bellList.getVideoChatList", params);
	}

	@Override
	public List<ProjectVO> projectAlarmList(Map<String, String> params) throws SQLException {
		return client.queryForList("bellList.projectAlramList", params);
	}

	


}
