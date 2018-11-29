package kr.or.ddit.history.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.HistoryVO;

@Repository("")
public class IHistoryDaoImpl implements IHistoryDao{

	@Resource
	private SqlMapClient client;
	
	@Override
	public HistoryVO historyInfo(Map<String, String> params) throws SQLException {
		return (HistoryVO) client.queryForObject("emp.historyInfo", params);
	}

	@Override
	public List<HistoryVO> historyList(Map<String, String> params)
			throws SQLException {
		return client.queryForList("emp.historyList", params);
	}

	@Override
	public String insertHistoryInfo(HistoryVO historyInfo) throws SQLException {
		return (String) client.insert("emp.insertHistory", historyInfo);
	}

	@Override
	public void deleteHistoryInfo(Map<String, String> params)
			throws SQLException {
		client.update("emp.deleteHistory", params);
	}

	@Override
	public void updateHistoryInfo(HistoryVO historyInfo) throws SQLException {
		client.update("emp.updateHistory", historyInfo);
		
	}
}
