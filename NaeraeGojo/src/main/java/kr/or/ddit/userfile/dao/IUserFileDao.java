 package kr.or.ddit.userfile.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.UserFileVO;

public interface IUserFileDao {
	public void insertUserFile(UserFileVO ufv) throws SQLException; 
	 
	public void updateUserFile(UserFileVO ufv) throws SQLException; 
	
	public void deleteUserFile(Map<String, String> params) throws SQLException;
	
	public List<UserFileVO> userFileList(Map<String, String> params) throws SQLException;
	
	public UserFileVO userFileInfo(Map<String, String> params) throws SQLException;  
	
}
