package kr.or.ddit.qnaboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.QnABoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IQnAboardDaoImpl implements IQnAboardDao{
	@Autowired
	private SqlMapClient client;

	@Override
	public void insertQnAboard(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateQnAboard(QnABoardVO qv) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteQnAboard(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<QnABoardVO> getQnAboardList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public QnABoardVO getQnAboard(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
