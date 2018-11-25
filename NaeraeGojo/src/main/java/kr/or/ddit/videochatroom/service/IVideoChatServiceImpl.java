package kr.or.ddit.videochatroom.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.videochatroom.dao.IVideoChatDao;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.VideoChatRoomVO;
import kr.or.ddit.vo.ChatListTempVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IVideoChatServiceImpl implements IVideoChatService{
	@Autowired
	private IVideoChatDao dao;

	@Override
	public void insertVideoChat(Map<String, String> params) throws SQLException {
		
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void updateVideoChat(VideoChatRoomVO pv) throws SQLException {
		dao.updateVideoChat(pv);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void deleteVideoChat(Map<String, String> params) throws SQLException {
		dao.deleteVideoChat(params);
	}

	@Override
	public List<ChatListTempVO> getVideoChatList(Map<String, String> params)
			throws SQLException {
		return dao.getVideoChatList(params);
	}

	@Override
	public List<ChatListTempVO> getVideoChat(Map<String, String> params)
			throws SQLException {
		return dao.getVideoChat(params);
	}

	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		return dao.totalCount(params);
	}

//	@Override
//	public List<ProjectVO> getProject(Map<String, String> params)
//			throws SQLException {
//		return dao.getProjectList(params);
//	}
	
	@Override
	public List<ProjectVO> getProjectList(Map<String, String> params)
			throws SQLException {
		return dao.getProjectList(params);
	}

}
