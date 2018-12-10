package kr.or.ddit.chat.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ChatJoinVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;


@Repository
public class IChatJoinDaoImpl implements IChatJoinDao{
	@Autowired
	private SqlMapClient client;

	@Override
	public void insertChatJoin(List<ChatJoinVO> cjl) throws Exception {
		for(ChatJoinVO cjv : cjl){
			client.insert("chatjoin.insertChatJoin",cjv);
		}
	}

	@Override
	public void joinRoom(ChatJoinVO cjv) throws Exception {
		client.update("chatjoin.joinRoom",cjv);
	}

	@Override
	public void deleteRoom(ChatJoinVO cjv) throws Exception {
		client.update("chatjoin.deleteRoom",cjv);
	}

	@Override
	public int joinCount(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("chatjoin.joinCount",params);
	}

	@Override
	public String invList(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("chatjoin.invList",params);
	}
}
