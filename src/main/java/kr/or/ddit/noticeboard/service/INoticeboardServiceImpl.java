package kr.or.ddit.noticeboard.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.exception.NestableException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.noticeboard.dao.INoticeboardDao;
import kr.or.ddit.vo.AllFileVO;
import kr.or.ddit.vo.NoPrEmpVO;
import kr.or.ddit.vo.NotEmpVO;
import kr.or.ddit.vo.NoticeAllVO;
import kr.or.ddit.vo.NoticeBoardVO;

@Service
public class INoticeboardServiceImpl implements INoticeboardService {

	@Autowired
	private INoticeboardDao noticeboardDao;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={RuntimeException.class,SQLException.class,NestableException.class})
	@Override
	public NoPrEmpVO noticeboardInfo(Map<String, String> params)
			throws SQLException {
		NoPrEmpVO vo = null;
		vo = noticeboardDao.noticeboardInfo(params);
		return vo;
	}

	@Override
	public List<NoPrEmpVO> noticeboardList(Map<String, String> params)
			throws SQLException {
		List<NoPrEmpVO> list = null;
		list = noticeboardDao.noticeboardList(params);
		return list;
	}
	
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={RuntimeException.class,SQLException.class,NestableException.class})
	@Override
	public void insertNoticeboardInfo(NoticeBoardVO nbv, MultipartFile[] files)
			throws SQLException {
//		String notice_all_code = noticeAllDao.insertNoticeAllInfo(nav);
//		List<AllFileVO> afvo = new ArrayList<AllFileVO>();
//		AllFileVO afvo1 = allFileMapper.mapping(files[0],notice_all_code,"1");
//		AllFileVO afvo2 = allFileMapper.mapping(files[1],notice_all_code,"1");
//		afvo.add(afvo1);
//		afvo.add(afvo2);
//		for(AllFileVO afv : afvo){
//			afdao.insertAllFile(afv);
		
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={RuntimeException.class,SQLException.class,NestableException.class})
	@Override
	public void deleteNoticeboardInfo(Map<String, String> params)
			throws SQLException {
		noticeboardDao.deleteNoticeboardInfo(params);
		
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={RuntimeException.class,SQLException.class,NestableException.class})
	@Override
	public void updateNoticeboardInfo(NoPrEmpVO nbi)
			throws SQLException {
		noticeboardDao.updateNoticeboardInfo(nbi);
		
	}

	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		int totalCount = 0;
		totalCount=noticeboardDao.totalCount(params);
		return totalCount;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={RuntimeException.class,SQLException.class,NestableException.class})
	@Override
	public void updateHit(Map<String, String> params) throws SQLException {
		noticeboardDao.updateHit(params);
	}

}
