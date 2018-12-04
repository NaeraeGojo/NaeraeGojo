package kr.or.ddit.videochatjoin.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.videochatjoin.dao.IVideoChatJoinDao;
import kr.or.ddit.vo.VideoChatJoinVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Service
public class IVideoChatJoinServiceImpl implements IVideoChatJoinService{
	@Autowired
	private IVideoChatJoinDao dao;

	@Transactional(propagation=Propagation.REQUIRES_NEW , rollbackFor={Exception.class})
	@Override
	public void insertVideoChatJoin(Map<String, String> params)
			throws SQLException {
		dao.insertVideoChatJoin(params);
	}

	@Override
	public void updateVideoChatJoin(VideoChatJoinVO vcrv) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteVideoChatJoin(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<VideoChatJoinVO> getVideoChatJoinList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public VideoChatJoinVO getVideoChatJoin(Map<String, String> params)
			throws SQLException {
		return null;
	}

	@Override
	public String getVideoRoomCode(String video_chat_join_code)
			throws SQLException {
		return dao.getVideoRoomCode(video_chat_join_code);
	}

	@Override
	public String getUrlInfo(String video_chat_room_code) throws SQLException {
		return dao.getUrlInfo(video_chat_room_code);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW , rollbackFor={Exception.class})
	@Override
	public void ChatJoinEnd(Map<String, String> params) throws SQLException {
		dao.ChatJoinEnd(params);
	}


}
