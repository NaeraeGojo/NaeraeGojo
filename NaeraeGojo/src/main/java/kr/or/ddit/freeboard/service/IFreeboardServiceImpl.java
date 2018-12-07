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
		return dao.freeboardInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public List<FreeBoardVO> freeboardList(Map<String, String> params)
			throws SQLException {
		return dao.freeboardList(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void insertFreeboardInfo(FreeBoardVO freeboardInfo, MultipartFile[] files) throws SQLException{
		String freeboard_code = dao.insertFreeboardInfo(freeboardInfo);
		List<ProjectAllFileVO> pfl = fileMapper.mapping(files, freeboard_code, "2", freeboardInfo.getProject_code());
		
		for(ProjectAllFileVO pfv : pfl){
			pfdao.insertProjectFile(pfv);
		}
	}

	@Override
	public void deleteFreeboardInfo(Map<String, String> params)
			throws SQLException {
		dao.deleteFreeboardInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void updateFreeboardInfo(FreeBoardVO fbv, MultipartFile[] files) throws SQLException {
		dao.updateFreeboardInfo(fbv);
		
		List<ProjectAllFileVO> pfl = fileMapper.mapping(files, fbv.getFreeboard_code(), "2", fbv.getProject_code());
		
		for(ProjectAllFileVO pfv : pfl){
			pfdao.insertProjectFile(pfv);
		}
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		return dao.totalCount(params);
	}

}
