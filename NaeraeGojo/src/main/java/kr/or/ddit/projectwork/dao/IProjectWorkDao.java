package kr.or.ddit.projectwork.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.ProjectWorkVO;

public interface IProjectWorkDao {
	public void insertProjectWork(ProjectWorkVO pwv) throws SQLException;
	
	public void updateProjectWork(ProjectWorkVO pwv) throws SQLException;
	
	public void deleteProjectWork(Map<String, String> params) throws SQLException;
	
	public List<Map<String, String>> getProjectWorkList(Map<String, String> params) throws SQLException;
	
	public Map<String, String> getProjectWork(Map<String, String> params) throws SQLException;

	public int totalCount(Map<String, String> params) throws SQLException;

	public List<Map<String, String>> getPwChart(Map<String, String> params) throws SQLException;

	public List<EmpVO> getEmpList(Map<String, String> params) throws SQLException;
}
