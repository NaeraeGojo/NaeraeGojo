package kr.or.ddit.reportfile.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.reportfile.dao.IReportFileDao;
import kr.or.ddit.vo.ReportFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IReportFileServiceImpl implements IReportFileService{
	@Autowired
	private IReportFileDao dao;

	@Override
	public void insertReportFile(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateReportFile(ReportFileVO rfv) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteReportFile(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<ReportFileVO> getReportFileList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ReportFileVO getReportFile(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
