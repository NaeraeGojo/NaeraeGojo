package kr.or.ddit.emp.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.UserFileVO;


public interface IEmpDao {
	public EmpVO empInfo(Map<String,String> params) throws SQLException;
	public void empInfoW(Map<String,String> params) throws SQLException;
	public List<EmpVO> empList(Map<String, String> params) throws SQLException;
	public String insertEmpInfo(EmpVO empInfo) throws SQLException;
	public void insertUserFile(List<UserFileVO> ufv) throws SQLException;
	public UserFileVO userFileInfo(Map<String, String> params) throws SQLException;
	public EmpVO empNum(Map<String,String> params) throws SQLException;
	public EmpVO empPass(Map<String,String> params) throws SQLException;
	public void deleteEmpInfo(Map<String,String> params) throws SQLException;
	public void updateUserFile(List<UserFileVO> ufv) throws SQLException;
	public void updateEmpInfo(EmpVO empInfo) throws SQLException;
//	public int totalCount(Map<String, String> params) throws SQLException;
//	public String findEmpId(Map<String,String>params) throws SQLException;
	
}
