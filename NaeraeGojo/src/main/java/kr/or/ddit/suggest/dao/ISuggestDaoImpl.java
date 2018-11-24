package kr.or.ddit.suggest.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.SuggestVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ISuggestDaoImpl implements ISuggestDao{
	@Autowired
	private SqlMapClient client;

	@Override
	public void updateSuggest(SuggestVO sv) throws SQLException {
		client.update("suggest.updateSuggest",sv);
	}

	@Override
	public void deleteSuggest(Map<String, String> params) throws SQLException {
		client.update("suggest.deleteSuggest",params);
	}

	@Override
	public List<SuggestVO> getSuggestList(Map<String, String> params)
			throws SQLException {
		return client.queryForList("suggest.getSuggestList",params);
	}

	@Override
	public SuggestVO getSuggest(Map<String, String> params) throws SQLException {
		return (SuggestVO) client.queryForObject("suggest.getSuggest",params);
	}

	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		return (int) client.queryForObject("suggest.totalCount",params);
	}

	@Override
	public String insertSuggest(SuggestVO sv) throws SQLException {
		return (String) client.insert("suggest.insertSuggest",sv);
	}

}
