package kr.or.ddit.freeboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.FreeBoardVO;

@Repository("")
public class IFreeboardDaoImpl implements IFreeboardDao{

	@Resource
	private SqlMapClient client;
	
	@Override
	public FreeBoardVO freeboardInfo(Map<String, String> params)
			throws SQLException {
		return (FreeBoardVO) client.queryForObject("freeboard.freeboardInfo", params);
	}

	@Override
	public List<FreeBoardVO> freeboardList(Map<String, String> params)
			throws SQLException {
		return client.queryForList("freeboard.freeboardList", params);
	}

	@Override
	public void insertFreeboardInfo(FreeBoardVO freeboardInfo)
			throws SQLException {
		client.insert("freeboard.insertFreeboard", freeboardInfo);
	}

	@Override
	public void deleteFreeboardInfo(Map<String, String> params)
			throws SQLException {
		client.update("freeboard.deleteFreeboard", params);
	}

	@Override
	public void updateFreeboardInfo(FreeBoardVO freeboardInfo)
			throws SQLException {
		client.update("freeboard.updateFreeboard", freeboardInfo);
	}

	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		return (int) client.queryForObject("freeboard.totalCount", params);
	}

}
