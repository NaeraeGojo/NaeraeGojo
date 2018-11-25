package kr.or.ddit.certfc.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CertfcVO;


public interface ICertfcDao {
	public CertfcVO certfcInfo(Map<String,String> params) throws SQLException;
	public List<CertfcVO> certfcList(Map<String, String> params) throws SQLException;
	public void insertCertfcInfo(CertfcVO certfcInfo) throws SQLException;
	public void deleteCertfcInfo(Map<String,String> params) throws SQLException;
	public void updateCertfcInfo(CertfcVO certfcInfo) throws SQLException;
}
