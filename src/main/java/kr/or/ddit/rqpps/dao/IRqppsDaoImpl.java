package kr.or.ddit.rqpps.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.RqppsVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IRqppsDaoImpl implements IRqppsDao{
	@Autowired
	private SqlMapClient client;


	@Override
	public void updateRqpps(RqppsVO rqv) throws SQLException {
		client.update("rqpps.updateRfp" , rqv);
	}

	@Override
	public void deleteRqpps(Map<String, String> params) throws SQLException {
		client.update("rqpps.deleteRfp",params);
	}

	@Override
	public List<RqppsVO> getRqppsList(Map<String, String> params)
			throws SQLException {
		return client.queryForList("rqpps.getRqppsList",params);
	}

	@Override
	public RqppsVO getRqpps(Map<String, String> params) throws SQLException {
		return (RqppsVO) client.queryForObject("rqpps.getRqpps",params);
	}

	@Override
	public String insertRqpps(RqppsVO rqv) throws SQLException {
		return (String) client.insert("rqpps.insertRfp",rqv);
	}
	
	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		return (int) client.queryForObject("rqpps.totalCount",params);
	}

	@Override
	public List<RqppsVO> getMyRfp(Map<String, String> params)
			throws SQLException {
		return client.queryForList("rqpps.getMyRfp",params);
	}

	@Override
	public void updateRfpCondition(Map<String, String> params)
			throws SQLException {
		client.update("rqpps.updateRfpCondition",params);
	}

}
