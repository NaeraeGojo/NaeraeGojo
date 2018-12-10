package kr.or.ddit.report.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.ProjectWorkVO;
import kr.or.ddit.vo.ReportVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IReportDaoImpl implements IReportDao{
	@Autowired
	private SqlMapClient client;

	@Override
	public String insertReport(ReportVO rvo) throws SQLException {
		return (String) client.insert("report.insertReport",rvo);
	}

	@Override
	public void updateReport(ReportVO pv) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteReport(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<ReportVO> getReportList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<ProjectVO> projectNm(Map<String, String> params)
			throws SQLException {
		return client.queryForList("report.projectNm", params);
	}

	@Override
	public int totalCountDEV(Map<String, String> params) throws SQLException {
		return (int) client.queryForObject("report.totalCountDEV",params);
	}

	@Override
	public List<ReportVO> projectPeople(Map<String, String> params)
			throws SQLException {
		return client.queryForList("report.projectPeople", params);
	}

	@Override
	public List<ProjectWorkVO> pwName(Map<String, String> params)
			throws SQLException {
		return client.queryForList("report.pwName", params);
	}

	@Override
	public List<ReportVO> reportList(Map<String, String> params)
			throws SQLException {
		return client.queryForList("report.reportList",params);
	}

	@Override
	public ReportVO reportView(Map<String, String> params) throws SQLException {
		return (ReportVO) client.queryForObject("report.reportView",params);
	}

	@Override
	public List<ReportVO> reportStatus(Map<String, String> params1)
			throws SQLException {
		return client.queryForList("report.reportStatus", params1);
	}

	@Override
	public ReportVO projectPeoplePM(Map<String, String> params)
			throws SQLException {
		return (ReportVO) client.queryForObject("report.projectPeoplePM",params);
	}

	@Override
	public String insertReportPL(ReportVO rvo) throws SQLException {
		return (String) client.insert("report.insertReportPL",rvo);
	}

	@Override
	public List<ReportVO> reportListPL(Map<String, String> params)
			throws SQLException {
		return client.queryForList("report.reportListPL",params);
	}

	@Override
	public int totalCountPL(Map<String, String> params) throws SQLException {
		return (int) client.queryForObject("report.totalCountPL",params);
	}

	@Override
	public List<ReportVO> reportStatusPL(Map<String, String> params1)
			throws SQLException {
		return client.queryForList("report.reportStatusPL", params1);
	}

	@Override
	public List<ReportVO> reportListPLRec(Map<String, String> params)
			throws SQLException {
		return client.queryForList("report.reportListPLRec",params);
	}

	@Override
	public int totalCountPLRec(Map<String, String> params) throws SQLException {
		return (int) client.queryForObject("report.totalCountPLRec",params);
	}

	@Override
	public List<ReportVO> reportListPM(Map<String, String> params)
			throws SQLException {
		return client.queryForList("report.reportListPM",params);
	}

	@Override
	public int totalCountPMRec(Map<String, String> params) throws SQLException {
		return (int) client.queryForObject("report.totalCountPMRec",params);
	}

	@Override
	public void updatePL(Map<String, String> params) throws SQLException {
		client.update("report.checkPL",params);
		
	}

	@Override
	public void updatePM(Map<String, String> params) throws SQLException {
		client.update("report.checkPM",params);
		
	}

	@Override
	public String insertFeedPL(ReportVO fvo) throws SQLException {
		return (String) client.insert("report.feedPL",fvo);
	}

	@Override
	public void updatePLx(Map<String, String> params) throws SQLException {
		client.update("report.checkPLx",params);
	}

	@Override
	public void updatePMx(Map<String, String> params) throws SQLException {
		client.update("report.checkPMx",params);
	}

	@Override
	public ReportVO feedViewDev(Map<String, String> params) throws SQLException {
		return (ReportVO) client.queryForObject("report.feedViewDev",params);
	}

	@Override
	public void deleteReportPLRec(Map<String, String> params)
			throws SQLException {
		client.update("report.deleteReportPLRec",params);
		
	}

	@Override
	public void deleteReportPLSend(Map<String, String> params)
			throws SQLException {
		client.update("report.deleteReportPLSend",params);
	}

	@Override
	public void deleteReportPMRec(Map<String, String> params)
			throws SQLException {
		client.update("report.deleteReportPMRec",params);
	}

	@Override
	public void deleteReportDEVSend(Map<String, String> params)
			throws SQLException {
		client.update("report.deleteReportDEVSend",params);
	}

}
