package kr.or.ddit.report.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.ProjectWorkVO;
import kr.or.ddit.vo.ReportVO;

public interface IReportService {
	public void insertReport(ReportVO rvo, MultipartFile[] files) throws SQLException;
	public void insertReportPL(ReportVO rvo, MultipartFile[] files) throws SQLException;
	public void updateReport(ReportVO pv) throws SQLException;
	public void deleteReport(Map<String, String> params) throws SQLException;
	public List<ReportVO> getReportList(Map<String, String> params) throws SQLException;
	public ReportVO getReport(Map<String, String> params) throws SQLException;
	
	//관련프로젝트 이름
	public List<ProjectVO> projectNm(Map<String, String> params) throws SQLException;
	//관련프로젝트 사람들
	public List<ReportVO> projectPeople(Map<String, String> params) throws SQLException;
	//관련프로젝트의 업무
	public List<ProjectWorkVO> pwName(Map<String, String> params) throws SQLException;
	//개발자 리스트
	public List<ReportVO> reportList(Map<String, String> params) throws SQLException;
	//PL 리스트 보낸보고서함
	public List<ReportVO> reportListPL(Map<String, String> params) throws SQLException;
	//PL 리스트 받은보고서함
	public List<ReportVO> reportListPLRec(Map<String, String> params) throws SQLException;
	//PM 리스트 받은보고서함
	public List<ReportVO> reportListPM(Map<String, String> params) throws SQLException;
	//클릭했을시 개발자 뷰
	public ReportVO reportView(Map<String, String> params) throws SQLException;
	//결재 뷰
	public List<ReportVO> reportStatus(Map<String, String> params1) throws SQLException;
	//결재 뷰 PL
	public List<ReportVO> reportStatusPL(Map<String, String> params1) throws SQLException;
	//관련프로젝트 사람들 PL전용
	public ReportVO projectPeoplePM(Map<String, String> params) throws SQLException;
	//PL이 개발자 보고서온거 승인
	public void updatePL(Map<String,String> params) throws SQLException;
	//PM이 개발자,PL 보고서 온거 승인
	public void updatePM(Map<String,String> params) throws SQLException;
	//PL이 개발자 보고서온거 반려
	public void updatePLx(Map<String,String> params) throws SQLException;
	//PM이 개발자,PL 보고서 온거 반려
	public void updatePMx(Map<String,String> params) throws SQLException;
	//PL이 개발자에게 피드백
	public String insertFeedPL(ReportVO fvo) throws SQLException;
	//클릭했을시 개발자 피드백 뷰
	public ReportVO feedViewDev(Map<String, String> params) throws SQLException;
	
	
	public int totalCountDEV(Map<String, String> params) throws SQLException;
	public int totalCountPL(Map<String, String> params) throws SQLException;
	public int totalCountPLRec(Map<String, String> params) throws SQLException;
	public int totalCountPMRec(Map<String, String> params) throws SQLException;
}
