package kr.or.ddit.issueresult.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.IssueResultVO;
import kr.or.ddit.vo.IssueVO;

public interface IIssueResultService {
	public IssueResultVO issueResultInfo(Map<String,String> params) throws SQLException;
	public IssueResultVO issueResultViewInfo(Map<String,String> params) throws SQLException;
	public List<IssueResultVO> issueResultList(Map<String, String> params) throws SQLException;
	public void insertIssueInfo(IssueResultVO issueResultInfo, IssueVO issueInfo) throws SQLException;
	public void updateIssueResultInfo(IssueResultVO issueResultInfo) throws SQLException;
	public void deleteIssueResultInfo(Map<String,String> params, IssueVO issueInfo) throws SQLException;
	public void updateHit(Map<String, String> params) throws SQLException;
	public List<IssueResultVO> riskList(Map<String, String> params) throws SQLException;
	public void updateRiskHit(Map<String, String> params) throws SQLException;
	public int totalCountIssueResult(Map<String, String> params) throws SQLException;

	
}
