package kr.or.ddit.userfile.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.UserFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IUserFileDaoImpl implements IUserFileDao{
	@Autowired
	private SqlMapClient client;
	
	@Override
	public void insertUserFile(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateUserFile(UserFileVO ufv) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteUserFile(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<UserFileVO> getUserFileList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserFileVO getUserFile(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
