package kr.or.ddit.pblancproduct.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.PblancProductVO;

@Repository("")
public class IPblancProductDaoImpl implements IPblancProductDao{

	@Resource
	private SqlMapClient client;
	
	@Override
	public PblancProductVO pblancProductInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PblancProductVO> pblancProductList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertPblancProductInfo(PblancProductVO pblancProductInfo)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deletePblancProductInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updatePblancProductInfo(PblancProductVO pblancProductInfo)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

}
