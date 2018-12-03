package kr.or.ddit.main.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.vo.ProjectVO;

public interface IMainDao {

	public List<ProjectVO> getProjectTime() throws SQLException;

}
