package kr.or.ddit.videochatjoin.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.VideoChatJoinVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IVideoChatJoinDaoImpl implements IVideoChatJoinDao{
	@Autowired
	private SqlMapClient client;

	@Override
	public void insertVideoChatJoin(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateVideoChatJoin(VideoChatJoinVO vcrv) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteVideoChatJoin(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<VideoChatJoinVO> getVideoChatJoinList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public VideoChatJoinVO getVideoChatJoin(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
