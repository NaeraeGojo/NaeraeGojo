package kr.or.ddit.chat.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ChatRoomVO;


public interface IChatRoomService {

	String insertChatRoom(ChatRoomVO crv) throws Exception;

	List<ChatRoomVO> getChatList(Map<String, String> params) throws Exception;

	void closeRoom(Map<String, String> params) throws Exception;


}
