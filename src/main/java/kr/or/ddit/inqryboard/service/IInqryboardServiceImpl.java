package kr.or.ddit.inqryboard.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.inqryboard.dao.IInqryboardDao;
import kr.or.ddit.vo.InqryBoardVO;

@Service
public class IInqryboardServiceImpl implements IInqryboardService {

	@Autowired
	private IInqryboardDao inqruboardDao;
	
	@Override
	public InqryBoardVO inqryBoardInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<InqryBoardVO> inqryBoardList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertInqryBoardInfo(InqryBoardVO inqryBoardInfo)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteInqryBoardInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateInqryBoardInfo(InqryBoardVO inqryBoardInfo)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

}
