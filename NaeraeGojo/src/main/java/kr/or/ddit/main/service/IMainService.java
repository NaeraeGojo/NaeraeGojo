package kr.or.ddit.main.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.vo.ProjectVO;

public interface IMainService {

	public List<ProjectVO> getProjectTime() throws SQLException;

}
