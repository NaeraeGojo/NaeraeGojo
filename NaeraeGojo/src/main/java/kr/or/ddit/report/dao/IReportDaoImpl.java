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
	public void insertReport(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		
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
	public ReportVO getReport(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProjectVO> projectNm(Map<String, String> params)
			throws SQLException {
		return client.queryForList("report.projectNm", params);
	}

	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		return (int) client.queryForObject("report.totalCount",params);
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

}
