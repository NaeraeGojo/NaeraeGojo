package kr.or.ddit.projectwork.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.EmpVO;
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
	public void updateProjectWork(ProjectWorkVO pwv) throws SQLException {
		client.update("pw.updatePw",pwv);
	}

	@Override
	public void deleteProjectWork(Map<String, String> params)
			throws SQLException {
		client.update("pw.deletePw",params);
	}

	@Override
	public List<Map<String, String>> getProjectWorkList(Map<String, String> params)
			throws SQLException {
		return client.queryForList("pw.getPwList",params);
	}

	@Override
	public Map<String, String> getProjectWork(Map<String, String> params)
			throws SQLException {
		return (Map<String, String>) client.queryForObject("pw.getPw",params);
	}

	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		return (int) client.queryForObject("pw.totalCount",params);
	}

	@Override
	public List<Map<String, String>> getPwChart(Map<String, String> params)
			throws SQLException {
		return client.queryForList("pw.getPwChart",params);
	}

	@Override
	public List<EmpVO> getEmpList(Map<String, String> params)
			throws SQLException {
		return client.queryForList("pw.getEmpList",params);
	}

	@Override
	public List<Map<String, String>> getAllMyPw(Map<String, String> params)
			throws SQLException {
		return client.queryForList("pw.getAllMyPw",params);
	}

	@Override
	public String getAllPercent(Map<String, String> params) throws SQLException {
		return (String) client.queryForObject("pw.getAllPercent",params);
	}

}
