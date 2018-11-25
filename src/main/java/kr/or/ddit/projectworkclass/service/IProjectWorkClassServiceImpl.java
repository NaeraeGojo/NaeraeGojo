package kr.or.ddit.projectworkclass.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.projectworkclass.dao.IProjectWorkClassDao;
import kr.or.ddit.vo.ProjectWorkClassVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IProjectWorkClassServiceImpl implements IProjectWorkClassService{

	@Autowired
	private IProjectWorkClassDao dao;

	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	public String insertPwc(ProjectWorkClassVO pv) throws SQLException {
		return dao.insertPwc(pv);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	public void updatePwc(ProjectWorkClassVO pv) throws SQLException {
		dao.updatePwc(pv);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	public void deletePwc(Map<String, String> params) throws SQLException {
		dao.deletePwc(params);
	}

	@Override
	public List<ProjectWorkClassVO> getPwcList(Map<String, String> params)
			throws SQLException {
		return dao.getPwcList(params);
	}

	@Override
	public ProjectWorkClassVO getPwc(Map<String, String> params)
			throws SQLException {
		return dao.getPwc(params);
	}
	

}
