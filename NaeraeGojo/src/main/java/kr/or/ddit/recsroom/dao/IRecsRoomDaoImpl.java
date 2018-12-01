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
	public String insertRecsRoom(RecsRoomVO rrv) throws SQLException {
		return (String) client.insert("recs.insertRecsroom",rrv);
	}

	@Override
	public void updateRecsRoom(RecsRoomVO rrv) throws SQLException {
		client.update("recs.updateRecsroom",rrv);
	}

	@Override
	public void deleteRecsRoom(Map<String, String> params) throws SQLException {
		client.update("recs.deleteRecsroom",params);
	}

	@Override
	public List<RecsRoomVO> getRecsRoomList(Map<String, String> params)
			throws SQLException {
		return client.queryForList("recs.getRecsroomList",params);
	}

	@Override
	public RecsRoomVO getRecsRoom(Map<String, String> params)
			throws SQLException {
		return (RecsRoomVO) client.queryForObject("recs.getRecsroom",params);
	}

	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		return (int) client.queryForObject("recs.totalCount",params);
	}

}
