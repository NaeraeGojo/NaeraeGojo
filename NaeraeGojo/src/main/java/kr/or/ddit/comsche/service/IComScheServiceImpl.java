package kr.or.ddit.comsche.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.comsche.dao.IComScheDao;
import kr.or.ddit.vo.ComScheVO;

@Service
public class IComScheServiceImpl implements IComScheService {

	@Autowired
	private IComScheDao comScheDao;
	
	
	@Override
	public ComScheVO comScheInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ComScheVO> comScheList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertComScheInfo(ComScheVO comScheInfo) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteComScheInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateComScheInfo(ComScheVO comScheInfo) throws SQLException {
		// TODO Auto-generated method stub
		
	}

}
