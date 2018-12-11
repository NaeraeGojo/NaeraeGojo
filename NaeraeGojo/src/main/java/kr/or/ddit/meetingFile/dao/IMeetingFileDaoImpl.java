package kr.or.ddit.meetingFile.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.or.ddit.vo.MeetFileVO;
import kr.or.ddit.vo.MeetingVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.TempMeetingVO;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IMeetingFileDaoImpl implements IMeetingFileDao{

	@Resource
	private SqlMapClient client;

	@Override
	public void insertMeetingFile(MeetFileVO mfile) throws SQLException {
		client.insert("meetingFile.insertMeetingFile", mfile);
	}

	@Override
	public MeetFileVO getMeetingFile(Map<String, String> params)
			throws SQLException {
		return (MeetFileVO) client.queryForObject("meetingFile.getMeetingFile", params);
	}

	@Override
	public void updateMeetingFile(MeetFileVO mfile) throws SQLException {
		client.update("meetingFile.updateMeetingFile", mfile);
	}

	@Override
	public String getfileCode(String meeting_code) throws SQLException {
		return (String) client.queryForObject("meetingFile.getfileCode", meeting_code);
	}


}
