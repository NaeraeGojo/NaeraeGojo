package kr.or.ddit.chat.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ChatJoinVO;


public interface IChatJoinService {

	void insertChatJoin(List<ChatJoinVO> cjl) throws Exception;

	void joinRoom(ChatJoinVO cjv) throws Exception;

	void deleteRoom(ChatJoinVO cjv) throws Exception;

	int joinCount(Map<String, String> params) throws Exception;

}
