package kr.or.ddit.mp.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.mp.dao.IMpDao;
import kr.or.ddit.vo.MpVO;

@Service
public class IMpServiceImpl implements IMpService{

	@Autowired
	private IMpDao mpDao;
	
	@Override
	public MpVO mpInfo(Map<String, String> params) throws SQLException {
		return mpDao.mpInfo(params);
	}

	@Override
	public List<MpVO> mpList(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW , rollbackFor={Exception.class})
	public String insertMp(MpVO mv) throws SQLException {
		return mpDao.insertMp(mv);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW , rollbackFor={Exception.class})
	public void updateMp(MpVO mv) throws SQLException {
		mpDao.updateMp(mv);
	}

}
