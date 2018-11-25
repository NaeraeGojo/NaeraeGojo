package kr.or.ddit.noticeboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.NoPrEmpVO;
import kr.or.ddit.vo.NoticeBoardVO;


public interface INoticeboardDao {
	public NoPrEmpVO noticeboardInfo(Map<String,String> params) throws SQLException;
	
	public List<NoPrEmpVO> noticeboardList(Map<String, String> params) throws SQLException;
	public String insertNoticeboardInfo(NoticeBoardVO nbi) throws SQLException;
	public void deleteNoticeboardInfo(Map<String,String> params) throws SQLException;
	public void updateNoticeboardInfo(NoPrEmpVO nbi) throws SQLException;
	
	public int totalCount(Map<String, String> params) throws SQLException;
	public void updateHit(Map<String, String> params) throws SQLException;
}
