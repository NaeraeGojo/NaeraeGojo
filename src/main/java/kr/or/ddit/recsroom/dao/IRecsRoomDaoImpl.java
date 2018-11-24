package kr.or.ddit.recsroom.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.RecsRoomVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IRecsRoomDaoImpl implements IRecsRoomDao{
	@Autowired
	private SqlMapClient client;

	@Override
	public void insertRecsRoom(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateRecsRoom(RecsRoomVO rv) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteRecsRoom(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<RecsRoomVO> getRecsRoomList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RecsRoomVO getRecsRoom(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
