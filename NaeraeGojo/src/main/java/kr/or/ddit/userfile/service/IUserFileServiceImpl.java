package kr.or.ddit.userfile.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.userfile.dao.IUserFileDao;
import kr.or.ddit.vo.UserFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IUserFileServiceImpl implements IUserFileService{
	
	@Autowired
	private IUserFileDao dao;

	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true, rollbackFor={RuntimeException.class, SQLException.class, })
	@Override
	public void insertUserFile(UserFileVO ufv) throws SQLException {
		dao.insertUserFile(ufv); 
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true, rollbackFor={RuntimeException.class, SQLException.class, })
	@Override
	public void updateUserFile(UserFileVO ufv) throws SQLException {
		dao.updateUserFile(ufv);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true, rollbackFor={RuntimeException.class, SQLException.class, })
	@Override
	public void deleteUserFile(Map<String, String> params) throws SQLException {
		dao.deleteUserFile(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true, rollbackFor={RuntimeException.class, SQLException.class, })
	@Override
	public List<UserFileVO> userFileList(Map<String, String> params)
			throws SQLException {
		return dao.userFileList(params);
	}

	@Transactional(readOnly=true)
	@Override
	public UserFileVO userFileInfo(Map<String, String> params)
			throws SQLException {
		return dao.userFileInfo(params);
	}

}
