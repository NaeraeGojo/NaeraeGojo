package kr.or.ddit.join.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.join.dao.IJoinDao;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.MpJoinVO;
import kr.or.ddit.vo.MpVO;
import kr.or.ddit.vo.RqppsVO;

@Service
public class IJoinServiceImpl implements IJoinService{

	@Autowired
	private IJoinDao joinDao;
	
	@Override
	public JoinVO joinInfo(Map<String, String> params) throws SQLException {
		return joinDao.joinInfo(params);
	}

	@Override
	public List<JoinVO> joinList(Map<String, String> params)
			throws SQLException {
		return joinDao.joinList(params);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW , rollbackFor={Exception.class})
	public void insertJoinInfo(Map<String, String> params) throws SQLException {
		joinDao.insertJoinInfo(params);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW , rollbackFor={Exception.class})
	public void deleteJoinInfo(Map<String, String> params) throws SQLException {
		joinDao.deleteJoinInfo(params);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW , rollbackFor={Exception.class})
	public void updateJoinInfo(JoinVO joinInfo) throws SQLException {
		joinDao.updateJoinInfo(joinInfo);
	}

	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		return joinDao.totalCount(params);
	}

	@Override
	public List<RqppsVO> rqppsNm() throws SQLException {
		return joinDao.rqppsNm();
	}

	@Override
	public MpJoinVO mpList(Map<String, String> params) throws SQLException {
		return joinDao.mpList(params);
	}

	@Override
	public List<EmpVO> empList1(Map<String, String> params) throws SQLException {
		return joinDao.empList1(params);
	}

	@Override
	public List<JoinVO> joinFinalList() throws SQLException {
		return joinDao.joinFinalList();
	}

	@Override
	public List<JoinVO> clickList(Map<String, String> params)
			throws SQLException {
		return joinDao.clickList(params);
	}

}
