package kr.or.ddit.projectwork.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.projectwork.dao.IProjectWorkDao;
import kr.or.ddit.vo.ProjectWorkVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IProjectWorkServiceImpl implements IProjectWorkService{
	@Autowired
	private IProjectWorkDao dao;
	
	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW , rollbackFor={Exception.class})
	public void insertProjectWork(ProjectWorkVO pwv)
			throws SQLException {
		dao.insertProjectWork(pwv);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW , rollbackFor={Exception.class})
	public void updateProjectWork(ProjectWorkVO pwv) throws SQLException {
		dao.updateProjectWork(pwv);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW , rollbackFor={Exception.class})
	public void deleteProjectWork(Map<String, String> params)
			throws SQLException {
		dao.deleteProjectWork(params);
	}


	@Override
	public Map<String, String> getProjectWork(Map<String, String> params)
			throws SQLException {
		return dao.getProjectWork(params);
	}

	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		return dao.totalCount(params);
	}

	@Override
	public List<Map<String, String>> getProjectWorkList(
			Map<String, String> params) throws SQLException {
		return dao.getProjectWorkList(params);
	}

	@Override
	public List<Map<String, String>> getPwChart(Map<String, String> params)
			throws SQLException {
		return dao.getPwChart(params);
	}

}
