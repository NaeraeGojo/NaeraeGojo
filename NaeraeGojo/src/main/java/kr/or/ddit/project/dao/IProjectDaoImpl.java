package kr.or.ddit.project.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuggestVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapException;

@Repository
public class IProjectDaoImpl implements IProjectDao{

	@Autowired
	private SqlMapClient client;

	@Override
	public ProjectVO projectInfo(Map<String, String> params) throws SQLException {
		return (ProjectVO) client.queryForObject("project.projectInfo", params);
	}

	@Override
	public List<ProjectVO> projectList(Map<String, String> params) throws SQLException {
		return client.queryForList("project.projectList", params);
	}

	@Override
	public List<JoinVO> joinList(Map<String, String> params) throws SQLException {
		return client.queryForList("project.joinList", params);
	}
	
	@Override
	public List<SuggestVO> suggestList(Map<String, String> params) throws SQLException {
		return client.queryForList("project.suggestList", params);
	}

	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		return (int) client.queryForObject("project.totalCount", params);
	}

	@Override
	public void insertProjectInfo(ProjectVO projectInfo) throws SQLException {
		client.insert("project.insertProject", projectInfo);
		client.update("project.updateJoinProjectCode", projectInfo);
	}
	
	@Override
	public void updateProjectInfo(ProjectVO projectInfo) throws SQLException {
		client.update("project.updateProject", projectInfo);
	}

	@Override
	public void deleteProjectInfo(Map<String, String> params) throws SQLException {
		client.update("project.deleteProject", params);
	}

	@Override
	public int totalCountPL(Map<String, String> params) throws SQLException {
		return (int) client.queryForObject("project.totalCountPL", params);
	}

	@Override
	public SuggestVO suggestInfo(Map<String, String> params) throws SQLException {
		return (SuggestVO) client.queryForObject("project.suggestInfo", params);
	}

}
