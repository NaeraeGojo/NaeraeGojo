package kr.or.ddit.projectworkclass.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProjectWorkClassVO;

public interface IProjectWorkClassDao {
	
	public String insertPwc(ProjectWorkClassVO pv) throws SQLException;
	
	public void updatePwc(ProjectWorkClassVO pv) throws SQLException;
	
	public void deletePwc(Map<String, String> params) throws SQLException;
	
	public List<ProjectWorkClassVO> getPwcList(Map<String, String> params) throws SQLException;
	
	public ProjectWorkClassVO getPwc(Map<String, String> params) throws SQLException;
	
}
