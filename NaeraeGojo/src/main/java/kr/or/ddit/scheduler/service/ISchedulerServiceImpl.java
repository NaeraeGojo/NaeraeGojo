package kr.or.ddit.scheduler.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.scheduler.dao.ISchedulerDao;
import kr.or.ddit.vo.SchedulerVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ISchedulerServiceImpl implements ISchedulerService{

	@Autowired
	private ISchedulerDao dao;

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={Exception.class})
	@Override
	public SchedulerVO schedulerInfo(Map<String, String> params) throws SQLException {
		return dao.schedulerInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<SchedulerVO> schedulerList(Map<String, String> params) throws SQLException {
		return dao.schedulerList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void insertScheduler(SchedulerVO schedulerInfo) throws SQLException {
		dao.insertScheduler(schedulerInfo);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void updateScheduler(SchedulerVO schedulerInfo) throws SQLException {
		dao.updateScheduler(schedulerInfo);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={Exception.class})
	@Override
	public void deleteScheduler(Map<String, String> params) throws SQLException {
		dao.deleteScheduler(params);
	}

	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		int totalCount = 0;
		try {
			totalCount = dao.totalCount(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return totalCount;
	}
}
