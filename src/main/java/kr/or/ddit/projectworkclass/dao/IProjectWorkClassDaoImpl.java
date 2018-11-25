package kr.or.ddit.projectworkclass.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProjectWorkClassVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IProjectWorkClassDaoImpl implements IProjectWorkClassDao{

	@Autowired
	private SqlMapClient client;

	@Override
	public String insertPwc(ProjectWorkClassVO pv) throws SQLException {
		return (String) client.insert("pwc.insertPwc",pv);
	}

	@Override
	public void updatePwc(ProjectWorkClassVO pv) throws SQLException {
		client.update("pwc.updatePwc",pv);
	}

	@Override
	public void deletePwc(Map<String, String> params) throws SQLException {
		client.update("pwc.deletePwc",params);
	}

	@Override
	public List<ProjectWorkClassVO> getPwcList(Map<String, String> params)
			throws SQLException {
		return client.queryForList("pwc.getPwcList",params);
	}

	@Override
	public ProjectWorkClassVO getPwc(Map<String, String> params)
			throws SQLException {
		return (ProjectWorkClassVO) client.queryForObject("pwc.getPwc",params);
	}

	

}
