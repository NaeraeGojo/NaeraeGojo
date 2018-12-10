package kr.or.ddit.chat.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ChatJoinVO;


public interface IChatJoinDao {

	void insertChatJoin(List<ChatJoinVO> cjl) throws Exception;

	void joinRoom(ChatJoinVO cjv) throws Exception;

	void deleteRoom(ChatJoinVO cjv) throws Exception;

	int joinCount(Map<String, String> params) throws Exception;

	String invList(Map<String, String> params) throws Exception;

	String lastNum(Map<String, String> params) throws Exception;
}
