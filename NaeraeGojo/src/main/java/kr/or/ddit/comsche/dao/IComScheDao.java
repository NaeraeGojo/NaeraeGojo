package kr.or.ddit.comsche.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ComScheVO;


public interface IComScheDao {
	public ComScheVO comScheInfo(Map<String,String> params) throws SQLException;
	public List<ComScheVO> comScheList(Map<String, String> params) throws SQLException;
	public void insertComScheInfo(ComScheVO comScheInfo) throws SQLException;
	public void deleteComScheInfo(Map<String,String> params) throws SQLException;
	public void updateComScheInfo(ComScheVO comScheInfo) throws SQLException;
}
