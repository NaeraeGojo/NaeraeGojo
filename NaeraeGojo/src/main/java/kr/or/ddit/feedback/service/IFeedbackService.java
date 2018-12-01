package kr.or.ddit.feedback.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FeedbackVO;

public interface IFeedbackService {
	public FeedbackVO feedbackInfoRe(Map<String,String> params) throws SQLException;
	public List<FeedbackVO> feedbackList(Map<String, String> params) throws SQLException;
	public void insertFeedbackInfo(FeedbackVO feedbackInfo) throws SQLException;
	public void deleteFeedbackInfo(Map<String,String> params) throws SQLException;
	public void updateFeedbackInfo(FeedbackVO feedbackInfo) throws SQLException;
	public void fbAlarmCk(Map<String, String> params) throws SQLException;
	public String getFeedbackCnt(Map<String, String> params) throws SQLException;
	public List<FeedbackVO> receivefbList(Map<String, String> params)throws SQLException;
	public int totalCount(Map<String, String> params)throws SQLException;
	public FeedbackVO feedbackInfo2(Map<String, String> params) throws SQLException;
	public void confirmStatus(Map<String, String> params) throws SQLException;
	public void deleteReceive(Map<String, String> params) throws SQLException;
	public List<FeedbackVO> sendfbList(Map<String, String> params) throws SQLException;
	public int totalCount2(Map<String, String> params) throws SQLException;
	public void deleteSend(Map<String, String> params) throws SQLException;
	public FeedbackVO sendfeedbackInfo(Map<String, String> params) throws SQLException;
	public FeedbackVO feedbackInfoSend(Map<String, String> params)throws SQLException;
}
