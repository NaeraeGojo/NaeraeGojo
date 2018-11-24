package kr.or.ddit.pblancproduct.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.PblancProductVO;


public interface IPblancProductDao {
	public PblancProductVO pblancProductInfo(Map<String,String> params) throws SQLException;
	public List<PblancProductVO> pblancProductList(Map<String, String> params) throws SQLException;
	public void insertPblancProductInfo(PblancProductVO pblancProductInfo) throws SQLException;
	public void deletePblancProductInfo(Map<String,String> params) throws SQLException;
	public void updatePblancProductInfo(PblancProductVO pblancProductInfo) throws SQLException;
}
