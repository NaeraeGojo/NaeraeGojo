package kr.or.ddit.allfileclass.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.allfileclass.dao.IAllFileClassDao;
import kr.or.ddit.vo.AllFileClassVO;

@Service
public class IAllFileClassServiceImpl implements IAllFileClassService {

	@Autowired
	private IAllFileClassDao allFileClassDao;
	
	@Override
	public AllFileClassVO allFileClassInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AllFileClassVO> allFileClassList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertAllfileClassInfo(AllFileClassVO allFileClassInfo)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAllfileClassInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateAllfileClassInfo(AllFileClassVO allFileClassInfo)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

}
