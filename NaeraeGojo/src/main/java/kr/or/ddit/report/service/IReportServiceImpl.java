package kr.or.ddit.report.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.report.dao.IReportDao;
import kr.or.ddit.vo.ReportVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IReportServiceImpl implements IReportService{
	@Autowired
	private IReportDao dao;

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

}
