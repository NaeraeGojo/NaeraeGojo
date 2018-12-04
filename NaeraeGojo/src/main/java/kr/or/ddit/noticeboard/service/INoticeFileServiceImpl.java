package kr.or.ddit.noticeboard.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.noticeAll.dao.INoticeAllDao;
import kr.or.ddit.noticeboard.dao.INoticeFileDao;
import kr.or.ddit.reportfile.dao.IReportFileDao;
import kr.or.ddit.vo.NoticeFileVO;
import kr.or.ddit.vo.ReportFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class INoticeFileServiceImpl implements INoticeFileService{
	@Autowired
	private INoticeFileDao dao;


	@Override
	public void insertNoticeFile(NoticeFileVO nfv) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW , rollbackFor={Exception.class})
	@Override
	public void updateNoticeFile(NoticeFileVO nfv) throws SQLException {
		dao.updateNoticeFile(nfv);
	}

	@Override
	public void deleteNoticeFile(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<NoticeFileVO> getNoticeFileList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public NoticeFileVO getNoticeFile(Map<String, String> params)
			throws SQLException {
		return dao.getNoticeFile(params);
	}

}
