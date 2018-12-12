package kr.or.ddit.issue.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.IssueVO;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectWorkVO;
import kr.or.ddit.vo.RqppsVO;

@Repository
public class IIssueDaoImpl implements IIssueDao {

	@Resource
	private SqlMapClient client;
	
	@Override
	public IssueVO issueInfo(Map<String, String> params) throws SQLException {
		return (IssueVO) client.queryForObject("issue.issueInfo", params);
	}

	@Override
	public List<IssueVO> issueList(Map<String, String> params) throws SQLException {
		return client.queryForList("issue.issueList", params);
	}

	@Override
	public void insertIssueInfo(IssueVO issueInfo) throws SQLException {
		client.insert("issue.insertIssue", issueInfo);
	}

	@Override
	public void deleteIssueInfo(Map<String, String> params) throws SQLException {
		client.update("issue.deleteIssue", params);
	}

	@Override
	public void updateIssueInfo(IssueVO issueInfo) throws SQLException {
		client.update("issue.updateIssue", issueInfo);
	}

	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		return (int) client.queryForObject("issue.totalCount", params);
	}

	@Override
	public void updateHit(Map<String, String> params) throws SQLException {
		client.update("issue.updateHIT", params);		
		
	}

	@Override
	public List<ProjectWorkVO> pwList(Map<String, String> params) throws SQLException {
		return client.queryForList("issue.pwList", params);
	}

	@Override
	public List<IssueVO> issueStatusList(Map<String, String> params) throws SQLException {
		return client.queryForList("issue.issueStatusList", params);
	}

	@Override
	public List<JoinVO> joinEmpList(Map<String, String> params) throws SQLException {
		return client.queryForList("issue.joinEmpList", params);
	}

	

}
