package kr.or.ddit.admin.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AdminVO;

public interface IAdminService {
	public AdminVO adminInfo (Map<String, String> params) throws SQLException;
	public List<AdminVO> adminList(Map<String, String> params) throws SQLException;
}
