package kr.or.ddit.suggestfile.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.suggestfile.dao.ISuggestFileDao;
import kr.or.ddit.vo.SuggestFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ISuggestFileServiceImpl implements ISuggestFileService{
	@Autowired
	private ISuggestFileDao dao;

	@Override
	public void insertSuggestFile(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW , rollbackFor={Exception.class})
	public void updateSuggestFile(SuggestFileVO sfv) throws SQLException {
		dao.updateSuggestFile(sfv);
	}

	@Override
	public void deleteSuggestFile(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<SuggestFileVO> getSuggestFileList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SuggestFileVO getSuggestFile(Map<String, String> params)
			throws SQLException {
		return dao.getSuggestFile(params);
	}

}
