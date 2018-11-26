package kr.or.ddit.feedback.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.feedback.dao.IFeedbackDao;
import kr.or.ddit.vo.FeedbackVO;

@Service
public class IFeedbackServiceImpl implements IFeedbackService{

	@Autowired
	private IFeedbackDao feedbackDao;
	
	@Override
	public FeedbackVO feedbackInfo(Map<String, String> params)
			throws SQLException {
		return feedbackDao.feedbackInfo(params);
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

	@Transactional(propagation=Propagation.REQUIRES_NEW , rollbackFor={Exception.class})
	@Override
	public void fbAlarmCk(Map<String, String> params) throws SQLException {
		feedbackDao.fbAlarmCk(params);
	}

	@Override
	public String getFeedbackCnt(Map<String, String> params)
			throws SQLException {
		return feedbackDao.getFeedbackCnt(params);
	}

	@Override
	public List<FeedbackVO> receivefbList(Map<String, String> params)
			throws SQLException {
		return feedbackDao.receivefbList(params);
	}

}
