package kr.or.ddit.projectallfile.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.projectallfile.dao.IProjectFileDao;
import kr.or.ddit.vo.ProjectAllFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IProjectFileServiceImpl implements IProjectFileService{
	@Autowired
	private IProjectFileDao dao;

	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW , rollbackFor={Exception.class})
	public void insertProjectFile(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW , rollbackFor={Exception.class})
	public void updateProjectFile(ProjectAllFileVO pv) throws SQLException {
		dao.updateProjectFile(pv);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW , rollbackFor={Exception.class})
	public void deleteProjectFile(Map<String, String> params)
			throws SQLException {
		dao.deleteProjectFile(params);
	}

	@Override
	public List<ProjectAllFileVO> getProjectFileList(Map<String, String> params)
			throws SQLException {
		return dao.getProjectFileList(params);
	}

	@Override
	public ProjectAllFileVO getProjectFile(Map<String, String> params)
			throws SQLException {
		return dao.getProjectFile(params);
	}

}
