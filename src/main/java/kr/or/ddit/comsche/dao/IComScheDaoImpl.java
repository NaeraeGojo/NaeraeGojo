package kr.or.ddit.comsche.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.ComScheVO;

@Repository()
public class IComScheDaoImpl implements IComScheDao{

	@Resource
	private SqlMapClient client;
	
	@Override
	public ComScheVO comScheInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ComScheVO> comScheList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertComScheInfo(ComScheVO comScheInfo) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteComScheInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateComScheInfo(ComScheVO comScheInfo) throws SQLException {
		// TODO Auto-generated method stub
		
	}

}
