package kr.or.ddit.noticeboard.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.NoPrEmpVO;
import kr.or.ddit.vo.NoticeAllVO;
import kr.or.ddit.vo.NoticeBoardVO;

public interface INoticeboardService {
	public NoPrEmpVO noticeboardInfo(Map<String,String> params) throws SQLException;
	public List<NoPrEmpVO> noticeboardList(Map<String, String> params) throws SQLException;
	public void insertNoticeboardInfo(NoticeBoardVO nbv, MultipartFile[] files) throws SQLException;
	public void deleteNoticeboardInfo(Map<String,String> params) throws SQLException;
	public void updateNoticeboardInfo(NoPrEmpVO noticeboardInfo) throws SQLException;
	
	public int totalCount(Map<String, String> params) throws SQLException;
	public void updateHit(Map<String, String> params) throws SQLException;
}
