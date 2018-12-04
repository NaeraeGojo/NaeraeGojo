package kr.or.ddit.noticeboard.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.NoticeFileVO;
import kr.or.ddit.vo.ReportFileVO;

public interface INoticeFileService {
	
	
	public void insertNoticeFile(NoticeFileVO nfv) throws SQLException;
	
	public void updateNoticeFile(NoticeFileVO nfv) throws SQLException;
	
	public void deleteNoticeFile(Map<String, String> params) throws SQLException;
	
	public List<NoticeFileVO> getNoticeFileList(Map<String, String> params) throws SQLException;
	
	public NoticeFileVO getNoticeFile(Map<String, String> params) throws SQLException;
}
