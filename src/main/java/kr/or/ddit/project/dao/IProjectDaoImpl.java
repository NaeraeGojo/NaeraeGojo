package kr.or.ddit.project.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProjectVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

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


	
}
