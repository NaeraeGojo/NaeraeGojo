package kr.or.ddit.chat.service;


import java.util.List;
import java.util.Map;

import kr.or.ddit.chat.dao.IChatRoomDao;
import kr.or.ddit.vo.ChatRoomVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IChatRoomServiceImpl implements IChatRoomService{
	@Autowired
	private IChatRoomDao dao;

	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW , rollbackFor={Exception.class})
	public String insertChatRoom(ChatRoomVO crv) throws Exception {
		return dao.insertChatRoom(crv);
	}

	@Override
	public List<ChatRoomVO> getChatList(Map<String, String> params)
			throws Exception {
		return dao.getChatList(params);
	}
	
	

}
