package kr.or.ddit.reportfile.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ReportFileVO;

public interface IReportFileService {
	public void insertReportFile(ReportFileVO rfv) throws SQLException;
	
	public void updateReportFile(ReportFileVO rfv) throws SQLException;
	
	public void deleteReportFile(Map<String, String> params) throws SQLException;
	
	public List<ReportFileVO> getReportFileList(Map<String, String> params) throws SQLException;
	
	public ReportFileVO getReportFile(Map<String, String> params) throws SQLException;
}
