package kr.or.ddit.main.dao;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import kr.or.ddit.vo.ProjectVO;

import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IMainDaoImpl implements IMainDao{
	
	@Resource
	private SqlMapClient client;

	@Override
	public List<ProjectVO> getProjectTime() throws SQLException {
		return client.queryForList("main.getprojectTime");
		
	}

}
