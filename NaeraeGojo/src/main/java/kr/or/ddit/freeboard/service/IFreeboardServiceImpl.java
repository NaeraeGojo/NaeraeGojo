package kr.or.ddit.freeboard.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.freeboard.dao.IFreeboardDao;
import kr.or.ddit.projectallfile.dao.IProjectFileDao;
import kr.or.ddit.utils.AttachFileMapper;
import kr.or.ddit.utils.AttachPictureMapper;
import kr.or.ddit.vo.FreeBoardVO;
import kr.or.ddit.vo.ProjectAllFileVO;

@Service
public class IFreeboardServiceImpl implements IFreeboardService{

	@Autowired
	private IFreeboardDao dao;
	
	@Autowired
	private AttachFileMapper fileMapper;
	
	@Autowired
	private IProjectFileDao pfdao;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public FreeBoardVO freeboardInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FreeBoardVO> freeboardList(Map<String, String> params)
			throws SQLException {
		return dao.freeboardList(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void insertFreeboardInfo(FreeBoardVO freeboardInfo, MultipartFile[] files) throws SQLException{
		String bo_no = dao.insertFreeboardInfo(freeboardInfo);
		List<ProjectAllFileVO> pfl = fileMapper.mapping(files, bo_no, "3", freeboardInfo.getProject_code());
		
		for(ProjectAllFileVO pfv : pfl){
			pfdao.insertProjectFile(pfv);
		}
	}

	@Override
	public void deleteFreeboardInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateFreeboardInfo(FreeBoardVO freeboardInfo)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

}
