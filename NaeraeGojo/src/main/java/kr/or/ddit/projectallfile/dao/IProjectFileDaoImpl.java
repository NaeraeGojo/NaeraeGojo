package kr.or.ddit.projectallfile.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProjectAllFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IProjectFileDaoImpl implements IProjectFileDao{
	@Autowired
	private SqlMapClient client;

	@Override
	public void insertProjectFile(ProjectAllFileVO pfv)
			throws SQLException {
		client.insert("profile.insertProjectFile",pfv);
	}

	@Override
	public void updateProjectFile(ProjectAllFileVO pfv) throws SQLException {
		client.update("profile.updateProjectFile",pfv);
	}

	@Override
	public void deleteProjectFile(Map<String, String> params)
			throws SQLException {
		client.update("profile.deleteProjectFile",params);
	}

	@Override
	public List<ProjectAllFileVO> getProjectFileList(Map<String, String> params)
			throws SQLException {
		return client.queryForList("profile.fileList",params);
	}

	@Override
	public ProjectAllFileVO getProjectFile(Map<String, String> params)
			throws SQLException {
		return (ProjectAllFileVO) client.queryForObject("profile.getProjectFile",params);
	}
	
	
}
