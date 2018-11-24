package kr.or.ddit.noticeAll.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.NotEmpVO;
import kr.or.ddit.vo.NoticeAllVO;
import kr.or.ddit.vo.NoticeBoardVO;


public interface INoticeAllDao {
	public NotEmpVO noticeAllInfo(Map<String,String> params) throws SQLException;
	
	public List<NotEmpVO> noticeAllList(Map<String, String> params) throws SQLException;
	public String insertNoticeAllInfo(NoticeAllVO nav) throws SQLException;
	public void deleteNoticeAllInfo(Map<String,String> params) throws SQLException;
	public void updateNoticeAllInfo(NotEmpVO noticeAllInfo) throws SQLException;
	
	public int totalCount(Map<String, String> params) throws SQLException;
	public void updateHit(Map<String, String> params) throws SQLException;
}
