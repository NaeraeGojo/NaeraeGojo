package kr.or.ddit.chat.dao;

import java.util.List;

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
}