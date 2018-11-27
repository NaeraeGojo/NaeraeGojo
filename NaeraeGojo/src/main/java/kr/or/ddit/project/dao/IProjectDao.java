package kr.or.ddit.project.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;

public interface IProjectDao {
	
	public ProjectVO projectInfo(Map<String,String> params) throws SQLException;
	public List<ProjectVO> projectList(Map<String, String> params) throws SQLException;
	public List<JoinVO> joinList(Map<String, String> params) throws SQLException;
	public int totalCount(Map<String, String> params) throws SQLException;

}
