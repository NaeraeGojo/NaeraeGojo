package kr.or.ddit.report.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.report.dao.IReportDao;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.ProjectWorkVO;
import kr.or.ddit.vo.ReportVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IReportServiceImpl implements IReportService{
	@Autowired
	private IReportDao dao;

	@Transactional(propagation=Propagation.REQUIRES_NEW , rollbackFor={Exception.class})
	@Override
	public void insertReport(ReportVO rvo) throws SQLException {
		dao.insertReport(rvo);
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
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<ProjectVO> projectNm(Map<String, String> params)
			throws SQLException {
		return dao.projectNm(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		int totalCount = 0;
			totalCount=dao.totalCount(params);
		return totalCount;
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<ReportVO> projectPeople(Map<String, String> params)
			throws SQLException {
		return dao.projectPeople(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<ProjectWorkVO> pwName(Map<String, String> params)
			throws SQLException {
		return dao.pwName(params);
	}

}
