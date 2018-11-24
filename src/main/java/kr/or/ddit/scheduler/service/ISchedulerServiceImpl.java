package kr.or.ddit.scheduler.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.scheduler.dao.ISchedulerDao;
import kr.or.ddit.vo.SchedulerVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ISchedulerServiceImpl implements ISchedulerService{
	@Autowired
	private ISchedulerDao dao;

	@Override
	public void insertScheduler(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateScheduler(SchedulerVO pv) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteScheduler(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<SchedulerVO> getSchedulerList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SchedulerVO getScheduler(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
