package kr.or.ddit.projectallfile.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.projectallfile.dao.IProjectFileDao;
import kr.or.ddit.vo.ProjectAllFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IProjectFileServiceImpl implements IProjectFileService{
	@Autowired
	private IProjectFileDao dao;

	@Override
	public void insertProjectFile(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateProjectFile(ProjectAllFileVO pv) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteProjectFile(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<ProjectAllFileVO> getProjectFileList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProjectAllFileVO getProjectFile(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
