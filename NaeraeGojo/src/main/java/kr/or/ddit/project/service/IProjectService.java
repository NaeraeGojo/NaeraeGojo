package kr.or.ddit.project.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapException;

import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.ProjectWorkVO;
import kr.or.ddit.vo.SuggestVO;

public interface IProjectService {
	
	public ProjectVO projectInfo(Map<String,String> params) throws SQLException;
	public SuggestVO suggestInfo(Map<String,String> params) throws SQLException;
	public List<ProjectVO> projectList(Map<String, String> params) throws SQLException;
	public List<JoinVO> joinList(Map<String, String> params) throws SQLException;
	public List<SuggestVO> suggestList(Map<String, String> params) throws SQLException;
	public void insertProjectInfo(ProjectVO projectInfo) throws SQLException;
	public void updateProjectInfo(ProjectVO projectInfo) throws SQLException;
	public void deleteProjectInfo(Map<String,String> params) throws SQLException;
	public int totalCount(Map<String, String> params) throws SQLException;
	public int totalCountPL(Map<String, String> params) throws SQLException;
	public int totalComplete(Map<String, String> params) throws SQLException;
	public int totalIng(Map<String, String> params) throws SQLException;
	public int totalNew(Map<String, String> params) throws SQLException;

}
