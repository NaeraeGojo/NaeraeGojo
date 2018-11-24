package kr.or.ddit.admin.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.admin.dao.IAdminDao;
import kr.or.ddit.vo.AdminVO;

@Service
public class IAdminServiceImpl implements IAdminService{

	@Autowired
	private IAdminDao adminDao;
	
	@Override
	public AdminVO adminInfo(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AdminVO> adminList(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
