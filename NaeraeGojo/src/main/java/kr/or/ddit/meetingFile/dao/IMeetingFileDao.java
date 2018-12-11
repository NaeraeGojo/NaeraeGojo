package kr.or.ddit.meetingFile.dao;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.vo.MeetFileVO;


public interface IMeetingFileDao{

	public void insertMeetingFile(MeetFileVO mfile) throws SQLException;

	public MeetFileVO getMeetingFile(Map<String, String> params)throws SQLException;

	public void updateMeetingFile(MeetFileVO mfile) throws SQLException;

	public String getfileCode(String meeting_code) throws SQLException;

}
