package kr.or.ddit.proproduct.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProProductVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IProProductDaoImpl implements IProProductDao{
	@Autowired
	private SqlMapClient client;

	@Override
	public void insertProProduct(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateProProduct(ProProductVO ppv) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteProProduct(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<ProProductVO> getProProductList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProProductVO getProProduct(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
