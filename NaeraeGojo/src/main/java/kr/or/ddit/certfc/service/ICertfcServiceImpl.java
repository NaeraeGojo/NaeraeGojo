package kr.or.ddit.certfc.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.certfc.dao.ICertfcDao;
import kr.or.ddit.vo.CertfcVO;

@Service
public class ICertfcServiceImpl implements ICertfcService{

	@Autowired
	private ICertfcDao  certfcDao;
	
	@Override
	public CertfcVO certfcInfo(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CertfcVO> certfcList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertCertfcInfo(CertfcVO certfcInfo) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteCertfcInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateCertfcInfo(CertfcVO certfcInfo) throws SQLException {
		// TODO Auto-generated method stub
		
	}

}
