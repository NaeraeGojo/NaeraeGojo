package kr.or.ddit.admin.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AdminVO;

public interface IAdminDao {
	//1231231232312
	public AdminVO adminInfo (Map<String, String> params) throws SQLException;
	public List<AdminVO> adminList(Map<String, String> params) throws SQLException;
}
