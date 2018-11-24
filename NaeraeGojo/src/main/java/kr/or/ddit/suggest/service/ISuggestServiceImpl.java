package kr.or.ddit.suggest.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.or.ddit.suggest.dao.ISuggestDao;
import kr.or.ddit.suggestfile.dao.ISuggestFileDao;
import kr.or.ddit.utils.AttachFileMapper;
import kr.or.ddit.vo.SuggestFileVO;
import kr.or.ddit.vo.SuggestVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ISuggestServiceImpl implements ISuggestService{
	@Autowired
	private ISuggestDao dao;
	
	@Autowired
	private ISuggestFileDao fdao;

	@Autowired
	private AttachFileMapper fileMapper;
	
	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW , rollbackFor={Exception.class})
	public void updateSuggest(SuggestVO sv) throws SQLException {
		dao.updateSuggest(sv);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	public void deleteSuggest(Map<String, String> params) throws SQLException {
		dao.deleteSuggest(params);
	}

	@Override
	public List<SuggestVO> getSuggestList(Map<String, String> params)
			throws SQLException {
		return dao.getSuggestList(params);
	}

	@Override
	public SuggestVO getSuggest(Map<String, String> params) throws SQLException {
		return dao.getSuggest(params);
	}

	@Transactional
	@Override
	public int totalCount(Map<String, String> params) throws SQLException{
		return dao.totalCount(params);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW , rollbackFor={Exception.class})
	public void insertSuggest(SuggestVO sv, MultipartFile[] files)
			throws SQLException {
		String suggest_code = dao.insertSuggest(sv);
		
		List<SuggestFileVO> sfl = fileMapper.mapping(files, suggest_code, "3");
		
		for(SuggestFileVO sfv : sfl){
			fdao.insertSuggestFile(sfv);
		}
	}

}
