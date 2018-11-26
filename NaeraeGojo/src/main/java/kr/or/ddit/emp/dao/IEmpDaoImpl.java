package kr.or.ddit.emp.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.EmpVO;

@Repository("")
public class IEmpDaoImpl implements IEmpDao{

	@Resource
	private SqlMapClient client;
	
	@Override
	public EmpVO empInfo(Map<String, String> params) throws SQLException {
		return (EmpVO) client.queryForObject("emp.empInfo", params);
	}

	@Override
	public void empInfoW(Map<String, String> params) throws SQLException {
		client.update("emp.empInfoW", params);
	}

	@Override
	public List<EmpVO> empList(Map<String, String> params) throws SQLException {
		return client.queryForList("emp.empList", params);
	}

	@Override
	public String insertEmpInfo(EmpVO empInfo) throws SQLException {
		return (String) client.insert("emp.insertEmpInfo", empInfo);
	}

	@Override
	public void deleteEmpInfo(Map<String, String> params) throws SQLException {
		client.update("emp.deleteEmpInfo", params);
		
	}

	@Override
	public void updateEmpInfo(EmpVO empInfo) throws SQLException {
		client.update("emp.updateEmpInfo", empInfo);
	}

//	@Override
//	public int totalCount(Map<String, String> params) throws SQLException {
//		return (int) client.queryForObject("emp.totalCount", params);
//	}

//	@Override
//	public String findEmpId(Map<String, String> params) throws SQLException {
//		return (String) client.queryForObject("emp.findEmpId", params);
//	}

}
