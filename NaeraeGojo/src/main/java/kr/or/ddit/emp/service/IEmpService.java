package kr.or.ddit.emp.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.EmpVO;

public interface IEmpService {
	public EmpVO empInfo(Map<String,String> params) throws SQLException;
	public void empInfoW(Map<String,String> params) throws SQLException;
	public List<EmpVO> empList(Map<String, String> params) throws SQLException;
	public void insertEmpInfo(EmpVO empInfo) throws SQLException;
	public void deleteEmpInfo(Map<String,String> params) throws SQLException;
	public void updateEmpInfo(EmpVO empInfo) throws SQLException;
	public EmpVO empNum(Map<String,String> params) throws SQLException;
//	public int totalCount(Map<String, String> params) throws SQLException;
//	public String findEmpId(Map<String, String>params) throws SQLException;
	
//	public void updateHit(Map<String, String> params) throws SQLException;
	
}
