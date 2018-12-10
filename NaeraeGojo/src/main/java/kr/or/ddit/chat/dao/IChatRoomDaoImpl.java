package kr.or.ddit.chat.dao;


import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ChatRoomVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IChatRoomDaoImpl implements IChatRoomDao{
	@Autowired
	private SqlMapClient client;

	@Override
	public String insertChatRoom(ChatRoomVO crv) throws Exception {
		return (String) client.insert("chatroom.insertChatRoom",crv);
	}

	@Override
	public List<ChatRoomVO> getChatList(Map<String, String> params)
			throws Exception {
		return client.queryForList("chatroom.getChatList",params);
	}

	@Override
	public void closeRoom(Map<String, String> params) throws Exception {
		client.update("chatroom.closeRoom",params);
	}
	

}
