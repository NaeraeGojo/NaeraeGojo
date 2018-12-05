package kr.or.ddit.reportfile.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ReportFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IReportFileDaoImpl implements IReportFileDao{
	@Autowired
	private SqlMapClient client;

	@Override
	public void insertReportFile(ReportFileVO rfv)
			throws SQLException {
		client.insert("reportFile.insertReportFile",rfv);
		
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
		return (ReportFileVO) client.queryForObject("reportFile.getReportFile",params);
	}

}
