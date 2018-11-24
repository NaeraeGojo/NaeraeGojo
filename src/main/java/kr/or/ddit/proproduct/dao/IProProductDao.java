package kr.or.ddit.proproduct.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProProductVO;

public interface IProProductDao {
	public void insertProProduct(Map<String, String> params) throws SQLException;
	
	public void updateProProduct(ProProductVO ppv) throws SQLException;
	
	public void deleteProProduct(Map<String, String> params) throws SQLException;
	
	public List<ProProductVO> getProProductList(Map<String, String> params) throws SQLException;
	
	public ProProductVO getProProduct(Map<String, String> params) throws SQLException;
	
}
