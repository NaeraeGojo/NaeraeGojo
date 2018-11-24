package kr.or.ddit.userfile.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.UserFileVO;

public interface IUserFileService {
	public void insertUserFile(Map<String, String> params) throws SQLException;
	
	public void updateUserFile(UserFileVO ufv) throws SQLException;
	
	public void deleteUserFile(Map<String, String> params) throws SQLException;
	
	public List<UserFileVO> getUserFileList(Map<String, String> params) throws SQLException;
	
	public UserFileVO getUserFile(Map<String, String> params) throws SQLException;
}
