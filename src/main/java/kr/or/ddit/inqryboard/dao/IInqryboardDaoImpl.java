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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<InqryBoardVO> inqryBoardList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertInqryBoardInfo(InqryBoardVO inqryBoardInfo)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteInqryBoardInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateInqryBoardInfo(InqryBoardVO inqryBoardInfo)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

}
