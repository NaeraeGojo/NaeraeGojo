package kr.or.ddit.allfileclass.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.AllFileClassVO;

@Repository("")
public class IAllFileClassDaoImpl implements IAllFileClassDao{

	@Resource
	private SqlMapClient client;
	
	@Override
	public AllFileClassVO allFileClassInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AllFileClassVO> allFileClassList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertAllfileClassInfo(AllFileClassVO allFileClassInfo)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAllfileClassInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateAllfileClassInfo(AllFileClassVO allFileClassInfo)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

}
