package kr.or.ddit.sanctn.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.SanCtnVO;

public interface ISanCtnDao {
	public void insertSanCtn(Map<String, String> params) throws SQLException;
	
	public void updateSanCtn(SanCtnVO pv) throws SQLException;
	
	public void deleteSanCtn(Map<String, String> params) throws SQLException;
	
	public List<SanCtnVO> getSanCtnList(Map<String, String> params) throws SQLException;
	
	public SanCtnVO getSanCtn(Map<String, String> params) throws SQLException;
	
}
