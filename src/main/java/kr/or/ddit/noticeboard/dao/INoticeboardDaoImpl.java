package kr.or.ddit.noticeboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.NoPrEmpVO;
import kr.or.ddit.vo.NotEmpVO;
import kr.or.ddit.vo.NoticeBoardVO;

@Repository("")
public class INoticeboardDaoImpl implements INoticeboardDao{

	@Resource
	private SqlMapClient client;
	
	@Override
	public NoPrEmpVO noticeboardInfo(Map<String, String> params)
			throws SQLException {
		return (NoPrEmpVO) client.queryForObject("notice.noticeInfo",params);
	}

	@Override
	public List<NoPrEmpVO> noticeboardList(Map<String, String> params)
			throws SQLException {
		return (List<NoPrEmpVO>) client.queryForList("notice.noticeList",params);
	}

	@Override
	public String insertNoticeboardInfo(NoticeBoardVO nbi)
			throws SQLException {
		return (String) client.insert("notice.insertNotice",nbi);
		
	}

	@Override
	public void deleteNoticeboardInfo(Map<String, String> params)
			throws SQLException {
		client.update("notice.deleteNotice",params);
		
	}

	@Override
	public void updateNoticeboardInfo(NoPrEmpVO nbi)
			throws SQLException {
		client.update("notice.updateNotice",nbi);
		
	}

	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		return (int) client.queryForObject("notice.totalCount",params);
	}

	@Override
	public void updateHit(Map<String, String> params) throws SQLException {
		client.update("notice.updateHit",params);
		
	}

}
