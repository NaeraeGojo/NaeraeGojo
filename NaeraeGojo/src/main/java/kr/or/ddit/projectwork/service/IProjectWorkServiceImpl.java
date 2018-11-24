package kr.or.ddit.projectwork.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.projectwork.dao.IProjectWorkDao;
import kr.or.ddit.vo.ProjectWorkVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IProjectWorkServiceImpl implements IProjectWorkService{
	@Autowired
	private IProjectWorkDao dao;
	
	@Override
	public void insertProjectWork(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateProjectWork(ProjectWorkVO pv) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteProjectWork(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<ProjectWorkVO> getProjectWorkList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProjectWorkVO getProjectWork(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
