package kr.or.ddit.projectallfile.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProjectAllFileVO;

public interface IProjectFileService {
	public void insertProjectFile(Map<String, String> params) throws SQLException;
	
	public void updateProjectFile(ProjectAllFileVO pv) throws SQLException;
	
	public void deleteProjectFile(Map<String, String> params) throws SQLException;
	
	public List<ProjectAllFileVO> getProjectFileList(Map<String, String> params) throws SQLException;
	
	public ProjectAllFileVO getProjectFile(Map<String, String> params) throws SQLException;

}
