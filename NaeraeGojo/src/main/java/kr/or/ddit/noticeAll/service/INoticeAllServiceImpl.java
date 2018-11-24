package kr.or.ddit.noticeAll.service;

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
import kr.or.ddit.noticeAll.dao.INoticeAllDao;
import kr.or.ddit.noticeboard.dao.INoticeboardDao;
import kr.or.ddit.suggestfile.dao.ISuggestFileDao;
import kr.or.ddit.utils.AllFileMapper;
import kr.or.ddit.utils.AttachFileMapper;
import kr.or.ddit.vo.AllFileVO;
import kr.or.ddit.vo.NotEmpVO;
import kr.or.ddit.vo.NoticeAllVO;
import kr.or.ddit.vo.NoticeBoardVO;
import kr.or.ddit.vo.SuggestFileVO;

@Service
public class INoticeAllServiceImpl implements INoticeAllService {

	@Autowired
	private INoticeAllDao noticeAllDao;
	
	@Autowired
	private IAllFileDao afdao;
	
	@Autowired
	private AllFileMapper allFileMapper;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={RuntimeException.class,SQLException.class,NestableException.class})
	@Override
	public NotEmpVO noticeAllInfo(Map<String, String> params)
			throws SQLException {
		NotEmpVO vo = null;
		vo = noticeAllDao.noticeAllInfo(params);
		return vo;
	}
	
	
	@Override
	public List<NotEmpVO> noticeAllList(Map<String, String> params)
			throws SQLException {
		List<NotEmpVO> list = null;
		list = noticeAllDao.noticeAllList(params);
		return list;
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW , rollbackFor={Exception.class})
	public void insertNoticeAllInfo(NoticeAllVO nav, MultipartFile[] files)
			throws SQLException {
		String notice_all_code = noticeAllDao.insertNoticeAllInfo(nav);
		List<AllFileVO> afvo = new ArrayList<AllFileVO>();
		AllFileVO afvo1 = allFileMapper.mapping(files[0],notice_all_code,"1");
		AllFileVO afvo2 = allFileMapper.mapping(files[1],notice_all_code,"1");
		afvo.add(afvo1);
		afvo.add(afvo2);
		for(AllFileVO afv : afvo){
			afdao.insertAllFile(afv);
		}
//		SuggestFileVO sfv1 = fileMapper.mapping(files[0], rqpps_code, "1");
//		SuggestFileVO sfv2 = fileMapper.mapping(files[1], rqpps_code, "2");
//		
//		sfl.add(sfv1);
//		sfl.add(sfv2);
//		
//		for(SuggestFileVO sfv : sfl){
//			fdao.insertSuggestFile(sfv);
//		}
		
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void deleteNoticeAllInfo(Map<String, String> params)
			throws SQLException {
		noticeAllDao.deleteNoticeAllInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void updateNoticeAllInfo(NotEmpVO noticeAllInfo)
			throws SQLException {
		noticeAllDao.updateNoticeAllInfo(noticeAllInfo);
	}

	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		int totalCount = 0;
		try {
			totalCount=noticeAllDao.totalCount(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return totalCount;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={RuntimeException.class,SQLException.class,NestableException.class})
	@Override
	public void updateHit(Map<String, String> params) throws SQLException {
		noticeAllDao.updateHit(params);
	}

}
