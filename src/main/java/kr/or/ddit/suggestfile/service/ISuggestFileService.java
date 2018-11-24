package kr.or.ddit.suggestfile.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.SuggestFileVO;

public interface ISuggestFileService {
	public void insertSuggestFile(Map<String, String> params) throws SQLException;
	
	public void updateSuggestFile(SuggestFileVO sfv) throws SQLException;
	
	public void deleteSuggestFile(Map<String, String> params) throws SQLException;
	
	public List<SuggestFileVO> getSuggestFileList(Map<String, String> params) throws SQLException;
	
	public SuggestFileVO getSuggestFile(Map<String, String> params) throws SQLException;
	
	
}
