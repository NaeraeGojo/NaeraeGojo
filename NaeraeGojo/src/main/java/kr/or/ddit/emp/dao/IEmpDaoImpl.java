package kr.or.ddit.emp.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.UserFileVO;

@Repository("")
public class IEmpDaoImpl implements IEmpDao{

	@Resource
	private SqlMapClient client;
	
	@Override
	public EmpVO empInfo(Map<String, String> params) throws SQLException {
		return (EmpVO) client.queryForObject("emp.empInfo", params);
	}
	
//	@Override
//	public List<EmpVO> empPhotoList(Map<String, String> params) throws SQLException {
//		return client.queryForList("emp.empPhotoList", params);
//	}

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

	@Override
	public EmpVO empNum(Map<String, String> params) throws SQLException {
		return (EmpVO) client.queryForObject("emp.empNum", params);
		
	}
	@Override
	public EmpVO empMail(Map<String, String> params) throws SQLException {
		return (EmpVO) client.queryForObject("emp.empEmail", params);
	}

	@Override
	public EmpVO empPass(Map<String, String> params) throws SQLException {
		return (EmpVO) client.queryForObject("emp.empPass", params);
	}

	@Override
	public void insertUserFile(List<UserFileVO> ufv) throws SQLException {
		for(UserFileVO userFileList : ufv){
			client.insert("userFile.insertUserFile", userFileList);
		}
		
	}

	@Override
	public UserFileVO userFileInfo(Map<String, String> params) throws SQLException {
		return (UserFileVO) client.queryForObject("userFile.userFileInfo", params);
	}

	@Override
	public void updateUserFile(List<UserFileVO> ufv) throws SQLException {
		try{
			client.startTransaction();
			for(UserFileVO userFileList : ufv){
				client.update("userFile.updateUserFile", userFileList);
			}
			client.commitTransaction();
		}finally{
			client.endTransaction();
		}
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
