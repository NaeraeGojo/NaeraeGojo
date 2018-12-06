package kr.or.ddit.chat.dao;

import kr.or.ddit.vo.ChatRoomVO;


public interface IChatRoomDao {

	String insertChatRoom(ChatRoomVO crv) throws Exception;
}
