package kr.or.ddit.userfile.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.UserFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("")
public class IUserFileDaoImpl implements IUserFileDao{
	
	@Autowired
	private SqlMapClient client;
	
	@Override
	public void insertUserFile(UserFileVO ufv) throws SQLException {
		client.insert("userFile.insertUserFile", ufv);
	}

	@Override
	public void updateUserFile(UserFileVO ufv) throws SQLException {
		client.update("userFile.updateUserFile", ufv);
	}

	@Override
	public void deleteUserFile(Map<String, String> params) throws SQLException {
		client.update("userFile.deleteUserFile", params);
	}

	@Override
	public List<UserFileVO> userFileList(Map<String, String> params)
			throws SQLException {
		return client.queryForList("userFile.userFileList", params);
	}

	@Override
	public UserFileVO userFileInfo(Map<String, String> params)
			throws SQLException {
		return (UserFileVO) client.queryForObject("userFile.userFileInfo", params);
	}

}
