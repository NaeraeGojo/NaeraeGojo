package kr.or.ddit.history.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.history.dao.IHistoryDao;
import kr.or.ddit.vo.HistoryVO;

@Service
public class IHistoryServiceImpl implements IHistoryService{

	@Autowired
	private IHistoryDao dao;
	
	@Transactional(readOnly=true)
	@Override
	public HistoryVO historyInfo(Map<String, String> params)
			throws SQLException {
		return dao.historyInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true, rollbackFor={RuntimeException.class, SQLException.class, })
	@Override
	public List<HistoryVO> historyList(Map<String, String> params)
			throws SQLException {
		return dao.historyList(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={RuntimeException.class, SQLException.class, })
	@Override
	public void insertHistoryInfo(HistoryVO historyInfo) throws SQLException {
		String history_code = dao.insertHistoryInfo(historyInfo);
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={RuntimeException.class, SQLException.class, })
	@Override
	public void deleteHistoryInfo(Map<String, String> params)
			throws SQLException {
		dao.deleteHistoryInfo(params);
		
	}
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={RuntimeException.class, SQLException.class, })
	@Override
	public void updateHistoryInfo(HistoryVO historyInfo) throws SQLException {
		dao.updateHistoryInfo(historyInfo);		
	}

}
