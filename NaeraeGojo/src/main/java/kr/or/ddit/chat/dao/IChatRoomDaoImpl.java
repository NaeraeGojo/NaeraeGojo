package kr.or.ddit.chat.dao;


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
	

}
