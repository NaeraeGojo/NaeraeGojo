package kr.or.ddit.history.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.HistoryVO;


public interface IHistoryDao {
	public HistoryVO historyInfo(Map<String,String> params) throws SQLException;
	public List<HistoryVO> historyList(Map<String, String> params) throws SQLException;
	public String insertHistoryInfo(HistoryVO historyInfo) throws SQLException;
	public void deleteHistoryInfo(Map<String,String> params) throws SQLException;
	public void updateHistoryInfo(HistoryVO historyInfo) throws SQLException;
}
