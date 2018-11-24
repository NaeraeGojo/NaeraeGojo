package kr.or.ddit.freeboardans.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.FreeBoardAnsVO;

@Repository("")
public class IFreeboardAnsDaoImpl implements IFreeboardAnsDao{

	@Resource
	private SqlMapClient client;
	
	@Override
	public FreeBoardAnsVO freeboardAnsInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FreeBoardAnsVO> freeboardAnsList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertFreeboardAnsInfo(FreeBoardAnsVO freeboardAnsInfo)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteFreeboardAnsInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateFreeboardAnsInfo(FreeBoardAnsVO freeboardAnsInfo)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

}
