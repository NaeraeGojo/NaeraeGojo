package kr.or.ddit.report.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.ProjectWorkVO;
import kr.or.ddit.vo.ReportVO;

public interface IReportDao {
	public String insertReport(ReportVO rvo) throws SQLException;
	public void updateReport(ReportVO pv) throws SQLException;
	public void deleteReport(Map<String, String> params) throws SQLException;
	public List<ReportVO> getReportList(Map<String, String> params) throws SQLException;
	public int totalCount(Map<String, String> params) throws SQLException;
	//관련프로젝트 이름
	public List<ProjectVO> projectNm(Map<String, String> params) throws SQLException;
	//관련프로젝트 사람들
	public List<ReportVO> projectPeople(Map<String, String> params) throws SQLException;
	//관련프로젝트의 업무
	public List<ProjectWorkVO> pwName(Map<String, String> params) throws SQLException;
	//개발자 리스트
	public List<ReportVO> reportList(Map<String, String> params) throws SQLException;
	//클릭했을시 개발자 뷰
	public ReportVO reportView(Map<String, String> params) throws SQLException;
	//결재 뷰
	public List<ReportVO> reportStatus(Map<String, String> params1) throws SQLException;
	
}
