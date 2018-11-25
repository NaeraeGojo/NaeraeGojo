package kr.or.ddit.rqpps.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.or.ddit.rqpps.dao.IRqppsDao;
import kr.or.ddit.suggestfile.dao.ISuggestFileDao;
import kr.or.ddit.utils.AttachFileMapper;
import kr.or.ddit.vo.RqppsVO;
import kr.or.ddit.vo.SuggestFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class IRqppsServiceImpl implements IRqppsService{
	@Autowired
	private IRqppsDao dao;
	
	@Autowired
	private ISuggestFileDao fdao;
	
	@Autowired
	private AttachFileMapper fileMapper;

	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW , rollbackFor={Exception.class})
	public void updateRqpps(RqppsVO rqv) throws SQLException {
		dao.updateRqpps(rqv);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	public void deleteRqpps(Map<String, String> params) throws SQLException {
		dao.deleteRqpps(params);
	}

	@Override
	public List<RqppsVO> getRqppsList(Map<String, String> params)
			throws SQLException {
		return dao.getRqppsList(params);
	}

	@Override
	public RqppsVO getRqpps(Map<String, String> params) throws SQLException {
		return dao.getRqpps(params);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW , rollbackFor={Exception.class})
	public void insertRqpps(RqppsVO rqv, MultipartFile[] files)
			throws SQLException {
		String rqpps_code = dao.insertRqpps(rqv);
		
		List<SuggestFileVO> sfl = new ArrayList<SuggestFileVO>();
		SuggestFileVO sfv1 = fileMapper.mapping(files[0], rqpps_code, "1");
		SuggestFileVO sfv2 = fileMapper.mapping(files[1], rqpps_code, "2");
		
		sfl.add(sfv1);
		sfl.add(sfv2);
		
		for(SuggestFileVO sfv : sfl){
			fdao.insertSuggestFile(sfv);
		}
	}
	
	@Transactional
	@Override
	public int totalCount(Map<String, String> params) throws SQLException{
		return dao.totalCount(params);
	}

	@Override
	public List<RqppsVO> getMyRfp(Map<String, String> params)
			throws SQLException {
		return dao.getMyRfp(params);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	public void updateRfpCondition(Map<String, String> params)
			throws SQLException {
		dao.updateRfpCondition(params);
	}

}
