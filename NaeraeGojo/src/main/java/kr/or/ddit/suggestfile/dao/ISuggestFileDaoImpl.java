package kr.or.ddit.suggestfile.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.SuggestFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ISuggestFileDaoImpl implements ISuggestFileDao{
	@Autowired
	private SqlMapClient client;

	@Override
	public void updateSuggestFile(SuggestFileVO sfv) throws SQLException {
		client.update("suggfi.updateSuggfi",sfv);
	}

	@Override
	public void deleteSuggestFile(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<SuggestFileVO> getSuggestFileList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SuggestFileVO getSuggestFile(Map<String, String> params)
			throws SQLException {
		return (SuggestFileVO) client.queryForObject("suggfi.getSuggestFile", params);
	}

	@Override
	public void insertSuggestFile(SuggestFileVO sfv) throws SQLException {
		client.insert("suggfi.insertSuggfi",sfv);
	}

}
