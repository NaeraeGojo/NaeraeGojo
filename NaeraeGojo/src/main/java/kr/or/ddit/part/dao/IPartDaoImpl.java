package kr.or.ddit.part.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.PartVO;

@Repository("")
public class IPartDaoImpl implements IPartDao{

	@Resource
	private SqlMapClient client;
	
	@Override
	public PartVO partInfo(Map<String, String> params) throws SQLException {
		return (PartVO) client.queryForObject("part.partInfo", params);
	}

	@Override
	public List<PartVO> partList() throws SQLException {
		return client.queryForList("part.partList");
	}

//	@Override
//	public void insertPartInfo(PartVO partInfo) throws SQLException {
//		
//	}

//	@Override
//	public void deletePartInfo(Map<String, String> params) throws SQLException {
//		
//	}

//	@Override
//	public void updatePartInfo(PartVO partInfo) throws SQLException {
//		
//	}

}
