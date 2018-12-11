package kr.or.ddit.issueresult.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.issueresult.dao.IIssueResultDao;
import kr.or.ddit.vo.IssueResultVO;
import kr.or.ddit.vo.IssueVO;

@Service
public class IIssueResultServiceImpl implements IIssueResultService {

	@Autowired
	private IIssueResultDao issueResultDao;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={Exception.class})
	@Override
	public IssueResultVO issueResultInfo(Map<String, String> params) throws SQLException {
		return issueResultDao.issueResultInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<IssueResultVO> issueResultList(Map<String, String> params) throws SQLException {
		return issueResultDao.issueResultList(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void updateIssueResultInfo(IssueResultVO issueResultInfo) throws SQLException {
		issueResultDao.updateIssueResultInfo(issueResultInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void insertIssueInfo(IssueResultVO issueResultInfo, IssueVO issueInfo) throws SQLException {
		issueResultDao.insertIssueInfo(issueResultInfo,issueInfo);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void updateHit(Map<String, String> params) throws SQLException {
		issueResultDao.updateHit(params);		
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={Exception.class})
	@Override
	public IssueResultVO issueResultViewInfo(Map<String, String> params) throws SQLException {
		return issueResultDao.issueResultViewInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void updateRiskHit(Map<String, String> params) throws SQLException {
		issueResultDao.updateRiskHit(params);		
		
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void deleteIssueResultInfo(Map<String, String> params, IssueVO issueInfo) throws SQLException {
		issueResultDao.deleteIssueResultInfo(params, issueInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<IssueResultVO> riskList(Map<String, String> params) throws SQLException {
		return issueResultDao.riskList(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={Exception.class})
	@Override
	public int totalCountIssueResult(Map<String, String> params) throws SQLException {
		int totalCount = 0;
		try {
			totalCount = issueResultDao.totalCountIssueResult(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return totalCount;
	}

	@Override
	public List<Map<String, String>> issueChartInfo(Map<String, String> params) throws SQLException {
		return issueResultDao.issueChartInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={Exception.class})
	@Override
	public int totalCountRisk(Map<String, String> params) throws SQLException {
		int totalCount = 0;
		try {
			totalCount = issueResultDao.totalCountRisk(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return totalCount;
	}

}
