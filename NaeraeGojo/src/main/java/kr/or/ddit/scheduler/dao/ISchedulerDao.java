package kr.or.ddit.scheduler.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.SchedulerVO;

public interface ISchedulerDao {
	public SchedulerVO schedulerInfo(Map<String, String> params) throws SQLException;
	public List<SchedulerVO> schedulerList(Map<String, String> params) throws SQLException;
	public void insertScheduler(SchedulerVO schedulerInfo) throws SQLException;
	public void updateScheduler(SchedulerVO schedulerInfo) throws SQLException;
	public void deleteScheduler(Map<String, String> params) throws SQLException;
	public void changeScheduler(Map<String, String> params) throws SQLException;
	public int totalCount(Map<String, String> params) throws SQLException;
	
}
