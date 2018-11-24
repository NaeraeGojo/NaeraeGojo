package kr.or.ddit.computation.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.ComputationVO;

@Repository("computationDao")
public class IComputationDaoImpl implements IComputationDao{
	
	@Resource
	private SqlMapClient client;
	
	@Override
	public ComputationVO computationInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ComputationVO> computationList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertComputationInfo(ComputationVO computationInfo)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteComputationInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateComputationInfo(ComputationVO computationInfo)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

}
