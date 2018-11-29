package kr.or.ddit.scheduler.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.SchedulerVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ISchedulerDaoImpl implements ISchedulerDao{
	@Autowired
	private SqlMapClient client;

	@Override
	public SchedulerVO schedulerInfo(Map<String, String> params) throws SQLException {
		return (SchedulerVO) client.queryForObject("scheduler.schedulerInfo", params);
	}

	@Override
	public List<SchedulerVO> schedulerList(Map<String, String> params) throws SQLException {
		return client.queryForList("scheduler.schedulerList", params);
	}

	@Override
	public void insertScheduler(SchedulerVO schedulerInfo) throws SQLException {
		client.insert("scheduler.insertScheduler", schedulerInfo);
	}

	@Override
	public void updateScheduler(SchedulerVO schedulerInfo) throws SQLException {
		client.update("scheduler.updateScheduler", schedulerInfo);
	}

	@Override
	public void deleteScheduler(Map<String, String> params) throws SQLException {
		client.update("scheduler.deleteScheduler", params);
	}

	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		return (int) client.queryForObject("scheduler.totalCount", params);
	}

}
