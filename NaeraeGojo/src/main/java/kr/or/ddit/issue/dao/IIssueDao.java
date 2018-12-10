package kr.or.ddit.issue.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.IssueVO;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectWorkVO;
import kr.or.ddit.vo.RqppsVO;

public interface IIssueDao {
	public IssueVO issueInfo(Map<String,String> params) throws SQLException;
	public List<IssueVO> issueList(Map<String, String> params) throws SQLException;
	public List<IssueVO> issueStatusList(Map<String, String> params) throws SQLException;
	public void insertIssueInfo(IssueVO issueInfo) throws SQLException;
	public void deleteIssueInfo(Map<String,String> params) throws SQLException;
	public void updateIssueInfo(IssueVO issueInfo) throws SQLException;
	public int totalCount(Map<String, String> params) throws SQLException;
	public int totalCountIssueResult(Map<String, String> params) throws SQLException;
	public void updateHit(Map<String, String> params) throws SQLException;
	public List<ProjectWorkVO> pwList(Map<String, String> params) throws SQLException;
	public List<JoinVO> joinEmpList(Map<String, String> params) throws SQLException;


}
