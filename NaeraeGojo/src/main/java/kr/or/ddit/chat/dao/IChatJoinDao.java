package kr.or.ddit.chat.dao;

import java.util.List;

import kr.or.ddit.vo.ChatJoinVO;


public interface IChatJoinDao {

	void insertChatJoin(List<ChatJoinVO> cjl) throws Exception;
}
