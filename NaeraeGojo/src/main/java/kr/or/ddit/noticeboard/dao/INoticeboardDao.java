package kr.or.ddit.noticeboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.NoPrEmpVO;
import kr.or.ddit.vo.NoticeBoardVO;


public interface INoticeboardDao {
	public NoticeBoardVO noticeboardInfo(Map<String,String> params) throws SQLException;
	
	public List<NoticeBoardVO> noticeboardList(Map<String, String> params) throws SQLException;
	public String insertNoticeboardInfo(NoticeBoardVO nbv) throws SQLException;
	public void deleteNoticeboardInfo(Map<String,String> params) throws SQLException;
	public void updateNoticeboardInfo(NoticeBoardVO nbv) throws SQLException;
	
	public int totalCount(Map<String, String> params) throws SQLException;
	public void updateHit(Map<String, String> params) throws SQLException;

	
	
	public List<NoticeBoardVO> projectList(Map<String, String> params) throws SQLException;
}
