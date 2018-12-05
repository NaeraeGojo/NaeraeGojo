package kr.or.ddit.report.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.or.ddit.noticeboard.dao.INoticeFileDao;
import kr.or.ddit.report.dao.IReportDao;
import kr.or.ddit.reportfile.dao.IReportFileDao;
import kr.or.ddit.utils.NoticeFileMapper;
import kr.or.ddit.utils.ReportFileMapper;
import kr.or.ddit.vo.NotEmpVO;
import kr.or.ddit.vo.NoticeFileVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.ProjectWorkVO;
import kr.or.ddit.vo.ReportFileVO;
import kr.or.ddit.vo.ReportVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class IReportServiceImpl implements IReportService{
	@Autowired
	private IReportDao dao;
	
	@Autowired
	private IReportFileDao reportFiledao;
	
	@Autowired
	private ReportFileMapper reportFileMapper;

	@Transactional(propagation=Propagation.REQUIRES_NEW , rollbackFor={Exception.class})
	@Override
	public void insertReport(ReportVO rvo, MultipartFile[] files) throws SQLException {
		String report_code = dao.insertReport(rvo);
		List<ReportFileVO> rfvo = new ArrayList<ReportFileVO>();
		ReportFileVO rfvo1 = reportFileMapper.mapping(files[0], report_code);
		rfvo.add(rfvo1);
		for(ReportFileVO rfv : rfvo){
			reportFiledao.insertReportFile(rfv);
		}
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW , rollbackFor={Exception.class})
	@Override
	public void insertReportPL(ReportVO rvo, MultipartFile[] files) throws SQLException {
		String report_code = dao.insertReportPL(rvo);
		List<ReportFileVO> rfvo = new ArrayList<ReportFileVO>();
		ReportFileVO rfvo1 = reportFileMapper.mapping(files[0], report_code);
		rfvo.add(rfvo1);
		for(ReportFileVO rfv : rfvo){
			reportFiledao.insertReportFile(rfv);
		}
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
	public int totalCountDEV(Map<String, String> params) throws SQLException {
		int totalCountDEV = 0;
			totalCountDEV=dao.totalCountDEV(params);
		return totalCountDEV;
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

	@Override
	public List<ReportVO> reportList(Map<String, String> params)
			throws SQLException {
		List<ReportVO> list = null;
		list = dao.reportList(params);
		return list;
	}

	@Override
	public ReportVO reportView(Map<String, String> params) throws SQLException {
		ReportVO vo = null;
		vo = dao.reportView(params);
		return vo;
	}

	@Override
	public List<ReportVO> reportStatus(Map<String, String> params1)
			throws SQLException {
		List<ReportVO> list = null;
		list = dao.reportStatus(params1);
		return list;
	}

	@Override
	public ReportVO projectPeoplePM(Map<String, String> params)
			throws SQLException {
		ReportVO list = null;
		list = dao.projectPeoplePM(params);
		return list;
	}
	
	
	@Override
	public List<ReportVO> reportListPL(Map<String, String> params)
			throws SQLException {
		List<ReportVO> list = null;
		list = dao.reportListPL(params);
		return list;
	}

	@Override
	public int totalCountPL(Map<String, String> params) throws SQLException {
		int totalCountPL = 0;
		totalCountPL=dao.totalCountPL(params);
	return totalCountPL;
	}

	@Override
	public List<ReportVO> reportStatusPL(Map<String, String> params1)
			throws SQLException {
		List<ReportVO> list = null;
		list = dao.reportStatusPL(params1);
		return list;
	}

	@Override
	public List<ReportVO> reportListPLRec(Map<String, String> params)
			throws SQLException {
		List<ReportVO> list = null;
		list = dao.reportListPLRec(params);
		return list;
	}

	@Override
	public int totalCountPLRec(Map<String, String> params) throws SQLException {
		int totalCountPLRec = 0;
		totalCountPLRec=dao.totalCountPLRec(params);
		return totalCountPLRec;
	}

	@Override
	public List<ReportVO> reportListPM(Map<String, String> params)
			throws SQLException {
		List<ReportVO> list = null;
		list = dao.reportListPM(params);
		return list;
	}

	@Override
	public int totalCountPMRec(Map<String, String> params) throws SQLException {
		int totalCountPMRec = 0;
		totalCountPMRec=dao.totalCountPMRec(params);
		return totalCountPMRec;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void updatePL(Map<String, String> params) throws SQLException {
		dao.updatePL(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void updatePM(Map<String, String> params) throws SQLException {
		dao.updatePM(params);
		
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public String insertFeedPL(ReportVO fvo) throws SQLException {
		return dao.insertFeedPL(fvo);
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void updatePLx(Map<String, String> params) throws SQLException {
		dao.updatePLx(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void updatePMx(Map<String, String> params) throws SQLException {
		dao.updatePMx(params);
	}

	@Override
	public ReportVO feedViewDev(Map<String, String> params) throws SQLException {
		ReportVO list = null;
		list = dao.feedViewDev(params);
		return list;
	}
}
