package kr.or.ddit.chat.service;


import java.util.List;

import kr.or.ddit.chat.dao.IChatJoinDao;
import kr.or.ddit.vo.ChatJoinVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IChatJoinServiceImpl implements IChatJoinService{
	@Autowired
	private IChatJoinDao dao;

	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW , rollbackFor={Exception.class})
	public void insertChatJoin(List<ChatJoinVO> cjl) throws Exception {
		dao.insertChatJoin(cjl);
	}
	
}
