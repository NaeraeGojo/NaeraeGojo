package kr.or.ddit.history.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.history.dao.IHistoryDao;
import kr.or.ddit.vo.HistoryVO;

@Service
public class IHistoryServiceImpl implements IHistoryService{

	@Autowired
	private IHistoryDao historyDao;
	
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
