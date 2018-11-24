package kr.or.ddit.issuelv.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.IssueLvVO;

@Repository("")
public class IIssueLvDaoImpl implements IIssueLvDao{

	@Resource
	private SqlMapClient client;
	
	@Override
	public IssueLvVO issueLvInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<IssueLvVO> issueLvList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
