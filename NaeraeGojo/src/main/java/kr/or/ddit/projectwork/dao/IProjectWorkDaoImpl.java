package kr.or.ddit.projectwork.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProjectWorkVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IProjectWorkDaoImpl implements IProjectWorkDao{
	@Autowired
	private SqlMapClient client;
	
	@Override
	public void insertProjectWork(ProjectWorkVO pwv) throws SQLException {
		client.insert("pw.insertPw",pwv);
	}

	@Override
	public void updateProjectWork(ProjectWorkVO pv) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteProjectWork(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Map<String, String>> getProjectWorkList(Map<String, String> params)
			throws SQLException {
		return client.queryForList("pw.getPwList",params);
	}

	@Override
	public ProjectWorkVO getProjectWork(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		return (int) client.queryForObject("pw.totalCount",params);
	}

}
