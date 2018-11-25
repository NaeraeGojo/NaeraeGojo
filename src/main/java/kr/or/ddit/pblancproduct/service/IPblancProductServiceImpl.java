package kr.or.ddit.pblancproduct.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.pblancproduct.dao.IPblancProductDao;
import kr.or.ddit.vo.PblancProductVO;

@Service
public class IPblancProductServiceImpl implements IPblancProductService{

	@Autowired
	private IPblancProductDao pblancProductDao;
	
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
