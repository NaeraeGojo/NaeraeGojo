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
