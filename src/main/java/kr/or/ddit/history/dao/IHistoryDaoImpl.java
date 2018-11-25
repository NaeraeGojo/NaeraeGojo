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
	public HistoryVO historyInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<HistoryVO> historyList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertHistoryInfo(HistoryVO historyInfo) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteHistoryInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateHistoryInfo(HistoryVO historyInfo) throws SQLException {
		// TODO Auto-generated method stub
		
	}

}
