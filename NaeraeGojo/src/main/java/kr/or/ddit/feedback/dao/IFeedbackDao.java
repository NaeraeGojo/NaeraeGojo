package kr.or.ddit.feedback.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FeedbackVO;


public interface IFeedbackDao {
	public FeedbackVO feedbackInfo(Map<String,String> params) throws SQLException;
	public List<FeedbackVO> feedbackList(Map<String, String> params) throws SQLException;
	public void insertFeedbackInfo(FeedbackVO feedbackInfo) throws SQLException;
	public void deleteFeedbackInfo(Map<String,String> params) throws SQLException;
	public void updateFeedbackInfo(FeedbackVO feedbackInfo) throws SQLException;
	public void fbAlarmCk(Map<String, String> params) throws SQLException;
	public String getFeedbackCnt(Map<String, String> params) throws SQLException;
	public List<FeedbackVO> receivefbList(Map<String, String> params) throws SQLException;
}
