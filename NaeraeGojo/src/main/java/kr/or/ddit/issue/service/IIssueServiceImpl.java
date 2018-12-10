package kr.or.ddit.issue.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.issue.dao.IIssueDao;
import kr.or.ddit.vo.IssueVO;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectWorkVO;
import kr.or.ddit.vo.RqppsVO;

@Service
public class IIssueServiceImpl implements IIssueService{

	@Autowired
	private IIssueDao issueDao;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={Exception.class})
	@Override
	public IssueVO issueInfo(Map<String, String> params) throws SQLException {
		return issueDao.issueInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<IssueVO> issueList(Map<String, String> params) throws SQLException {
		return issueDao.issueList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void insertIssueInfo(IssueVO issueInfo) throws SQLException {
		issueDao.insertIssueInfo(issueInfo);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={Exception.class})
	@Override
	public void deleteIssueInfo(Map<String, String> params) throws SQLException {
		issueDao.deleteIssueInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void updateIssueInfo(IssueVO issueInfo) throws SQLException {
		issueDao.updateIssueInfo(issueInfo);
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={Exception.class})
	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		int totalCount = 0;
		try {
			totalCount = issueDao.totalCount(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return totalCount;
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void updateHit(Map<String, String> params) throws SQLException {
		issueDao.updateHit(params);		
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<ProjectWorkVO> pwList(Map<String, String> params) throws SQLException {
		return issueDao.pwList(params);

	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<IssueVO> issueStatusList(Map<String, String> params) throws SQLException {
		return issueDao.issueStatusList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<JoinVO> joinEmpList(Map<String, String> params) throws SQLException {
		return issueDao.joinEmpList(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={Exception.class})
	@Override
	public int totalCountIssueResult(Map<String, String> params) throws SQLException {
		int totalCount = 0;
		try {
			totalCount = issueDao.totalCountIssueResult(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return totalCount;
	}

}
