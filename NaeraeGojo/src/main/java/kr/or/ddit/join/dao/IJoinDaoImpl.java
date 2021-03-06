package kr.or.ddit.join.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.MpJoinVO;
import kr.or.ddit.vo.MpVO;
import kr.or.ddit.vo.PositionVO;
import kr.or.ddit.vo.ReportVO;
import kr.or.ddit.vo.RqppsVO;

@Repository("")
public class IJoinDaoImpl implements IJoinDao{

	@Resource
	private SqlMapClient client;
	
	@Override
	public JoinVO joinInfo(Map<String, String> params) throws SQLException {
		return (JoinVO) client.queryForObject("join.joinInfo",params);
	}

	@Override
	public List<JoinVO> joinList(Map<String, String> params)
			throws SQLException {
		return client.queryForList("join.joinList",params);
	}

	@Override
	public void insertJoinInfo(Map<String, String> params) throws SQLException {
		client.insert("join.insertJoin",params);
	}

	@Override
	public void deleteJoinInfo(Map<String, String> params) throws SQLException {
		client.update("join.deleteJoin",params);
	}

	@Override
	public void updateJoinInfo(JoinVO joinInfo) throws SQLException {
		client.update("join.updateJoin",joinInfo);
	}

	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		return (int) client.queryForObject("join.totalCount",params);
	}

	@Override
	public List<RqppsVO> rqppsNm(Map<String, String> params) throws SQLException {
		return client.queryForList("join.rqppsNm",params);
	}

	@Override
	public MpJoinVO mpList(Map<String, String> params) throws SQLException {
		return (MpJoinVO) client.queryForObject("join.mpList",params);
	}

	@Override
	public List<EmpVO> empList1(Map<String, String> params) throws SQLException {
		return client.queryForList("join.empList1",params);
	}

	@Override
	public List<JoinVO> joinFinalList(Map<String, String> params) throws SQLException {
		return client.queryForList("join.joinFinalList",params);
	}

	@Override
	public List<JoinVO> clickList(Map<String, String> params)
			throws SQLException {
		return client.queryForList("join.clickList",params);
	}

	@Override
	public void updateRole(JoinVO jvo) throws SQLException {
		client.update("join.updateRole",jvo);
	}

	@Override
	public List<JoinVO> addList(Map<String, String> params) throws SQLException {
		return client.queryForList("join.addList", params);
	}

	@Override
	public String insertAdd(JoinVO jvo) throws SQLException {
		return (String) client.insert("join.insertAdd",jvo);
	}

	@Override
	public void deleteAdd(Map<String, String> params) throws SQLException {
		client.delete("join.deleteAdd",params);
	}

	@Override
	public void insertJoinInfoRqpps(Map<String, String> params)
			throws SQLException {
		client.insert("join.insertJoinRqpps",params);
		
	}

	@Override
	public void updateStatus(Map<String, String> params) throws SQLException {
		client.update("join.updateStatus",params);
	}

	@Override
	public List<EmpVO> insertList(Map<String, String> params) throws SQLException{
		return client.queryForList("join.insertList", params);
	}

	@Override
	public List<PositionVO> getPositionList() throws SQLException {
		return client.queryForList("join.getPositionList");
	}

}
