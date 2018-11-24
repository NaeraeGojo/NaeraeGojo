package kr.or.ddit.allfile.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AllFileVO;
import kr.or.ddit.vo.SuggestFileVO;

public interface IAllFileService {
	public void insertAllFile(Map<String, String> params) throws SQLException;
	
	public void updateAllFile(AllFileVO afv) throws SQLException;
	
	public void deleteAllFile(Map<String, String> params) throws SQLException;
	
	public List<AllFileVO> getAllFileList(Map<String, String> params) throws SQLException;
	
	public AllFileVO getAllFile(Map<String, String> params) throws SQLException;
}
