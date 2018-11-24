package kr.or.ddit.pblancboard.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.allfile.dao.IAllFileDao;
import kr.or.ddit.pblancboard.dao.IPblancboardDao;
import kr.or.ddit.utils.AllFileMapper;
import kr.or.ddit.vo.AllFileVO;
import kr.or.ddit.vo.PblancBoardVO;

@Service
public class IPblancboardServiceImpl implements IPblancboardService {

	@Autowired
	private IPblancboardDao pblancboardDao;
	
	@Autowired
	private IAllFileDao allFiledao;
	
	@Autowired
	private AllFileMapper allFileMapper;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={Exception.class})
	@Override
	public PblancBoardVO pblancboardInfo(Map<String, String> params) throws SQLException {
		return pblancboardDao.pblancboardInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<PblancBoardVO> pblancboardList(Map<String, String> params) throws SQLException {
		return pblancboardDao.pblancboardList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void insertPblancboardInfo(PblancBoardVO pblancboardInfo, MultipartFile[] files) throws SQLException {
		String pblanc_board_code = pblancboardDao.insertPblancboardInfo(pblancboardInfo);
		List<AllFileVO> afvo = new ArrayList<AllFileVO>();
		AllFileVO afvo1 = allFileMapper.mapping(files[0],pblanc_board_code,"2");
		AllFileVO afvo2 = allFileMapper.mapping(files[1],pblanc_board_code,"2");
		afvo.add(afvo1);
		afvo.add(afvo2);
		for(AllFileVO afv : afvo){
			allFiledao.insertAllFile(afv);
		}
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={Exception.class})
	@Override
	public void deletePblancboardInfo(Map<String, String> params) throws SQLException {
		pblancboardDao.deletePblancboardInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void updatePblancboardInfo(PblancBoardVO pblancboardInfo) throws SQLException {
		pblancboardDao.updatePblancboardInfo(pblancboardInfo);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={Exception.class})
	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		int totalCount = 0;
		try {
			totalCount = pblancboardDao.totalCount(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return totalCount;
	}

}
