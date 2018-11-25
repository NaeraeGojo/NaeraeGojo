package kr.or.ddit.mp.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MpVO;

public interface IMpDao {
	public MpVO mpInfo (Map<String, String> params) throws SQLException;
	public List<MpVO> mpList(Map<String, String> params) throws SQLException;
	
	public String insertMp(MpVO mv) throws SQLException;
	public void updateMp(MpVO mv) throws SQLException;
}
