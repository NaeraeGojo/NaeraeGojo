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

	@Transactional(propagation=Propagation.REQUIRES_NEW , rollbackFor={Exception.class})
	@Override
	public void insertFeedbackInfo(FeedbackVO feedbackInfo) throws SQLException {
		feedbackDao.insertFeedbackInfo(feedbackInfo);
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

	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		return feedbackDao.totalCount(params);
	}

	@Override
	public FeedbackVO feedbackInfo2(Map<String, String> params)
			throws SQLException {
		return feedbackDao.feedbackInfo2(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW , rollbackFor={Exception.class})
	@Override
	public void confirmStatus(Map<String, String> params) throws SQLException {
		feedbackDao.confirmStatus(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW , rollbackFor={Exception.class})
	@Override
	public void deleteReceive(Map<String, String> params) throws SQLException {
		feedbackDao.deleteReceive(params);
	}

	@Override
	public List<FeedbackVO> sendfbList(Map<String, String> params)
			throws SQLException {
		return feedbackDao.sendfbList(params);
	}

	@Override
	public int totalCount2(Map<String, String> params) throws SQLException {
		return feedbackDao.totalCount2(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW , rollbackFor={Exception.class})
	@Override
	public void deleteSend(Map<String, String> params) throws SQLException {
		feedbackDao.deleteSend(params);
	}

	@Override
	public FeedbackVO sendfeedbackInfo(Map<String, String> params)
			throws SQLException {
		return feedbackDao.sendfeedbackInfo(params);
	}



}
