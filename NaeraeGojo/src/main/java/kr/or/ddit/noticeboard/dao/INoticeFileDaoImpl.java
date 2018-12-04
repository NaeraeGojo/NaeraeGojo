package kr.or.ddit.noticeboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AllFileVO;
import kr.or.ddit.vo.NoticeFileVO;
import kr.or.ddit.vo.ReportFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class INoticeFileDaoImpl implements INoticeFileDao{
	@Autowired
	private SqlMapClient client;

//	@Override
//	public void insertReportFile(Map<String, String> params)
//			throws SQLException {
//		// TODO Auto-generated method stub
//		
//	}


	@Override
	public void insertNoticeFile(NoticeFileVO nfv) throws SQLException {
		client.insert("noticeFile.insertNoticeFile",nfv);
	}

	@Override
	public void updateNoticeFile(NoticeFileVO nfv) throws SQLException {
		client.update("noticeFile.updateNoticeFile",nfv);
		
	}

	@Override
	public void deleteNoticeFile(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<NoticeFileVO> getNoticeFileList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public NoticeFileVO getNoticeFile(Map<String, String> params)
			throws SQLException {
		return (NoticeFileVO) client.queryForObject("noticeFile.getNoticeFile", params);
	}

}
