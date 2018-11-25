package kr.or.ddit.computationoutdoc.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.ComputationOutDocVO;

@Repository("computationOutDocDao")
public class IComputationOutDocDaoImpl implements  IComputationOutDocDao{

	@Resource
	private SqlMapClient client;
	
	@Override
	public ComputationOutDocVO computationOutDocInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ComputationOutDocVO> computationOutDocList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertComputationOutDocInfo(
			ComputationOutDocVO computationOutDocInfo) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteComputationOutDocInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateComputationOutDocInfo(
			ComputationOutDocVO computationOutDocInfo) throws SQLException {
		// TODO Auto-generated method stub
		
	}

}
