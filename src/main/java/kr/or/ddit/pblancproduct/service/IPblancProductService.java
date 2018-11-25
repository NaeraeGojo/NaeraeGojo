package kr.or.ddit.pblancproduct.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.PblancProductVO;

public interface IPblancProductService {
	public PblancProductVO pblancProductInfo(Map<String,String> params) throws SQLException;
	public List<PblancProductVO> pblancProductList(Map<String, String> params) throws SQLException;
	public void insertPblancProductInfo(PblancProductVO pblancProductInfo) throws SQLException;
	public void deletePblancProductInfo(Map<String,String> params) throws SQLException;
	public void updatePblancProductInfo(PblancProductVO pblancProductInfo) throws SQLException;
}
