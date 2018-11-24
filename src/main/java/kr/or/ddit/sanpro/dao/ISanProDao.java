package kr.or.ddit.sanpro.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.SanProVO;

public interface ISanProDao {
	public void insertSanPro(Map<String, String> params) throws SQLException;
	
	public void updateSanPro(SanProVO pv) throws SQLException;
	
	public void deleteSanPro(Map<String, String> params) throws SQLException;
	
	public List<SanProVO> getSanProList(Map<String, String> params) throws SQLException;
	
	public SanProVO getSanPro(Map<String, String> params) throws SQLException;
	
}
