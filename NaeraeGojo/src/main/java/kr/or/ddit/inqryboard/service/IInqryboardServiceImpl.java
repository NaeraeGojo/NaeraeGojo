package kr.or.ddit.inqryboard.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.allfile.dao.IAllFileDao;
import kr.or.ddit.inqryboard.dao.IInqryboardDao;
import kr.or.ddit.utils.AllFileMapper;
import kr.or.ddit.utils.AttachFileMapper;
import kr.or.ddit.vo.AllFileVO;
import kr.or.ddit.vo.InqryBoardVO;

@Service
public class IInqryboardServiceImpl implements IInqryboardService {

	@Autowired
	private IInqryboardDao dao;

	@Autowired
	private IAllFileDao afdao;
	
	@Autowired
	private AllFileMapper allFileMapper;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public InqryBoardVO inqryBoardInfo(Map<String, String> params)
			throws SQLException {
		return dao.inqryBoardInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public List<InqryBoardVO> inqryBoardList(Map<String, String> params)
			throws SQLException {
		return dao.inqryBoardList(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void insertInqryInfo(InqryBoardVO inqryBoardInfo, MultipartFile[] files)
			throws SQLException {
		String inqry_board_code = dao.insertInqryInfo(inqryBoardInfo);
 		List<AllFileVO> afl = allFileMapper.mapping(files, inqry_board_code, "3"); 
 		for(AllFileVO afv : afl){
 			afdao.insertAllFile(afv);
 		}
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void deleteInqryInfo(Map<String, String> params) throws SQLException {
		dao.deleteInqryInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void updateInqryInfo(InqryBoardVO inqryBoardInfo, MultipartFile[] files) throws SQLException {
		dao.updateInqryInfo(inqryBoardInfo);
		
//		List<AllFileVO> afl = allFileMapper.mapping(files, inqryBoardInfo.getInqry_board_code(), "3");
//		
//		for(AllFileVO afv : afl){
//			afdao.insertAllFile(afv);
//		}
	}

	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		return dao.totalCount(params);
	}
	
	
}
