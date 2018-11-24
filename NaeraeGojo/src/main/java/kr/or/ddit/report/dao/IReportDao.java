package kr.or.ddit.report.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ReportVO;

public interface IReportDao {
	public void insertReport(Map<String, String> params) throws SQLException;
	
	public void updateReport(ReportVO pv) throws SQLException;
	
	public void deleteReport(Map<String, String> params) throws SQLException;
	
	public List<ReportVO> getReportList(Map<String, String> params) throws SQLException;
	
	public ReportVO getReport(Map<String, String> params) throws SQLException;
	
}
