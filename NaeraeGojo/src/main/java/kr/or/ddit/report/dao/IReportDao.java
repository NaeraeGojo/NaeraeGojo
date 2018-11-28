package kr.or.ddit.report.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.ProjectWorkVO;
import kr.or.ddit.vo.ReportVO;

public interface IReportDao {
	public void insertReport(Map<String, String> params) throws SQLException;
	public void updateReport(ReportVO pv) throws SQLException;
	public void deleteReport(Map<String, String> params) throws SQLException;
	public List<ReportVO> getReportList(Map<String, String> params) throws SQLException;
	public ReportVO getReport(Map<String, String> params) throws SQLException;
	public int totalCount(Map<String, String> params) throws SQLException;
	//관련프로젝트 이름
	public List<ProjectVO> projectNm(Map<String, String> params) throws SQLException;
	//관련프로젝트 사람들
	public List<ReportVO> projectPeople(Map<String, String> params) throws SQLException;
	//관련프로젝트의 업무
	public List<ProjectWorkVO> pwName(Map<String, String> params) throws SQLException;
	
}
