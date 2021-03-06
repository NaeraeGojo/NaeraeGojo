package kr.or.ddit.bell.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.bell.dao.IBellDao;
import kr.or.ddit.vo.FeedbackVO;
import kr.or.ddit.vo.IssueVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.VideoChatRoomVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


@Service
public class IBellServiceImpl implements IBellService {

	@Autowired
	private IBellDao dao;

	@Override
	public List<IssueVO> getIssueList(Map<String, String> params) throws SQLException {
		return dao.getIssueList(params);
	}

	@Override
	public String getIssueCount(Map<String, String> params) throws SQLException {
		return dao.getIssueCount(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW , rollbackFor={Exception.class})
	@Override
	public void issueAlarm(Map<String, String> param) throws SQLException {
		dao.issueAlarm(param);
	}

	@Override
	public String getFeedbackCnt(Map<String, String> params)
			throws SQLException {
		return dao.getFeedbackCnt(params);
	}

	@Override
	public List<FeedbackVO> receivefbList(Map<String, String> params)
			throws SQLException {
		return dao.receivefbList(params);
	}

	@Override
	public String getsenFeedCnt(Map<String, String> params) throws SQLException {
		return dao.getsenFeedCnt(params);
	}

	@Override
	public List<FeedbackVO> sendfbList(Map<String, String> params)
			throws SQLException {
		return dao.sendfeedCnt(params);
	}

	@Override
	public String getvideoChatCnt(Map<String, String> params)
			throws SQLException {
		return dao.getvideoChatCnt(params);
	}

	@Override
	public List<VideoChatRoomVO> getVideoChatList(Map<String, String> params)
			throws SQLException {
		return dao.getVideoChatList(params);
	}

	@Override
	public List<ProjectVO> projectAlarmList(Map<String, String> params)
			throws SQLException {
		return dao.projectAlarmList(params);
	}

	@Override
	public String projectAlarmCnt(Map<String, String> params)
			throws SQLException {
		return dao.projectAlarmCnt(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void deleteProjectAlarm(Map<String, String> params)
			throws SQLException {
		dao.deleteProjectAlarm(params);
	}

	@Override
	public List<IssueVO> issueDamdangList(Map<String, String> params)
			throws SQLException {
		return dao.issueDamdangList(params);
	}

	@Override
	public String issueDamdangCnt(Map<String, String> params)
			throws SQLException {
		return dao.issueDamdangCnt(params);
	}

	

	
}
