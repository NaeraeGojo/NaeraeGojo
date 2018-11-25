package kr.or.ddit.mp.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.MpVO;

@Repository
public class IMpDaoImpl implements IMpDao{

	@Resource
	private SqlMapClient client;
	
	@Override
	public MpVO mpInfo(Map<String, String> params) throws SQLException {
		return (MpVO) client.queryForObject("mp.getMp",params);
	}

	@Override
	public List<MpVO> mpList(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String insertMp(MpVO mv) throws SQLException {
		return (String) client.insert("mp.insertMp",mv);
	}

	@Override
	public void updateMp(MpVO mv) throws SQLException {
		client.update("mp.updateMp",mv);
	}

}
