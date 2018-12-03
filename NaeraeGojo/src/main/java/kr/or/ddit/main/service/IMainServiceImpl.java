package kr.or.ddit.main.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.main.dao.IMainDao;
import kr.or.ddit.vo.ProjectVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IMainServiceImpl implements IMainService {
	
	@Autowired
	private IMainDao dao;

	@Override
	public List<ProjectVO> getProjectTime() throws SQLException {
		return dao.getProjectTime();
	}

}
