package kr.or.ddit.suggest.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.SuggestVO;

public interface ISuggestService {
	public void updateSuggest(SuggestVO sv) throws SQLException;
	
	public void deleteSuggest(Map<String, String> params) throws SQLException;
	
	public List<SuggestVO> getSuggestList(Map<String, String> params) throws SQLException;
	
	public SuggestVO getSuggest(Map<String, String> params) throws SQLException;
	
	public int totalCount(Map<String, String> params) throws SQLException;

	public void insertSuggest(SuggestVO sv, MultipartFile[] files) throws SQLException;
}
