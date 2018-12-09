package kr.or.ddit.inqryboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.InqryBoardVO;

@Repository("")
public class IInqryboardDaoImpl implements IInqryboardDao{

	@Resource
	private SqlMapClient client;
	
	@Override
	public InqryBoardVO inqryBoardInfo(Map<String, String> params)
			throws SQLException {
		return (InqryBoardVO) client.queryForObject("inqryboard.inqryInfo", params);
	}

	@Override
	public List<InqryBoardVO> inqryBoardList(Map<String, String> params)
			throws SQLException {
		return client.queryForList("inqryboard.inqryList", params);
	}

	@Override
	public String insertInqryInfo(InqryBoardVO inqryBoardInfo)
			throws SQLException {
		return (String) client.insert("inqryboard.insertInqry", inqryBoardInfo);
	}

	@Override
	public void deleteInqryInfo(Map<String, String> params) throws SQLException {
		client.update("inqryboard.deleteInqry", params);
	}

	@Override
	public void updateInqryInfo(InqryBoardVO inqryBoardInfo)
			throws SQLException {
		client.update("inqryboard.updateInqry", inqryBoardInfo);
	}

	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		return (int) client.queryForObject("inqryboard.totalCount", params);
	}

}
