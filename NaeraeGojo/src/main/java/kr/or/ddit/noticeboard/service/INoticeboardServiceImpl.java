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

import kr.or.ddit.allfile.dao.IAllFileDao;
import kr.or.ddit.noticeboard.dao.INoticeFileDao;
import kr.or.ddit.noticeboard.dao.INoticeboardDao;
import kr.or.ddit.utils.AllFileMapper;
import kr.or.ddit.utils.NoticeFileMapper;
import kr.or.ddit.vo.AllFileVO;
import kr.or.ddit.vo.NoPrEmpVO;
import kr.or.ddit.vo.NotEmpVO;
import kr.or.ddit.vo.NoticeAllVO;
import kr.or.ddit.vo.NoticeBoardVO;
import kr.or.ddit.vo.NoticeFileVO;

@Service
public class INoticeboardServiceImpl implements INoticeboardService {

	@Autowired
	private INoticeboardDao noticeboardDao;
	
	@Autowired
	private INoticeFileDao noticeFiledao;
	
	@Autowired
	private NoticeFileMapper noticeFileMapper;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={RuntimeException.class,SQLException.class,NestableException.class})
	@Override
	public NoticeBoardVO noticeboardInfo(Map<String, String> params)
			throws SQLException {
		NoticeBoardVO vo = null;
		vo = noticeboardDao.noticeboardInfo(params);
		return vo;
	}

	@Override
	public List<NoticeBoardVO> noticeboardList(Map<String, String> params)
			throws SQLException {
		List<NoticeBoardVO> list = null;
		list = noticeboardDao.noticeboardList(params);
		return list;
	}
	
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={RuntimeException.class,SQLException.class,NestableException.class})
	@Override
	public void insertNoticeboardInfo(NoticeBoardVO nbv, MultipartFile[] files)
			throws SQLException {
		String notice_code = noticeboardDao.insertNoticeboardInfo(nbv);
		List<NoticeFileVO> nfvo = new ArrayList<NoticeFileVO>();
		NoticeFileVO nfvo1 = noticeFileMapper.mapping(files[0],notice_code);
//		AllFileVO afvo2 = allFileMapper.mapping(files[1],notice_all_code,"1");
		nfvo.add(nfvo1);
//		afvo.add(afvo2);
		for(NoticeFileVO nfv : nfvo){
			noticeFiledao.insertNoticeFile(nfv);
		}
		
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={RuntimeException.class,SQLException.class,NestableException.class})
	@Override
	public void deleteNoticeboardInfo(Map<String, String> params)
			throws SQLException {
		noticeboardDao.deleteNoticeboardInfo(params);
		
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={RuntimeException.class,SQLException.class,NestableException.class})
	@Override
	public void updateNoticeboardInfo(NoticeBoardVO nbv)
			throws SQLException {
		noticeboardDao.updateNoticeboardInfo(nbv);
		
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

	@Override
	public List<NoticeBoardVO> projectList(Map<String, String> params)
			throws SQLException {
		List<NoticeBoardVO> list = null;
		list = noticeboardDao.projectList(params);
		return list;
	}

}
