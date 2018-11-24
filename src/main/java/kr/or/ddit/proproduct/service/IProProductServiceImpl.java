package kr.or.ddit.proproduct.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.proproduct.dao.IProProductDao;
import kr.or.ddit.vo.ProProductVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IProProductServiceImpl implements IProProductService{
	@Autowired
	private IProProductDao dao;

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
