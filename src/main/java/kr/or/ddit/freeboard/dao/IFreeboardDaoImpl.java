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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FreeBoardVO> freeboardList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertFreeboardInfo(FreeBoardVO freeboardInfo)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteFreeboardInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateFreeboardInfo(FreeBoardVO freeboardInfo)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

}
