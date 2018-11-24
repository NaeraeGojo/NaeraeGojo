package kr.or.ddit.recsroomans.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.recsroomans.dao.IRecsRoomAnsDao;
import kr.or.ddit.vo.RecsRoomAnsVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IRecsRoomAnsServiceImpl implements IRecsRoomAnsService {
	@Autowired
	private IRecsRoomAnsDao dao;

	@Override
	public void insertRecsRoomAns(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateRecsRoomAns(RecsRoomAnsVO rrav) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteRecsRoomAns(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<RecsRoomAnsVO> getRecsRoomAnsList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RecsRoomAnsVO getRecsRoomAns(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
