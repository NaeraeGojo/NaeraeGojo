package kr.or.ddit.part.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.part.dao.IPartDao;
import kr.or.ddit.vo.PartVO;

@Service
public class IPartServiceImpl implements IPartService{

	@Autowired
	private IPartDao dao;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={RuntimeException.class, SQLException.class, })
	@Override
	public PartVO partInfo(Map<String, String> params) throws SQLException {
		return dao.partInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={RuntimeException.class, SQLException.class, })
	@Override
	public List<PartVO> partList() throws SQLException {
		return dao.partList();
	}

//	@Override
//	public void insertPartInfo(PartVO partInfo) throws SQLException {
//		// TODO Auto-generated method stub
//		
//	}
//
//	@Override
//	public void deletePartInfo(Map<String, String> params) throws SQLException {
//		// TODO Auto-generated method stub
//		
//	}
//
//	@Override
//	public void updatePartInfo(PartVO partInfo) throws SQLException {
//		// TODO Auto-generated method stub
//		
//	}

}
