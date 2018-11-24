package kr.or.ddit.sanpro.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.SanProVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ISanProDaoImpl implements ISanProDao{
	@Autowired
	private SqlMapClient client;

	@Override
	public void insertSanPro(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateSanPro(SanProVO pv) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteSanPro(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<SanProVO> getSanProList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SanProVO getSanPro(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
