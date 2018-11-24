package kr.or.ddit.scheduler.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.SchedulerVO;

public interface ISchedulerService {
	public void insertScheduler(Map<String, String> params) throws SQLException;
	
	public void updateScheduler(SchedulerVO pv) throws SQLException;
	
	public void deleteScheduler(Map<String, String> params) throws SQLException;
	
	public List<SchedulerVO> getSchedulerList(Map<String, String> params) throws SQLException;
	
	public SchedulerVO getScheduler(Map<String, String> params) throws SQLException;
}
