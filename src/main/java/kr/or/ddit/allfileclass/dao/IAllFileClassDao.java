package kr.or.ddit.allfileclass.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AllFileClassVO;


public interface IAllFileClassDao {
	public AllFileClassVO allFileClassInfo(Map<String,String> params) throws SQLException;
	public List<AllFileClassVO> allFileClassList(Map<String, String> params) throws SQLException;
	public void insertAllfileClassInfo(AllFileClassVO allFileClassInfo) throws SQLException;
	public void deleteAllfileClassInfo(Map<String,String> params) throws SQLException;
	public void updateAllfileClassInfo(AllFileClassVO allFileClassInfo) throws SQLException;
}
