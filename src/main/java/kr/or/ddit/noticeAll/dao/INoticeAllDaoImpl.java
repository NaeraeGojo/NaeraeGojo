package kr.or.ddit.noticeAll.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.NotEmpVO;
import kr.or.ddit.vo.NoticeAllVO;
import kr.or.ddit.vo.NoticeBoardVO;

@Repository("")
public class INoticeAllDaoImpl implements INoticeAllDao{

	@Resource
	private SqlMapClient client;
	
	@Override
	public NotEmpVO noticeAllInfo(Map<String, String> params)
			throws SQLException {
		return (NotEmpVO) client.queryForObject("noticeAll.noticeAllInfo",params);
	}

	@Override
	public List<NotEmpVO> noticeAllList(Map<String, String> params)
			throws SQLException {
		return (List<NotEmpVO>) client.queryForList("noticeAll.noticeAllList",params);
	}

	@Override
	public String insertNoticeAllInfo(NoticeAllVO nav)
			throws SQLException {
		return (String) client.insert("noticeAll.insertNoticeAll",nav);
	}

	@Override
	public void deleteNoticeAllInfo(Map<String, String> params)
			throws SQLException {
		client.update("noticeAll.deleteNoticeAll",params);
		
	}

	@Override
	public void updateNoticeAllInfo(NotEmpVO noticeAllInfo)
			throws SQLException {
		client.update("noticeAll.updateNoticeAll",noticeAllInfo);
		
	}

	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		return (int) client.queryForObject("noticeAll.totalCount",params);
	}

	@Override
	public void updateHit(Map<String, String> params) throws SQLException {
		client.update("noticeAll.updateHit",params);
	}

}
