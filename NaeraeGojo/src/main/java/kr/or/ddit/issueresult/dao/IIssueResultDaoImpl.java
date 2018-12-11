package kr.or.ddit.issueresult.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.IssueResultVO;
import kr.or.ddit.vo.IssueVO;

@Repository
public class IIssueResultDaoImpl implements IIssueResultDao{

	@Resource
	private SqlMapClient client;
	
	@Override
	public IssueResultVO issueResultInfo(Map<String, String> params) throws SQLException {
		return (IssueResultVO) client.queryForObject("issueResult.issueResultInfo", params);
	}
	
	@Override
	public List<IssueResultVO> issueResultList(Map<String, String> params) throws SQLException {
		return client.queryForList("issueResult.issueResultList", params);
	}

	@Override
	public void insertIssueInfo(IssueResultVO issueResultInfo, IssueVO issueInfo) throws SQLException {
		client.update("issueResult.updateIssueStatus", issueInfo);
		client.insert("issueResult.insertIssueResultInfo", issueResultInfo);
	}
	
	@Override
	public void updateIssueResultInfo(IssueResultVO issueResultInfo) throws SQLException {
		client.update("issueResult.updateIsssueResultInfo", issueResultInfo);
	}

	@Override
	public void deleteIssueResultInfo(Map<String, String> params, IssueVO issueInfo) throws SQLException {
		client.update("issueResult.updateIssueStatusDel", issueInfo);
		client.delete("issueResult.deleteIssueResultInfo", params);
	}
	
	@Override
	public void updateHit(Map<String, String> params) throws SQLException {
		client.update("issueResult.updateResultHIT", params);		
	}

	@Override
	public IssueResultVO issueResultViewInfo(Map<String, String> params) throws SQLException {
		return (IssueResultVO) client.queryForObject("issueResult.issueResultViewInfo", params);
	}

	@Override
	public void updateRiskHit(Map<String, String> params) throws SQLException {
		client.update("issueResult.updateRiskHIT", params);		
		
	}

	@Override
	public List<IssueResultVO> riskList(Map<String, String> params) throws SQLException {
		return client.queryForList("issueResult.riskList", params);
	}

	@Override
	public int totalCountIssueResult(Map<String, String> params) throws SQLException {
		return (int) client.queryForObject("issue.totalCountIssueResult", params);
	}

	@Override
	public List<Map<String, String>> issueChartInfo(Map<String, String> params) throws SQLException {
		return client.queryForList("issueResult.issueChartInfo",params);
	}

	@Override
	public int totalCountRisk(Map<String, String> params) throws SQLException {
		return (int) client.queryForObject("issueResult.totalCountRisk", params);
	}

	

}
