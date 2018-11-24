package kr.or.ddit.projectwork.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProjectWorkVO;

public interface IProjectWorkDao {
	public void insertProjectWork(Map<String, String> params) throws SQLException;
	
	public void updateProjectWork(ProjectWorkVO pv) throws SQLException;
	
	public void deleteProjectWork(Map<String, String> params) throws SQLException;
	
	public List<ProjectWorkVO> getProjectWorkList(Map<String, String> params) throws SQLException;
	
	public ProjectWorkVO getProjectWork(Map<String, String> params) throws SQLException;
}
