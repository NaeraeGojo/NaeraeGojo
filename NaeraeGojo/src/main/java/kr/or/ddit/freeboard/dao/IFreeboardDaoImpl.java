package kr.or.ddit.freeboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.FreeBoardAnsVO;
import kr.or.ddit.vo.FreeBoardVO;

@Repository("")
public class IFreeboardDaoImpl implements IFreeboardDao{

	@Resource
	private SqlMapClient client;
	
	@Override
	public FreeBoardVO freeboardInfo(Map<String, String> params)
			throws SQLException {
		return (FreeBoardVO) client.queryForObject("freeboard.freeboardInfo", params);
	}

	@Override
	public List<FreeBoardVO> freeboardList(Map<String, String> params)
			throws SQLException {
		return client.queryForList("freeboard.freeboardList", params);
	}

	@Override
	public String insertFreeboardInfo(FreeBoardVO freeboardInfo)
			throws SQLException {
		return (String) client.insert("freeboard.insertFreeboard", freeboardInfo);
	}

	@Override
	public void deleteFreeboardInfo(Map<String, String> params)
			throws SQLException {
		client.update("freeboard.deleteFreeboard", params);
	}

	@Override
	public void updateFreeboardInfo(FreeBoardVO freeboardInfo)
			throws SQLException {
		client.update("freeboard.updateFreeboard", freeboardInfo);
	}

	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		return (int) client.queryForObject("freeboard.totalCount", params);
	}

	@Override
	public List<FreeBoardAnsVO> replyFreeList(Map<String, String> params)
			throws Exception {
		return client.queryForList("freeboardAns.replyFreeList", params);
	}

	@Override
	public void insertReply(FreeBoardAnsVO fri) throws Exception {
		client.insert("freeboardAns.insertFreeReply", fri);
	}

	@Override
	public void deleteReply(Map<String, String> params) throws Exception {
		client.update("freeboardAns.deleteFreeReply", params);
	}

	@Override
	public void updateReply(FreeBoardAnsVO fri) throws Exception {
		client.update("freeboardAns.updateFreeReply", fri);
	}

	@Override
	public FreeBoardAnsVO freeReplyInfo(Map<String, String> params)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
