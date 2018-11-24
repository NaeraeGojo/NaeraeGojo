package kr.or.ddit.allfile.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.allfile.dao.IAllFileDao;
import kr.or.ddit.suggestfile.dao.ISuggestFileDao;
import kr.or.ddit.vo.AllFileVO;
import kr.or.ddit.vo.SuggestFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IAllFileServiceImpl implements IAllFileService{
	@Autowired
	private IAllFileDao dao;

	@Override
	public void insertAllFile(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateAllFile(AllFileVO afv) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAllFile(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<AllFileVO> getAllFileList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AllFileVO getAllFile(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	

}
