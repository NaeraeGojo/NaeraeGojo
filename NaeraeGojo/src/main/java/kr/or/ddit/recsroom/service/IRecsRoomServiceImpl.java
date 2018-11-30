package kr.or.ddit.recsroom.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.projectallfile.dao.IProjectFileDao;
import kr.or.ddit.recsroom.dao.IRecsRoomDao;
import kr.or.ddit.utils.AttachFileMapper;
import kr.or.ddit.vo.ProjectAllFileVO;
import kr.or.ddit.vo.RecsRoomVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class IRecsRoomServiceImpl implements IRecsRoomService{
	@Autowired
	private IRecsRoomDao dao;

	@Autowired
	private AttachFileMapper fileMapper;
	
	@Autowired
	private IProjectFileDao pfdao;
	
	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	public void insertRecsRoom(RecsRoomVO rrv, MultipartFile[] files) throws SQLException {
		String recsroom_code = dao.insertRecsRoom(rrv);
		List<ProjectAllFileVO> pfl = fileMapper.mapping(files, recsroom_code, "1", rrv.getProject_code());
		
		for(ProjectAllFileVO pfv : pfl){
			pfdao.insertProjectFile(pfv);
		}
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	public void updateRecsRoom(RecsRoomVO rrv, MultipartFile[] files) throws SQLException {
		dao.updateRecsRoom(rrv);
		
		List<ProjectAllFileVO> pfl = fileMapper.mapping(files, rrv.getRecsroom_code(), "1", rrv.getProject_code());
		
		for(ProjectAllFileVO pfv: pfl){
			pfdao.insertProjectFile(pfv);
		}
		
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	public void deleteRecsRoom(Map<String, String> params) throws SQLException {
		dao.deleteRecsRoom(params);
	}

	@Override
	public List<RecsRoomVO> getRecsRoomList(Map<String, String> params)
			throws SQLException {
		return dao.getRecsRoomList(params);
	}

	@Override
	public RecsRoomVO getRecsRoom(Map<String, String> params)
			throws SQLException {
		return dao.getRecsRoom(params);
	}

	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		return dao.totalCount(params);
	}

}
