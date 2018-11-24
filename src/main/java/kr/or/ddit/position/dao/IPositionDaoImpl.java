package kr.or.ddit.position.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.PositionVO;

@Repository("")
public class IPositionDaoImpl implements IPositionDao{

	@Resource
	private SqlMapClient client;
	
	@Override
	public PositionVO positionInfo(Map<String, String> params)
			throws SQLException {
		return (PositionVO) client.queryForObject("position.positionInfo", params);
	}

	@Override
	public List<PositionVO> positionList() throws SQLException {
		return client.queryForList("position.positionList");
	}

//	@Override
//	public void insertPositionInfo(PositionVO positionInfo) throws SQLException {
//		
//	}

//	@Override
//	public void deletePositionInfo(Map<String, String> params)
//			throws SQLException {
//		
//	}

//	@Override
//	public void updatePositionInfo(PositionVO positionInfo) throws SQLException {
//		
//	}

}
