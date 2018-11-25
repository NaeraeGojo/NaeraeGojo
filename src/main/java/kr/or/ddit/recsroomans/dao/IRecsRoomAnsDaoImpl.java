package kr.or.ddit.recsroomans.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.RecsRoomAnsVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IRecsRoomAnsDaoImpl implements IRecsRoomAnsDao{
	@Autowired
	private SqlMapClient client;

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
