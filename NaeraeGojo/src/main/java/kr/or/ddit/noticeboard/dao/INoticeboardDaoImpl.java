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
	public NoticeBoardVO noticeboardInfo(Map<String, String> params)
			throws SQLException {
		return (NoticeBoardVO) client.queryForObject("notice.noticeInfo",params);
	}

	@Override
	public List<NoticeBoardVO> noticeboardList(Map<String, String> params)
			throws SQLException {
		return (List<NoticeBoardVO>) client.queryForList("notice.noticeList",params);
	}

	@Override
	public String insertNoticeboardInfo(NoticeBoardVO nbv)
			throws SQLException {
		return (String) client.insert("notice.insertNotice",nbv);
		
	}

	@Override
	public void deleteNoticeboardInfo(Map<String, String> params)
			throws SQLException {
		client.update("notice.deleteNotice",params);
		
	}

	@Override
	public void updateNoticeboardInfo(NoticeBoardVO nbv)
			throws SQLException {
		client.update("notice.updateNotice",nbv);
		
	}

	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		return (int) client.queryForObject("notice.totalCount",params);
	}

	@Override
	public void updateHit(Map<String, String> params) throws SQLException {
		client.update("notice.updateHit",params);
		
	}

	@Override
	public List<NoticeBoardVO> projectList(Map<String, String> params)
			throws SQLException {
		return client.queryForList("notice.projectList",params);
	}

}
