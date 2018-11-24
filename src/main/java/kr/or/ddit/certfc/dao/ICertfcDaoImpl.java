package kr.or.ddit.certfc.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.CertfcVO;

@Repository("certfcDao")
public class ICertfcDaoImpl implements ICertfcDao {
	
	@Resource
	private SqlMapClient client;
	
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
