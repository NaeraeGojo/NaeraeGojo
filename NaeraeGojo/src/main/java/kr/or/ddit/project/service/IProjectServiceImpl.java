package kr.or.ddit.project.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.project.dao.IProjectDao;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SuggestVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


@Service
public class IProjectServiceImpl implements IProjectService{
	
	@Autowired
	private IProjectDao dao;

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={Exception.class})
	@Override
	public ProjectVO projectInfo(Map<String, String> params) throws SQLException {
		return dao.projectInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<ProjectVO> projectList(Map<String, String> params) throws SQLException {
		return dao.projectList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<JoinVO> joinList(Map<String, String> params) throws SQLException {
		return dao.joinList(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<SuggestVO> suggestList(Map<String, String> params) throws SQLException {
		return dao.suggestList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		int totalCount = 0;
		try {
			totalCount = dao.totalCount(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return totalCount;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void insertProjectInfo(ProjectVO projectInfo) throws SQLException {
		dao.insertProjectInfo(projectInfo);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void updateProjectInfo(ProjectVO projectInfo) throws SQLException {
		dao.updateProjectInfo(projectInfo);
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={Exception.class})
	@Override
	public void deleteProjectInfo(Map<String, String> params) throws SQLException {
		dao.deleteProjectInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int totalCountPL(Map<String, String> params) throws SQLException {
		int totalCount = 0;
		try {
			totalCount = dao.totalCountPL(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return totalCount;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={Exception.class})
	@Override
	public SuggestVO suggestInfo(Map<String, String> params) throws SQLException {
	return dao.suggestInfo(params);
	}

}
