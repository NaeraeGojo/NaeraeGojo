package kr.or.ddit.suggest.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.SuggestVO;

public interface ISuggestDao {
	public String insertSuggest(SuggestVO sv) throws SQLException;
	
	public void updateSuggest(SuggestVO sv) throws SQLException;
	
	public void deleteSuggest(Map<String, String> params) throws SQLException;
	
	public List<SuggestVO> getSuggestList(Map<String, String> params) throws SQLException;
	
	public SuggestVO getSuggest(Map<String, String> params) throws SQLException;
	
	public int totalCount(Map<String, String> params) throws SQLException;
	
}
