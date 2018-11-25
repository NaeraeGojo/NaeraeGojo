package kr.or.ddit.admin.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.AdminVO;

@Repository("adminDao")
public class IAdminDaoImpl implements IAdminDao{
	
	// 1312313123
	@Resource
	private SqlMapClient client;
	
	@Override
	public AdminVO adminInfo(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AdminVO> adminList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	
}
