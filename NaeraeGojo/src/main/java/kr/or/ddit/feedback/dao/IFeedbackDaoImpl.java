package kr.or.ddit.feedback.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.or.ddit.vo.FeedbackVO;

import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IFeedbackDaoImpl implements IFeedbackDao {

	@Resource
	private SqlMapClient client;
	
	@Override
	public FeedbackVO feedbackInfo(Map<String, String> params)
			throws SQLException {
		return (FeedbackVO) client.queryForObject("feedback.feedbackInfo", params);
	}

	@Override
	public List<FeedbackVO> feedbackList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertFeedbackInfo(FeedbackVO feedbackInfo) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteFeedbackInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateFeedbackInfo(FeedbackVO feedbackInfo) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void fbAlarmCk(Map<String, String> params) throws SQLException {
		client.update("feedback.fbAlarmCk", params);
	}

	@Override
	public String getFeedbackCnt(Map<String, String> params)
			throws SQLException {
		return (String) client.queryForObject("feedback.getFeedbackCnt",params);
	}

	@Override
	public List<FeedbackVO> receivefbList(Map<String, String> params)
			throws SQLException {
		return client.queryForList("feedback.receivefbList", params);
	}

}
