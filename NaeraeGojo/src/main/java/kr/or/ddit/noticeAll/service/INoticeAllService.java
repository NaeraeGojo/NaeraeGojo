package kr.or.ddit.noticeAll.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.NotEmpVO;
import kr.or.ddit.vo.NoticeAllVO;
import kr.or.ddit.vo.NoticeBoardVO;

public interface INoticeAllService {
	public NotEmpVO noticeAllInfo(Map<String,String> params) throws SQLException;
	
	public List<NotEmpVO> noticeAllList(Map<String, String> params) throws SQLException;
	public void insertNoticeAllInfo(NoticeAllVO nav, MultipartFile[] files) throws SQLException;
	public void deleteNoticeAllInfo(Map<String,String> params) throws SQLException;
	public void updateNoticeAllInfo(NotEmpVO noticeAllInfo) throws SQLException;
	
	public int totalCount(Map<String, String> params) throws SQLException;
	public void updateHit(Map<String, String> params) throws SQLException;
}
