package kr.or.ddit.sanctn.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.SanCtnVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ISanCtnDaoImpl implements ISanCtnDao{
	@Autowired
	private SqlMapClient client;

	@Override
	public void insertSanCtn(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateSanCtn(SanCtnVO pv) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteSanCtn(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<SanCtnVO> getSanCtnList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SanCtnVO getSanCtn(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
